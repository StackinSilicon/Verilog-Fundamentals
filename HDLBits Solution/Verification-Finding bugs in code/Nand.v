module top_module (input a, input b, input c, output out);

    wire out1;
    andgate inst1 ( .a(a), .b(b), .c(c), .d(1'b1), .e(1'b1), .out(out1) );
    assign out = ~out1;

endmodule
