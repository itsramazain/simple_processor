// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your design here
`timescale 1ns / 1ns
module test();
	reg CLOCK_50;
	reg [15:0]rx,ry;
	wire [15:0]results;
	reg addsub;
	parameter CLOCK_PERIOD=2;
	
	alu m(rx,ry,addsub,results);
	initial begin
			CLOCK_50 <= 1'b1;
		end // initial
		always @ (*)
		begin : Clock_Generator
			#((CLOCK_PERIOD) / 2) 
			CLOCK_50 <= ~CLOCK_50;
		end
	
	
	initial
	begin
	rx=0;ry=0;addsub=0;
	
	end
	
	

	
	
	
	initial
	begin

	#2;rx=10;ry=10;addsub=0;
	#2;rx=20;ry=10;addsub=1;
	#2;rx=30;ry=10;addsub=0;
	#2;rx=20;ry=20;addsub=1;


	

		
	
	
	
	
	
	
	
	
	
	end
	
	
	
	initial
	begin
	#1000 $stop;
	end
	initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
	
	

endmodule
