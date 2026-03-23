`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:07:50 12/22/2024
// Design Name:   IF_ID_R
// Module Name:   F:/experiment/ex2/IF_ID_R_t.v
// Project Name:  ex2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF_ID_R
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IF_ID_R_t;

	// Inputs
	reg CLK;
	reg Reset;
	reg [31:0] IF_Inst;

	// Outputs
	wire [31:0] ID_Inst;

	// Instantiate the Unit Under Test (UUT)
	IF_ID_R uut (
		.CLK(CLK), 
		.Reset(Reset), 
		.IF_Inst(IF_Inst), 
		.ID_Inst(ID_Inst)
	);
    // 时钟信号生成
    always #5 CLK = ~CLK; // 时钟周期为 10ns

    // 测试程序
    initial begin
        // 初始化信号
        CLK = 0;
        Reset = 0;
        IF_Inst = 32'b0;

        // 复位信号低电平，观察模块是否清零
        #10 Reset = 0;
        IF_Inst = 32'hDEADBEEF; // 输入任意值，复位时不应影响输出
        #10;

        // 复位信号高电平，开始加载数据
        Reset = 1;
        #10 IF_Inst = 32'h12345678; // 模拟取指令阶段
        #10 IF_Inst = 32'h87654321; // 传递新的指令数据
        #10 IF_Inst = 32'hFFFFFFFF; // 模拟取最大值

        // 复位信号再次置低，输出应清零
        #10 Reset = 0;
        #10;

        // 停止仿真
        $stop;
    end

    // 仿真结果输出
    initial begin
        $monitor("Time: %0dns, CLK: %b, Reset: %b, IF_Inst: %h, ID_Inst: %h", 
                 $time, CLK, Reset, IF_Inst, ID_Inst);
    end

endmodule

