module top_module(clk, reset, in, out);
    input clk;
    input reset;    
    input in;
    output out;
    
    parameter A=0, B=1; 

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state <= B; 
        end else present_state <= next_state;
    end
    
    always @(*) begin
        case(present_state)
            B: next_state = in? B:A;
            A: next_state = in? A:B;
        endcase
    end
    
    assign out = present_state? B:A;
endmodule
