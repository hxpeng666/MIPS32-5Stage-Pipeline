`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:59 12/22/2024 
// Design Name: 
// Module Name:    MUX32_4_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX32_4_1(A,B,C,D,S,Result);
input [31:0] A,B,C,D;
input [1:0] S;
output [31:0] Result;
reg [31:0] Result;
always @(*) begin
case(S) 
2'b00: Result=A;
2'b01: Result=B;
2'b10: Result=C;
2'b11: Result=D;
endcase
end
endmodule