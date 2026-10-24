module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    reg [2:0] state, nstate;
    
    parameter a=3'b000,
              b=3'b001,
              c=3'b010,
              d=3'b011,
              e=3'b100;
    
    always @(posedge clk) begin
        if(reset) begin
            state <= a;
        end else begin state <= nstate;
        end
  
    end
    
    always @(*) begin
        case(state)
            a: begin if(data == 1) nstate = b;
                else nstate = a; end
            b: begin if(data == 1) nstate = c;
                else nstate = a; end
            c: begin if(data == 1) nstate = c;
                else nstate = d; end
            d: begin if(data == 1) nstate = e;
                else nstate = a; end
            e: nstate = e;
            default: nstate = a;
        endcase
    end

    assign start_shifting = (state == e);
    
endmodule
