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


module ieeeadd(
    output reg [31:0] out,
    input clk,
    input [31:0] A,
    input [31:0] B
    );
reg [24:0]m_sam;
reg [31:0] out=0;
reg [7:0]e_sam,e_diff;
reg [22:0]m;
reg [24:0]m_add;
always @(posedge clk)
    begin
    if(A[30:23]==B[30:23])
        begin
            if(A[31]==B[31])
                begin
                    m_sam={1'b1,A[22:0]}+{1'b1,B[22:0]};
                    out[31]=A[31];
                end
            else
                begin
                    if(A[22:0]>B[22:0])
                        begin            
                            m_sam={1'b1,A[22:0]}-{1'b1,B[22:0]};
                            out[31]=A[31];
                        end
                    else  
                        begin
                             m_sam={1'b1,B[22:0]}-{1'b1,A[22:0]};
                             out[31]=B[31];
                        end
                end
            out[22:0]=(m_sam[24]==1)?m_sam[23:1]:m_sam[22:0];
            out[30:23]=(m_sam[24]==1)?(A[30:23]+1):A[30:23];
            
        end
      else
        begin
            if(A[30:0]>B[30:0])
                begin
                    e_sam=A[30:23];
                    e_diff=A[30:23]-B[30:23];
                    m=({1'b1,B[22:0]}>>(e_diff));
                end
             else
                begin
                    e_sam=B[30:23];
                    e_diff=B[30:23]-A[30:23];
                    m=({1'b1,A[22:0]}>>(e_diff));
                end
            // m=(A [22:0]>B[22:0])?({1'b1,B[22:1]}>>e_diff):({1'b1,A[22:1]}>>e_diff);
            // m=(A[30:23]>B[30:23])?({1'b1,B[22:1]}>>(e_diff-1)):({1'b1,A[22:1]}>>(e_diff-1));
             if(A[31]==B[31])
                begin
                     m_add=(A[30:0]>B[30:0])? ({1'b1,A[22:0]}+{1'b0,m}):({1'b1,B[22:0]}+{1'b0,m});
                     out[31]=A[31];
                end
             else
                begin
                     m_add=(A[30:0]>B[30:0])? ({1'b1,A[22:0]}-{1'b0,m}):({1'b1,B[22:0]}-{1'b0,m}); 
                     out[31]=(A[30:0]>B[30:0])? A[31]:B[31]; 
                end     
             out[22:0]=(m_add[24]==1)?m_add[23:1]:m_add[22:0];
             out[30:23]=(m_add[24]==1)?(e_sam+1):e_sam;                
        end  
    end        
    
endmodule
