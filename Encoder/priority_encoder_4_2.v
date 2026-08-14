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
