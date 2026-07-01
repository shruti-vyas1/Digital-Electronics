
module demux1_2(i,s,y1,y2);
input i,s;
output reg y1,y2;
wire ns;
/*
//dataflow
assign y1=~s&i;
assign y2=s&i;


//gatelevel
not k1(ns,s);
and k2(y1,ns,i);
and k3(y2,s,i);
*/

//behavioural
always@(*)
begin
y1=~s&i;
y2=s&i;
end

endmodule
