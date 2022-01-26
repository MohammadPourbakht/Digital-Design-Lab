`default_nettype none
`timescale 1ns/1ns

module multiplexer(w0 , w1 , s , flag , result);
    input [63:0] w0;
    input [63:0] w1;
    input s , flag;
    output reg [63:0] result;
    integer u = 0;

    always @(*) 
    begin
        if(flag==1)
            begin
                
                if(u==0)
                    result = 0;
                else
                    result = s ? w1 : w0;
            end 

        else if(flag==0)
            begin
                 result = s ? w1 : w0;
            end   

        u++;        
    end
      
endmodule 