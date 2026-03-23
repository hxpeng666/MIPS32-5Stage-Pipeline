`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:52 12/22/2024 
// Design Name: 
// Module Name:    PCR 
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
module PCR(d_in, d_out, clk, reset,stall);
    input clk, reset,stall;
    input [31:0]  d_in;
    output [31:0]  d_out;
    reg [31:0] d_out;
always @ (posedge clk)
    if (reset==0)
	     begin
	     d_out <= 32'b0;
		 end 
    else if(~stall)
         begin
		 d_out <= d_in;
		 end
endmodule
