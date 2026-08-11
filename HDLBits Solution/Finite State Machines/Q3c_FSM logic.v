module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
 
    parameter [2:0] a = 3'b000,
                    b = 3'b001,
                    c = 3'b010,
                    d = 3'b011,
                    e = 3'b100;
    
    reg [2:0] nsy;
    
    always @(*) begin
        case(y)
            a: nsy = x?b:a;
            b: nsy = x?e:b;
            c: nsy = x?b:c;
            d: nsy = x?c:b;
            e: nsy = x?e:d;
            
            default: nsy = a;
        endcase 
    end
    
    assign z = ((y==d) || (y==e));
    
    assign Y0 = nsy[0];

endmodule
