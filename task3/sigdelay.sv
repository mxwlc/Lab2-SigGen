module sigdelay #(
    parameter DATA_WIDTH = 8,
    ADDRESS_WIDTH = 9
) (
    input logic clk,
    input logic rst,
    input logic wr,
    input logic rd,
    input logic clk_en,
    input logic [DATA_WIDTH-1:0] mic_signal,
    input logic [ADDRESS_WIDTH-1:0] offset,
    output logic [DATA_WIDTH-1:0] delayed_signal

);

logic [ADDRESS_WIDTH-1:0] address;

counter counter(
    .clk(clk),
    .rst(rst),
    .en(clk_en),
    .count(address)
);

twoportram signal_ram(
    .clk(clk),
    .wr_addr(address+offset),
    .rd_addr(address),
    .din(mic_signal),
    .wr_en(wr),
    .rd_en(rd),
    .dout(delayed_signal)
);

endmodule
