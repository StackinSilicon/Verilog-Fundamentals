module top_module (
    input clk,
    input reset, 
    input s,
    input w,
    output z);

    parameter A = 0, B = 1;

 
    reg state, nstate;
    reg [1:0] count, check;

    always @(*) begin
  		case(state)
   			A : nstate = s?B:A;
   			B : nstate = B;
  endcase
 end
    
    always @(posedge clk) begin
        if(reset) begin
            state <= A;
        end else begin state <= nstate;
        end
    end

 
    always @(posedge clk) begin
        if (reset) begin
            count=0;
            check=0;
        end else begin
            if(state==B) begin
                if(check == 3)begin
                    count=0;
                    check=0;
                end
                
                if(w == 1) 
                    count=count+1;
                    check=check+1;
            end
        end
    end

    assign z = ((count == 2) & (check == 3) );
endmodule