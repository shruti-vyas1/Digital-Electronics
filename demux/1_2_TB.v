odule demux1_2_TB();
reg i,s;
wire y1,y2;

demux1_2 k1(i,s,y1,y2);

initial
begin
$display("i s y1 y2");
$monitor("%b %b %b %b",i,s,y1,y2);

i=1;s=0;
#5;
i=1;s=1;
#5;
i=0;s=0;
#5;
i=0;s=1;
#5;
end
endmodule
