module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    integer i;
    reg [7:0] in_prev;
    
    always @(posedge clk) begin
        for(i=0; i<=7; i=i+1) begin
            pedge[i] <= in[i] & (~in_prev[i]);
            
            in_prev <= in;
        end
    end

endmodule
