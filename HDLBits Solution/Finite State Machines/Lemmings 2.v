module top_module(
    input clk,
    input areset,    
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter [1:0] LEFT=2'b00,
                    RIGHT=2'b01,
                    FALL_L=2'b10,
                    FALL_R=2'b11;
    reg [2:0] state, next_state;

    always @(*) begin
        case(state)
            LEFT: if(!ground) begin
                     next_state = FALL_L;
            end else if(bump_left) begin next_state = RIGHT ; end
            else begin next_state = LEFT;
            end
            RIGHT:if(!ground) begin
                     next_state = FALL_R;
                end else if(bump_right) begin next_state = LEFT; end
            else begin next_state = RIGHT;
            end
            
            FALL_L: next_state = ground? LEFT: FALL_L;
            
            FALL_R: next_state = ground? RIGHT: FALL_R;
            
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <= LEFT;
        end else begin state <= next_state;
        end
    end
        

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = ((state == FALL_L) || (state == FALL_R))? 1:0;

endmodule

