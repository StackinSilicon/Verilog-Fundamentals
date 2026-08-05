module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    
    parameter [2:0] a = 3'b000,
                    b = 3'b001,
                    c = 3'b010,
                    d = 3'b011,
                    e = 3'b100;
    
    reg [2:0] psy, nsy;
    
    always @(posedge clk) begin
        if(reset) begin
            psy <= a;
        end else begin psy <= nsy;
        end
    end
    
    always @(*) begin
        case(psy)
            a: nsy = x?b:a;
            b: nsy = x?e:b;
            c: nsy = x?b:c;
            d: nsy = x?c:b;
            e: nsy = x?e:d;
            
            default: nsy = a;
        endcase 
    end
    
    assign z = ((psy==d) || (psy==e));

endmodule
