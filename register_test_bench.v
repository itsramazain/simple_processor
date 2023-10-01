// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your design here
`timescale 1ns / 1ns
module test();
	reg CLOCK_50;
	reg rest;
	wire [15:0]q;
	reg [15:0]d;
	parameter CLOCK_PERIOD=2;
	
	rgister r1(CLOCK_50,rest,d,q);
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
	d=1;rest=0;
	
	end
	
	

	
	
	
	initial
	begin
	#2;d=1;rest=1;
	#2;d=15;rest=1;
	#2;d=2;rest=1;
	#2;d=17;rest=1;
	#2;d=18;rest=1;
	#2;d=19;rest=0;
	#2;d=20;rest=1;
	

		
	
	
	
	
	
	
	
	
	
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
