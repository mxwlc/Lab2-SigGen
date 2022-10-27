#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env)
{
    int i;
    int clk;

    // init top verilog instance
    Verilated::commandArgs(argc, argv);
    Vsinegen *top = new Vsinegen;
    // init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC *tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("sinegen.vcd");

    if (!vbdOpen())
        return (-1);
    vbdHeader("Lab 2: Sinegen");
    // initialise simulation links
    top->rst = 0;
    top->en = 1;
    top->incr = 1;

    // run simualtion for many clock cycles
    for (i = 0; i < 30000; i++)
    {
        for (clk = 0; clk < 2; clk++)
        {
            tfp->dump(2 * i + clk);
            top->clk = !top->clk;
            top->eval();
        }
        top->incr = vbdValue();
        vbdPlot(int(top->dout), 0, 255);
        vbdCycle(i + 1);
        if ((Verilated::gotFinish()) || (vbdGetkey() == 'q'))
            exit(0);
    }
    vbdClose();
    tfp->close();
    exit(0);
}