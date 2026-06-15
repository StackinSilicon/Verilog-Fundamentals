module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    integer i;
    
    always @(*)
        begin 
             out = 8'h00;
            
            for(i=0; i<255; i++) 
                if( in[i] == 1'b1) 
                    out = out + 8'h01;
                
            
        end

endmodule
