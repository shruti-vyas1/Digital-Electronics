module Adder_Subtractor_4bit(a,b,cin,cout,s);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire w,x,y,z;
wire c1,c2,c3;

xor k1(w,cin,b[0]);
xor k2(x,cin,b[1]);
xor k3(y,cin,b[2]);
xor k4(z,cin,b[3]);

FA k5(a[0],w,cin,c1,s[0]);
FA k6(a[1],x,c1,c2,s[1]);
FA k7(a[2],y,c2,c3,s[2]);
FA k8(a[3],z,c3,cout,s[3]);
endmodule


/////////////////////TestBench//////////////////////

module Adder_subtractor_4bit_TB();

reg [3:0] a, b;
reg cin;
wire [3:0] s;
wire cout;

integer i;

Adder_Subtractor_4bit AS(a, b, cin, cout,s);

initial begin
    $display("a    b    cin |  s    cout");
    $monitor("%b %b %b | %b %b", a, b, cin, s, cout);

    for(i = 0; i < 10; i = i + 1) begin
        a = $random % 16;
        b = $random % 16;
        cin = $random % 2;
        #10;
    end

    $finish;
end

endmodule
