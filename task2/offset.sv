module offset #(
    WIDTH = 8
) (
    input [WIDTH-1:0] counter_input,
    input [WIDTH-1:0] offset,
    output [WIDTH-1:0] offset_address
);

assign offset_address = counter_input + offset;
    
endmodule
