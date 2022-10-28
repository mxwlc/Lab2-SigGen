module sinegen #(parameter WIDTH = 8
)(
    input wire [WIDTH-1:0] incr,
    input wire clk,
    input wire en,
    input wire rst,
    output wire [WIDTH-1:0] data1,
    output wire [WIDTH-1:0] data2
);
wire [WIDTH-1:0] addr1;
wire [WIDTH-1:0] addr2;

counter counter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .count (addr1)
);

offset offset1 (
    .counter_input(addr1),
    .offset (incr),
    .offset_address (addr2)
);

rom sinerom (
    .clk (clk),
    .addr1 (addr1),
    .addr2 (addr2),
    .dout1 (data1),
    .dout2 (data2)
);

endmodule
