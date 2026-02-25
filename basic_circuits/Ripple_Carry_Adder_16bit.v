// ---------------- 16-bit Ripple Carry Adder ----------------
module RCA16(a, b, cin, sum);
input [15:0] a, b;
input cin;
output [16:0] sum;
wire c1, c2, c3;
RCA4 m1(a[3:0],   b[3:0],   cin, c1, sum[3:0]);
RCA4 m2(a[7:4],   b[7:4],   c1, c2, sum[7:4]);
RCA4 m3(a[11:8],  b[11:8],  c2, c3, sum[11:8]);
RCA4 m4(a[15:12], b[15:12], c3, sum[16], sum[15:12]);
endmodule


// ---------------- Testbench ----------------
module RCA16_TB;
reg [15:0] a, b;
reg cin;
wire [16:0] sum;
reg [16:0] expected;
integer i;
RCA16 uut(a, b, cin, sum);
initial begin
    $display("Random Test for 16-bit RCA");
    
    for (i = 0; i < 50; i = i + 1) begin
        a   = $random;
        b   = $random;
        cin = $random % 2;     
        #10;
        
        expected = a + b + cin;
        if (sum !== expected) begin
            $display("Mismatch! A=%b B=%b Cin=%b | SUM=%b | Expected=%b", 
                      a, b, cin, sum, expected);
        end
    end
    
    $display("Testbench finished.");
end
endmodule
