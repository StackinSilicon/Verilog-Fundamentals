module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    
    wire [7:0] i1, i2, i3;

    assign i1 = (a<b)? a:b;
    assign i2 = (i1<c)? i1:c;
    assign i3 = (i2<d)? i2:d;
    
    assign min = i3;

endmodule
