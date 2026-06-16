module top_module (input x, input y, output z);
    
    wire t1, t2, t3, t4, t5, t6, ti;
    
    assign ti = x ^ y;
    
    assign t1 = ti & x;
    assign t2 = ~(x ^ y);
    
    assign t3 = t1 | t2;
    assign t4 = t1 & t2;
    
    assign z = t3 ^ t4;

endmodule