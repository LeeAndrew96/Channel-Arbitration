`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 08:37:12 AM
// Design Name: 
// Module Name: Logic_tb
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


module Logic_tb();

reg clk,ID0,ID1,ID2,ID3,ID4,ID5,ID6,ID7;
wire [3:0]grant;
//wire [2:0]state, nextstate;
//wire X;

Logic UUT(clk, ID0, ID1, ID2, ID3, ID4, ID5, ID6, ID7, grant);

initial begin
clk=1;
ID0=0;
ID1=0;
ID2=0;
ID3=0;
ID4=0;
ID5=0;
ID6=0;
ID7=0;
end

always
#5 clk=~clk;

initial begin
    #10;
    ID7 = 1;
    ID4 = 0;
    #10;
    ID7 = 0;
    ID4 = 0;
    #10
    ID2 = 1;
    ID4 = 1;
    #10;
    ID2 = 0;
    ID4 = 0;
    ID7 = 1;
    #10;
    ID7 = 0;
    ID2 = 1;
    ID4 = 1;
    #10;
    ID2 = 0;
    ID4 = 0;
    #10;
    ID3 = 1;
    ID1 = 1;
    #10;
    ID3 = 0;
    ID1 = 0;
    
end
endmodule
