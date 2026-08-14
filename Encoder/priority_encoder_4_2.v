`timescale 1ns / 1ps
module priority_encoder4_2(in,grant,valid);
input [3:0]in;
output reg valid;
output reg [1:0]grant;

always @(*)
begin
if(in[3])
begin
valid=1;
grant=2'b11;
end
else if(in[2])
begin
valid=1;
grant=2'b10;
end
else if(in[1])
begin
valid=1;
grant=2'b01;
end
else if(in[0])
begin
valid=1;
grant=2'b00;
end
else
begin
valid=0;
grant=2'b00;
end
end
endmodule

------------------TESTBENCH-----------------
module TB_priority_encoder_4_2();
reg[3:0]in;
wire valid;
wire [1:0]grant;
priority_encoder4_2 k1(in,grant,valid);
initial
begin
in=4'b1111;
#5;
in=4'b1000;
#5;
in=4'b0111;
#5;
in=4'b0100;
#5;
in=4'b0011;
#5;
in=4'b0010;
#5;
in=4'b0001;
#5;
in=4'b0000;
end
endmodule
