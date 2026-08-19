module top_module (
    input clk,
    input reset, 
    input w,
    output z);
    
    parameter [2:0] A=3'b000, 
                    B=3'b001,
                    C=3'b010,
                    D=3'b011,
                    E=3'b100,
                    F=3'b101;
    
    reg [2:0] state, nstate;
    
    always @(posedge clk) begin
        if(reset) begin
            state <= A;
        end else begin state <= nstate;
        end
    end
    
    always @(*) begin
        case(state)
            A: nstate = w?A:B;
            B: nstate = w?D:C;
            C: nstate = w?D:E;
            D: nstate = w?A:F;
            E: nstate = w?D:E;
            F: nstate = w?D:C;
            default: nstate = A;
        endcase
    end
    
    assign z = ((state==E) || (state==F))?1:0;

endmodule
