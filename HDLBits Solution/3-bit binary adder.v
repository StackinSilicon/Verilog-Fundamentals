module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    fA fa1( .a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .s(sum[0]));
    fA fa2( .a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .s(sum[1]));
    fA fa3( .a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .s(sum[2]));

endmodule

module fA (
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin; 
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
