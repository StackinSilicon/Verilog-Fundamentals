module top_module ( );
    reg clk;
    dut mod (.clk(clk));
    
    initial begin
        clk = 0;
    end
    always #5 clk = ~clk;
    

endmodule