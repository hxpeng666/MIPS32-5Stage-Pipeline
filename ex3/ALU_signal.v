`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:37:24 12/22/2024 
// Design Name: 
// Module Name:    ALU_signal 
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
module ALU_signal(ALUctr,SUBctr,OVctr,SIGctr,OPctr
    );
    input [2:0] ALUctr;
    output SUBctr,OVctr,SIGctr;
    output [1:0] OPctr;
    
    /*reg SUBctr,OVctr,SIGctr;
    reg [1:0] OPctr;
    always @ (*) begin
    case( ALUctr)
    3'b000:begin SUBctr=0;OVctr=0;SIGctr=0;OPctr=2'b00; end
    3'b001:begin SUBctr=0;OVctr=1;SIGctr=0;OPctr=2'b00; end
    3'b010:begin SUBctr=0;OVctr=0;SIGctr=0;OPctr=2'b01; end
    3'b100:begin SUBctr=1;OVctr=0;SIGctr=0;OPctr=2'b00; end
    3'b101:begin SUBctr=1;OVctr=1;SIGctr=0;OPctr=2'b00; end
    3'b110:begin SUBctr=1;OVctr=0;SIGctr=0;OPctr=2'b10; end
    3'b111:begin SUBctr=1;OVctr=0;SIGctr=1;OPctr=2'b10; end
    default: begin SUBctr=1'bx;OVctr=1'bx;SIGctr=1'bx;OPctr=2'bxx; end
    endcase
    end*/
    
    assign SUBctr=ALUctr[2];
    assign OVctr=~ALUctr[1]&ALUctr[0];
    assign SIGctr=ALUctr[2]&ALUctr[1]&ALUctr[0];
    assign OPctr[1]=ALUctr[2]&ALUctr[1];
    assign OPctr[0]=~ALUctr[2]&ALUctr[1]&~ALUctr[0];
    
endmodule
