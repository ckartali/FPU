`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 06:54:41
// Design Name: 
// Module Name: ieeeadd
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


module ieeesub(input opc,
    output reg [31:0] out,
    input clk,
    input [31:0] A,
    input [31:0] B
    );
reg [7:0]e_sam,e_diff;
reg [23:0]m;
reg [24:0]m_add,m_sub;
reg [4:0]i_baf=23,i=23;
reg x=0;
reg [31:0]X1,X2,X3;
always @(posedge clk)
    begin
    if(opc==0)
    begin
        X1=(A[30:0]>B[30:0])?A:B;
        X2=(A[30:0]<B[30:0])?A:B;
        out[31]=X1[31];
        e_diff=X1[30:23]-X2[30:23];
        e_sam=X1[30:23];
        m={1'b1,X2[22:0]}>>e_diff;
        if(X1[31]==X2[31])
            begin
                m_add={1'b1,X1[22:0]}+m;
                out[22:0]=(m_add[24]==1)?m_add[23:1]:m_add[22:0];
                out[30:23]=(m_add[24]==1)?(e_sam+1):e_sam;      
            end
         else
            begin
                m_add={1'b1,X1[22:0]}-m;
                i_baf=23;i=23; x=0;
                for (i=23;i>0;i=i-1)
                      begin
                           if((m_add[i]==1) && (x==0))
                                  begin
                                     i_baf=i;
                                     x=1;
                                     end
                       end
                 m_sub[23:0]=m_add[23:0]<<(23-i_baf);
                 out[22:0]=m_sub[22:0];
                 out[30:23]=e_sam-(23-i_baf);       
            end
        
    end 
        else
        begin
        X3={~B[31],B[30:0]};
        X1=(A[30:0]>B[30:0])?A:X3;
        X2=(A[30:0]<B[30:0])?A:X3;
        out[31]=X1[31];
        e_diff=X1[30:23]-X2[30:23];
        e_sam=X1[30:23];
        m={1'b1,X2[22:0]}>>e_diff;
        if(X1[31]==X2[31])
            begin
                m_add={1'b1,X1[22:0]}+m;
                out[22:0]=(m_add[24]==1)?m_add[23:1]:m_add[22:0];
                out[30:23]=(m_add[24]==1)?(e_sam+1):e_sam;      
            end
         else
            begin
                m_add={1'b1,X1[22:0]}-m;
                i_baf=23;i=23; x=0;
                for (i=23;i>0;i=i-1)
                      begin
                           if((m_add[i]==1) && (x==0))
                                  begin
                                     i_baf=i;
                                     x=1;
                                     end
                       end
                 m_sub[23:0]=m_add[23:0]<<(23-i_baf);
                 out[22:0]=m_sub[22:0];
                 out[30:23]=e_sam-(23-i_baf);       
            end
        
    end      
    end
endmodule
