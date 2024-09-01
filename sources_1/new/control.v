`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 23:44:58
// Design Name: 
// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control(
    input clk,
    input [2:0] OPC,
    output clk1,output clk2,output clk3,output clk4,output clk5
    );
assign clk1=(OPC==0)?clk:0; 
assign clk2=(OPC==1)?clk:0; 
assign clk3=(OPC==2)?clk:0; 
assign clk4=(OPC==3)?clk:0; 
assign clk5=(OPC==4)?clk:0; 
endmodule
