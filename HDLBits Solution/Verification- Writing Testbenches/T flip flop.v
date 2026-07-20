module top_module ();
    reg clk=0;
    reg reset;
    reg t;
    wire q;
    
    tff dut(clk, reset, t, q);
    
    always #5 clk = ~clk;

    initial begin
        #0; reset = 1; t=0;
        #10; reset = 0;
        #10; t = 1;
        #10;$finish;
    end
        
endmodule
