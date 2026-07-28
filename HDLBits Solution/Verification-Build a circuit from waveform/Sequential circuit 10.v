module top_module (
    input clk,
    input a,
    input b,
    output reg q,
    output reg state);
    

    always @(posedge clk) begin
        if(( a && b) || ( ~a && ~b)) begin
            state <= a;
        end else begin state <= state;
        end
    end
    
    assign q = (( a && b) || ( ~a && ~b))? state : ~state;
    
endmodule
