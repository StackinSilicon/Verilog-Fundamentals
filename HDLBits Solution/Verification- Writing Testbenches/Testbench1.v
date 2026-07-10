module top_module ( output reg A, output reg B );

   
    initial begin
        #0; A = 0; B=0;
        #10; A=1; B=0;
        #5; A=1; B=1;
        #5; A=0; B=1;
        #20; A=0; B=0;
    end

endmodule
