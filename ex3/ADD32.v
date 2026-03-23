`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:48 12/22/2024 
// Design Name: 
// Module Name:    ADD32 
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

module ADD32(Cin,A,B,Add_Carry,Add_Overflow,Add_Sign,Add_Result,Zero
    );
 input  Cin;
 input [31:0] A,B;
 output Add_Carry,Add_Overflow,Add_Sign,Zero;
 output [31:0] Add_Result;
 
 wire [31:0] Cin32,DataB;
 wire Cout;
 
 assign Cin32={32{Cin}};
 assign DataB=B^Cin32;
 assign {Cout,Add_Result}=A+DataB+Cin;
 assign Add_Carry=Cout;//注意这个信号与CF的区别
 assign Add_Sign=Add_Result[31];
 assign Zero=~|Add_Result;
 assign Add_Overflow=(A[31]&DataB[31]&~Add_Result[31])|(~A[31]&~DataB[31]&Add_Result[31]);//注意这里的判定方法，按照教材的话求Cn-1很麻烦
 
endmodule
