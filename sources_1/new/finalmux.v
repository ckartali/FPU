`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 00:29:21
// Design Name: 
// Module Name: finalmux
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


module finalmux(
    input [31:0] add1,
    input [31:0] sub1,
    input [31:0] mul1,
    input [31:0] div1,
    input ce,
    input cg,
    input cl,
    input [2:0] opc,
    output reg [31:0] OUT,
    output reg AEB,
    output reg AGB,
    output reg ALB
    );
always @ (opc,add1,sub1,mul1,div1,ce,cg,cl)
begin
    if(opc==0)
        begin
        OUT=add1;
        AEB=0;AGB=0;ALB=0;
        end
    else if(opc==1)
        begin
        OUT=sub1;
        AEB=0;AGB=0;ALB=0;
        end
    else if(opc==2)
        begin
        OUT=mul1;
        AEB=0;AGB=0;ALB=0;
        end
    else if(opc==3)
        begin
        OUT=div1;
        AEB=0;AGB=0;ALB=0;
        end
    else if (opc==4)
        begin
        OUT=0;
        AEB=ce;ALB=cl;AGB=cg;
        end
    else
    begin
    OUT=0;
     AEB=0;ALB=0;AGB=0;
     end
end
endmodule
