module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    reg [3:0] state, nstate;
    
    parameter s=1,
              s1=2,
              s11=3,
              s110=4,
    
              b0=5,
              b1=6,
              b2=7,
              b3=8,
              
              count=9,
              hold=10;
    
    always @(posedge clk) begin
        if(reset) begin
            state <= s;
        end else begin state <= nstate;
        end
    end
    
    always @(*) begin
        case(state) 
            s: nstate = (data)?s1:s;
            s1: nstate = (data)?s11:s;
            s11: nstate = (data)?s11:s110;
            s110: nstate = (data)?b0:s;
            
            b0: nstate = b1;
            b1: nstate = b2;
            b2: nstate = b3;
            b3: nstate = count;
            
            count: nstate = (done_counting)?hold:count;
            
            hold: nstate = ack?s:hold;
            
            default: nstate = s;
        endcase
    end
    
    assign shift_ena = (state==b0 | state==b1 | state==b2 | state==b3);
    
    assign counting = (state == count);
    
    assign done = (state == hold);

endmodule
