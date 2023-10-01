module rgister(clk,rest,d,q);
	parameter n=16;
	input clk,rest;
	input [n-1:0]d;
	output reg [n-1:0]q;
	
	always@(posedge clk)
	if (!rest)
		q<=0;
	else 
		q<=d;
	
endmodule
