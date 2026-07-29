module top_module (
    input clk,
    input reset,   
    input w,
    output reg z
);
    reg [2:0] state, nstate;
    
    parameter A= 3'b000,
              B= 3'b001,
              C= 3'b010,
              D= 3'b011,
              E= 3'b100,
              F= 3'b101;
    
    always @(posedge clk) begin
        if(reset) begin
            state <= A;
        end else begin state <= nstate;
        end
    end
    
    always @(*) begin
        case(state)
            A: nstate = w?B:A;
            B: nstate = w?C:D;
            C: nstate = w?E:D;
            D: nstate = w?F:A;
            E: nstate = w?E:D;
            F: nstate = w?C:D;
        endcase
    end
    
    assign z = ((state == E) || (state == F))? 1:0; 

endmodule
