// ---------------- 8-bit Adder Using Operators ----------------
module eight_bit_adder(a, b, cin, sum, cout);
    input  wire [7:0] a, b;
    input  wire cin;
    output wire [7:0] sum;
    output wire cout;
    wire [8:0] temp_sum;
    assign temp_sum = a + b + cin;
    assign sum  = temp_sum[7:0];  
    assign cout = temp_sum[8];    
endmodule


// ---------------- Test-Bench ----------------
module tb_eight_bit_adder;
    reg [7:0] a, b;
    reg cin;
    wire [7:0] sum;
    wire cout;
    reg [8:0] expected;
    integer i;

    eight_bit_adder uut(a, b, cin, sum, cout);

    initial begin
        $display("Testing 8-bit adder using operators");
        for (i = 0; i < 50; i = i + 1) begin
            a = $random % 256; // 8-bit random
            b = $random % 256;
            cin = $random % 2; // 1-bit carry
            #5;
            expected = a + b + cin;
            if ({cout, sum} !== expected)
                $display("Mismatch! A=%b B=%b Cin=%b | SUM=%b | Expected=%b", 
                          a, b, cin, sum, expected);
        end
        $display("8-bit adder test completed.");
    end
endmodule
