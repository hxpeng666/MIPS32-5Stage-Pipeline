`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:44:32 11/20/2024 
// Design Name: 
// Module Name:    MUX 
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
module MUX32_2_1(
    input [31:0] a0,  // 32-bit input a0
    input [31:0] a1,  // 32-bit input a1
    input s,          // Select signal
    output reg [31:0] y  // 32-bit output y
);

    always @(*) begin
        case (s)
            1'b0: y = a0;  // When s is 0, output a0
            1'b1: y = a1;  // When s is 1, output a1
            default: y = 32'hxxxxxxxx; // Undefined state
        endcase
    end

endmodule
