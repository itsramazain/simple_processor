module alu(rx,ry,addsub,results);
	input [15:0]rx,ry;
	output reg[15:0]results;
	input addsub;
	
	always@(*)
	if (addsub)
		results=rx-ry;
	else
		results=rx+ry;
		

endmodule
