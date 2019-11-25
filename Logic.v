`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2019 08:22:39 AM
// Design Name: 
// Module Name: Logic
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


module Logic(clk, ID0, ID1, ID2, ID3, ID4, ID5, ID6, ID7, grant);

input clk;
input ID0,ID1,ID2,ID3,ID4,ID5,ID6,ID7;
output [3:0] grant;

reg [3:0] grant;

integer i;

always @ (posedge clk)
begin
    if(ID7 == 1'b1)
        grant <= 7;
    else if(ID6 == 1'b1)
        grant <= 6;
    else if(ID5 == 1'b1)
        grant <= 5;
    else if(ID7 != 1'b1 && ID6 != 1'b1 && ID5 != 1'b1)
        begin 
            if(grant==0 || grant==5 || grant==6 || grant==7)
                 begin
                    if(ID4 == 1'b1)
                        grant <= 4;
                    else if(ID3 == 1'b1)
                        grant <= 3;
                    else if(ID2 == 1'b1)
                        grant <= 2;
                     else if(ID1 == 1'b1)
                        grant <= 1;
                     else if(ID0 == 1'b1)
                        grant <= 0;
                 end
                 if(grant==4)
                 begin
                    if(ID3 == 1'b1)
                        grant <= 3;
                    else if(ID2 == 1'b1)
                        grant <= 2;
                    else if(ID1 == 1'b1)
                        grant <= 1;
                     else if(ID0 == 1'b1)
                        grant <= 0;
                     else if(ID4 == 1'b1)
                        grant <= 4;
                 end
                 if(grant==3)
                 begin
                    if(ID2 == 1'b1)
                        grant <= 2;
                    else if(ID1 == 1'b1)
                        grant <= 1;
                    else if(ID0 == 1'b1)
                        grant <= 0;
                     else if(ID4 == 1'b1)
                        grant <= 4;
                     else if(ID3 == 1'b1)
                        grant <= 3;
                 end
                 if(grant==2)
                 begin
                    if(ID1 == 1'b1)
                        grant <= 1;
                    else if(ID0 == 1'b1)
                        grant <= 0;
                    else if(ID4 == 1'b1)
                        grant <= 4;
                     else if(ID3 == 1'b1)
                        grant <= 3;
                     else if(ID2 == 1'b1)
                        grant <= 2;
                 end
                 if(grant==1)
                 begin
                    if(ID0 == 1'b1)
                        grant <= 0;
                    else if(ID4 == 1'b1)
                        grant <= 4;
                    else if(ID3 == 1'b1)
                        grant <= 3;
                     else if(ID2 == 1'b1)
                        grant <= 2;
                     else if(ID1 == 1'b1)
                        grant <= 1;
                 end
            end
        end
  //  end
endmodule
