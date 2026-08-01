module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter [2:0] LEFT = 3'B000,
                    RIGHT = 3'B001,
                    DIG_L = 3'B010,
                    DIG_R = 3'B011,
                    FALL_L = 3'B100,
                    FALL_R = 3'B101;
    
    reg [2:0] state, nstate;
    
    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <= LEFT;
        end else begin state <= nstate;
        end
    end
    
    always @(*) begin
        case(state)
            LEFT: if(!ground) begin
                    nstate = FALL_L;
            end else if(dig) begin
                nstate = DIG_L;
            end else if(bump_left) begin
                nstate = RIGHT;
            end else begin nstate = LEFT; end
            
            RIGHT: if(!ground) begin
                    nstate = FALL_R;
            end else if(dig) begin
                nstate = DIG_R;
            end else if(bump_right) begin
                nstate = LEFT;
            end else begin nstate = RIGHT; end
            
            DIG_L: nstate = ground? DIG_L:FALL_L;
            
            DIG_R: nstate = ground? DIG_R:FALL_R;
            
            FALL_L: nstate = ground? LEFT: FALL_L;
            
            FALL_R: nstate = ground? RIGHT: FALL_R;
            
            default: nstate = LEFT;
            
        endcase
    end
    
    assign walk_left = (state == LEFT);
    
    assign walk_right = (state == RIGHT);
    
    assign aaah = ((state == FALL_L) || (state == FALL_R))? 1:0;
    
    assign digging = ((state == DIG_L) || (state == DIG_R))? 1:0;
            

endmodule
