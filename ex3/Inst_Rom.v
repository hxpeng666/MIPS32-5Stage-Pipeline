`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:27 12/22/2024 
// Design Name: 
// Module Name:    Inst_Rom 
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
module Inst_Rom(pc,inst);
    input [4:0]pc;
    output [31:0]inst;
    wire [31:0] rom [0:31]; 
assign rom[5'h00]=32'h0;					//空指令	 assign rom[5'h01]=32'b000000_00010_00011_00001_00000_100000;	//add r1,r2,r3  r1=0x5  h00430820;	 assign rom[5'h02]=32'b000000_00001_00011_00010_00000_100000;	//add r2,r1,r3  r2=0x8  		 assign rom[5'h03]=32'b000000_00100_00010_00011_00000_100010;	//sub r3,r4,r2  r3=0xfffffffc 	 	 assign rom[5'h04]=32'b000000_00011_00101_00100_00000_100011;	//subu r4,r3,r5  r4=0xfffffff7 	 assign rom[5'h05]=32'b000000_00110_00100_00101_00000_101010;	//slt r5,r6,r4  r5=0x0	 assign rom[5'h06]=32'b000000_00101_00111_00110_00000_101011;  	 //sltu r6,r5,r7  r6=0x1		 assign rom[5'h07]=32'b001101_00110_00111_00000_00000_001000;   	//ori r7,r6,0x8  r7=0x9  	 assign rom[5'h08]=32'b001001_00111_01000_00000_00000_000100;   	//addiu r8,r7,4  r8=0xd  	 assign rom[5'h09]=32'b100011_01000_01000_00000_00000_000010;   	//lw r8,r8,0x2 r8=mem[0xf]=0  	 assign rom[5'h0A]=32'b101011_01000_01000_00000_00000_000010;   	//sw r8,r8,0x2 mem[2]=r8=0 	 assign rom[5'h0B]=32'b000100_01000_00011_00000_00000_000001;   	//beq r8,r3,0x1  正常不跳转 	 assign rom[5'h0C]=32'b000100_00011_00011_00000_00000_000001;   	//beq r3,r3,0x1  正常跳转到E	 assign rom[5'h0D]=32'b000010_00000_00000_00000_00000_001000;   	//jump 0x8 跳转到地址8，执行lw指令
	 assign rom[5'h0E] = 32'h00000000;
     assign rom[5'h0F] = 32'h00000000;
     assign rom[5'h10] = 32'h00000000;
     assign rom[5'h11] = 32'h00000000;
     assign rom[5'h12] = 32'h00000000;
     assign rom[5'h13] = 32'h00000000;
     assign rom[5'h14] = 32'h00000000;
     assign rom[5'h15] = 32'h00000000;
     assign rom[5'h16] = 32'h00000000;
     assign rom[5'h17] = 32'h00000000;
     assign rom[5'h18] = 32'h00000000;
     assign rom[5'h19] = 32'h00000000;
     assign rom[5'h1A] = 32'h00000000;
     assign rom[5'h1B] = 32'h00000000;
     assign rom[5'h1C] = 32'h00000000;
     assign rom[5'h1D] = 32'h00000000;
     assign rom[5'h1E] = 32'h00000000;
     assign rom[5'h1F] = 32'h00000000;
assign inst=rom[pc];		 
endmodule

