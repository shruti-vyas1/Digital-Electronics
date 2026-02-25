// Half Adder
// Description: Implements Half Adder using gate-level modeling, data-flow and behavioural modelling.
// Author: Shruti
// Tool: Xilinx Vivado

// ---------------- Gate-Level Modeling ----------------
module half_adder(a, b, sum, carry);
input a, b;
output sum, carry;
xor g1(sum, a, b);
and g2(carry, a, b);
endmodule

//---------------- Data-Flow modelling---------------- 
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
assign sum = a ^ b;
assign carry = a & b;
endmodule

//---------------- Behavioural modelling---------------- 
module half_adder(a,b,sum,carry);
input a,b;
output reg sum,carry;
always @(a or b)
begin
    sum = a ^ b;
    carry = a & b;
end
endmodule


//---------------- Test Bench---------------- 
module tb_half_adder();
reg a,b;
wire sum,carry;
half_adder k1(a,b,sum,carry);
initial
begin
a=0;b=0;
#10 a=0;b=1;
#10 a=1;b=0;
#10 a=1;b=1;
end
endmodule
