module Encoder8_3(D0, D1, D2, D3, D4, D5, D6, D7, Y2, Y1, Y0);
    input D0, D1, D2, D3, D4, D5, D6, D7;
    output Y2, Y1, Y0;
    or g1(Y0, D1, D3, D5, D7);
    or g2(Y1, D2, D3, D6, D7);
    or g3(Y2, D4, D5, D6, D7);
endmodule

// ---------------- Testbench ----------------
module tb_Encoder8_3;
    reg D0, D1, D2, D3, D4, D5, D6, D7;
    wire Y2, Y1, Y0;

    Encoder8_3 uut(D0, D1, D2, D3, D4, D5, D6, D7, Y2, Y1, Y0);

    initial begin
        $display("Testing 8:3 Encoder");

        D0=1; D1=0; D2=0; D3=0; D4=0; D5=0; D6=0; D7=0; #10;
        D0=0; D1=1; D2=0; D3=0; D4=0; D5=0; D6=0; D7=0; #10;
        D0=0; D1=0; D2=1; D3=0; D4=0; D5=0; D6=0; D7=0; #10;
        D0=0; D1=0; D2=0; D3=1; D4=0; D5=0; D6=0; D7=0; #10;
        D0=0; D1=0; D2=0; D3=0; D4=1; D5=0; D6=0; D7=0; #10;
        D0=0; D1=0; D2=0; D3=0; D4=0; D5=1; D6=0; D7=0; #10;
        D0=0; D1=0; D2=0; D3=0; D4=0; D5=0; D6=1; D7=0; #10;
        D0=0; D1=0; D2=0; D3=0; D4=0; D5=0; D6=0; D7=1; #10;
        $display("8:3 Encoder test finished");
    end
endmodule
