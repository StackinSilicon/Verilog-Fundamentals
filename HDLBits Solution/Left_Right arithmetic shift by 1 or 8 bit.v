module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @(posedge clk) begin
        if(load) begin
            q <= data;
        end else begin
            case(amount)
                2'b00: q <= ena?{q[62:0],1'b0}:q;
                2'b01: q <= ena?{q[55:0],8'b0}:q;
                2'b10: q <= ena?{q[63],q[63:1]}:q;
                2'b11: q <= ena?{{8{q[63]}},q[63:8]}:q;
            endcase
        end   
    end
endmodule
