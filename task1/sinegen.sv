module sinegen #(parameter WIDTH = 8
)(
    input wire [WIDTH-1:0] incr,
    input wire clk,
    input wire en,
    input wire rst,
    output wire [WIDTH-1:0] dout
);
wire [WIDTH-1:0] addr;

counter counter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (addr)
);

rom sinerom (
    .clk (clk),
    .addr (addr),
    .dout (dout)
);
endmodule
