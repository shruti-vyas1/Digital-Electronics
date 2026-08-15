module JK_FF(clk,j,k,rst,q);
input j,k,clk,rst;
output reg q;
always@(posedge clk)
begin
if(rst)
q<=1'b0;
else
begin
case({j,k})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=~q;
endcase
end
end
endmodule

--------------TESTBENCH---------------
module TB_JK_FF();
reg j,k,clk,rst;
wire q;
JK_FF k1(clk,j,k,rst,q);
initial 
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1;j=0;k=0;#10;
rst=0;
j=1'b0;k=1'b0;#10;
j=1'b0;k=1'b1;#10;
j=1'b1;k=1'b0;#10;
j=1'b1;k=1'b1;#10;
j=1'b0;k=1'b0;#5;
$finish;
end
endmodule
