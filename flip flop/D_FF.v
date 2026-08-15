module D_FF(D,Q,clk);
input clk,D;
output reg Q;
always@(posedge clk)
begin
Q<=D;
end
endmodule

-----------------TESTBENCH-----------------
module TB_DFF();
reg clk,D;
wire Q;
D_FF k1(D,Q,clk);
initial
begin
clk=0;
forever #5 clk=~clk;
end

initial 
begin
D=0;#5;
D=1;#7;
D=1;#10;
D=0;#10;
D=1;#5;
D=0;#2;
$finish;
end
endmodule
