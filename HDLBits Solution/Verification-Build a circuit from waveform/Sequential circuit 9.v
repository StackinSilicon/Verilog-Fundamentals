module top_module (
    input clk,
    input a,
    output reg [3:0] q );
    
    always @(posedge clk) begin
        if(a) begin
            q <= 4'd4;
        end else begin q <= (q == 4'd6)? 0: q+1;
        end
    end
endmodule
