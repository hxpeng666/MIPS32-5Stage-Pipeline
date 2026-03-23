`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:15 12/22/2024 
// Design Name: 
// Module Name:    MUX5_2_1 
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

module MUX5_2_1(a0,a1,s,y);
    input [4:0]a0, a1;
    input s;
    output reg [4:0]y;
always @ (*) begin
    case (s)
	    0: y=a0;
        1: y=a1;
        default:y=32'hxxxxxxxx;   
    /* assign y = (s == 1'b0) ? a0 : a1; */
    endcase
end
endmodule