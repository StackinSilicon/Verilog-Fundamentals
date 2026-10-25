module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [2:0] state1, nstate1;
    
    parameter a=1, b=2, c=3, d=4, e=5;
    
    always @(posedge clk) begin
        if(reset) begin
            state <= a;
        end else begin state <= nstate;
        end
    end
    
    always @(*) begin
        case(state) 
            a: nstate = b;
            b: nstate = c;
            c: nstate = d;
            d: nstate = e;
            e: nstate = e;
            default: nstate = a;
        endcase 
    end
    
    assign shift_ena = (state==a | state==b | state==c | state==d);
    
endmodule
