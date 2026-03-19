module Bi_Gr_con(G0,G1,G2,G3,B0,B1,B2,B3);
input B0,B1,B2,B3;
output G0,G1,G2,G3;
assign G3=B3;
assign G2=B2^B3;
assign G1=B1^B2;
assign G0=B0^B1;
endmodule

//Testbench
module Bi_Gr_con_TB();
reg B0,B1,B2,B3;
wire G0,G1,G2,G3;
integer i;
Bi_Gr_con k1(G0,G1,G2,G3,B0,B1,B2,B3);

initial 
begin
$display("B3 B2 B1 B0 | G3 G2 G1 G0");
$monitor("%b %b %b %b | %b %b %b %b",B3,B2,B1,B0,G3,G2,G1,G0);

for(i=0;i<16;i=i+1)begin
{B3,B2,B1,B0} = i;
#10;
end
$finish;
end
endmodule
