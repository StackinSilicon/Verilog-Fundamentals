module top_module(
    input clk,
    input in,
    input areset,
    output out);
    
    parameter A=2'b00,B=2'b01,C=2'b10,D=2'b11;

    reg [1:0] cur,nxt;
    
    always @(posedge clk or posedge areset) begin
        if(areset)
            cur <= A;
        else cur <= nxt; 
    end 
    always @(*) begin  
        case(cur)
            A: nxt = in? B:A;
            B: nxt = in? B:C;
            C: nxt = in? D:A;
            D: nxt = in? B:C;
            default: nxt = A;
        endcase
    end

    assign out = (cur == D);

endmodule
