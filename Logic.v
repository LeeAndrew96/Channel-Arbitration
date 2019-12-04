`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andrew Lee
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
// Revision 0.1 - changed for states
// Revision 0.2 - Changed to output High Impedence when no grant provided 
// this means it only provides the grant well it is requested for. 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Logic(clk, ID0, ID1, ID2, ID3, ID4, ID5, ID6, ID7, grant);

input clk;
input ID0,ID1,ID2,ID3,ID4,ID5,ID6,ID7;
output [3:0] grant;
//output [2:0] state;

parameter  s0=3'b000,	s1=3'b001, 	s2=3'b010, 	s3=3'b011,  s4=3'b100;

reg [3:0] grant;
reg [2:0] state, nextstate;

initial begin
grant <= 4'bZZZZ;
state <= 3'b000;
nextstate <= 3'b000;
end

always @ (posedge clk)
begin
    if(ID7 == 1'b1)
        grant <= 7;
    else if(ID6 == 1'b1)
        grant <= 6;
    else if(ID5 == 1'b1)
        grant <= 5;
    else if(ID7 != 1'b1 && ID6 != 1'b1 && ID5 != 1'b1 &&(ID4 == 1'b1 || ID3 == 1'b1 || ID2 == 1'b1 || ID1 == 1'b1 || ID0 == 1'b1))
        begin 
            case(state)
                s0:
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
                    nextstate<=s4;
                 end
                 s4:
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
                     nextstate<=s3;
                 end
                 s3:
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
                     nextstate<=s2;
                 end
                 s2:
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
                     nextstate<=s1;
                 end
                 s1:
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
                    nextstate<=s0;
                 end
            endcase
 
        end
    else if(ID7 != 1'b1 && ID6 != 1'b1 && ID5 != 1'b1 && ID4 != 1'b1 && ID3 != 1'b1 && ID2 != 1'b1 && ID1 != 1'b1 && ID0 != 1'b1)
       grant<=4'bZZZZ;
       
   if(state!=nextstate)
        state<=nextstate;
             
end
endmodule