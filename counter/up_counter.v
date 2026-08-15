module counter(q,clk,rst);
input clk,rst;
output reg[3:0]q;

always@(posedge clk)
begin
if(rst)
q=4'b0000;
else
q<=q+1'b1;
end
endmodule


------------Testbench---------------
module TB_counter();
reg clk,rst;
wire [3:0]q;
counter k1(q,clk,rst);

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1;#10;
rst=0;#50
$finish;
end
endmodule
