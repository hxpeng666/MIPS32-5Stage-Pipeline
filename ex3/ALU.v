`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:36:49 12/22/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(A,B,ALUctr,Zero,Overflow,Result);
input [31:0] A,B;
input [2:0] ALUctr;
output Zero,Overflow;
output [31:0] Result;

wire [1:0] OPctr;
wire [31:0] Cin32,DataB,AorB,Add_Result,cmpdata;
wire SUBctr,OVctr,SIGctr,Add_Carry,Add_Overflow,Add_Sign,CF,cmpResult,Less;

assign AorB=A|B;
ADD32 U1(SUBctr,A,B,Add_Carry,Add_Overflow,Add_Sign,Add_Result,Zero);
xor (CF,SUBctr,Add_Carry);
xor (cmpResult,Add_Overflow,Add_Sign);
and (Overflow,Add_Overflow,OVctr);
MUX1_2_1 U2(CF,cmpResult,SIGctr,Less);
MUX32_2_1 U3(0,1,Less,cmpdata);
MUX32_4_1 U4(Add_Result,AorB,cmpdata,32'hxxxxxxxx,OPctr,Result);
ALU_signal U5(ALUctr,SUBctr,OVctr,SIGctr,OPctr);

endmodule
