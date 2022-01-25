`default_nettype none
`timescale 1ns/1ns

module imm_gen(instruction , result);
input [31:0] instruction;
output reg [63:0] result;
reg [63:0] temp;

always @ (*)
begin
    if (instruction[6:0] == 7'b0100011)
        temp = {{53{instruction[31]}} , instruction[30:25] , instruction[11:7]};

    if (instruction[6:0] == 7'b1100111)
        temp = {{53{instruction[31]}} , instruction[7] , instruction[30:25] , instruction[11:8]};

    if (instruction[6:0] == 7'b0000011)
        temp = {{53{instruction[31]}} , instruction[30:20]};

    result = temp;
end

endmodule