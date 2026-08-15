`timescale 1ns / 1ps
module register_4bit(clk,d,q);
input [3:0]d;
input clk;
output reg [3:0]q;

always@(posedge clk)
begin
q<=d;
end
endmodule

---------------------Testbench----------------------
`timescale 1ns / 1ps
module TB_register_4bit();
reg [3:0]d;
reg clk;
wire [3:0]q;
register_4bit k1(clk,d,q);
initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
d=4'b0000;#5;
d=4'b0001;#5;
d=4'b0010;#5;
d=4'b0011;#5;
d=4'b0100;#5;
d=4'b0110;#5;
d=4'b0111;#5;
$finish;
end
endmodule

