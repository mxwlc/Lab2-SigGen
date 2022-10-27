module counter #(
    parameter WIDTH = 8
)
(
    // interface signals
    input logic [WIDTH-1:0] incr,
    input logic clk, // clock
    input logic rst, // reset
    input logic en, // counter enable
    output logic [WIDTH-1:0] count // counter output
);

always_ff @ (posedge clk, posedge rst)
    if (rst) count <= {WIDTH{1'b0}};
    else if(en) count <= count + incr;
endmodule
