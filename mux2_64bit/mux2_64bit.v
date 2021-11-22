module mux2_64bit (w0, w1, s, f);
    input  s;
    input [63:0] w0;
    input [63:0] w1;
    output [63:0] f;

    assign f = s ? w1 : w0;
    
endmodule