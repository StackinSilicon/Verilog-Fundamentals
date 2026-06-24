module top_module (
    input clk,
    input reset,
    output reg [3:0] q);
    
    always @(posedge clk) begin
        q <= 1;
        if(reset) 
            q <= 1;
        else if (q <= 9)
            q <= q + 1;
    end
endmodule
