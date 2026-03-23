`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:01 12/21/2024 
// Design Name: 
// Module Name:    DataMem 
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
module DataMem(we,addr,datain,clk,dataout
    );
	 input [31:0] datain;
	 input [4:0] addr;
	 input clk,we;
	 output [31:0] dataout;
	 
	 reg [31:0] ram [0:31];
	 assign dataout=ram[addr];		//读出常有效
	 always @(posedge clk)begin
	 if(we)ram[addr]=datain;
	 end
	 
	 integer i;
	 initial begin		//存储器初始化
	 for(i=0;i<11;i=i+1)				
	    ram[i]=i;
	 for(i=11;i<32;i=i+1)				
	    ram[i]=0;
     end
	 
endmodule
