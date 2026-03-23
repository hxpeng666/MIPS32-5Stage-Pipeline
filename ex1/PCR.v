`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:51 11/20/2024 
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
module PCR(
    input [31:0] d_in,  // 32-bit data input
    input clk,          // Clock signal
    input reset,        // Reset signal, active low
    output reg [31:0] d_out // 32-bit data output
);

    always @(posedge clk or posedge reset)
		begin
			if (reset)
				d_out <= 32'h00000004;  // 从地址4开始，避免0可能为空值的情况
			else
				d_out <= d_in;
		end
endmodule

