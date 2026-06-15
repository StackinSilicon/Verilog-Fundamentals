module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] cw;
    
  
    
    genvar i;
    
    generate
        for(i=0; i<100; i++) begin: bcdLoop
            
            bcd_fadd a1( .a(a[4*i+3:4*i]),
                        .b(b[4*i+3:4*i]),
                        .cin(i == 0? cin: cw[i-1]),
                        .cout(i == 99? cout:cw[i]),
                        .sum(sum[4*i+3:4*i]));
        end
    endgenerate
            

endmodule
