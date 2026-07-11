module top_module(
    input clk,
    input areset,    
    input in,
    output out);

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    
        case (state)
            B: begin
                if(in) 
                    next_state = B;
                else next_state = A; end
            A: begin
                if(in)
                    next_state = A;
                else next_state = B;
            end
            default: next_state = B;
        endcase
            
    end

    always @(posedge clk, posedge areset) begin    
        if(areset) begin
            state <= B;
        end else begin
            state <= next_state;
        end 
    end

   
    assign out = (state == B);

endmodule
