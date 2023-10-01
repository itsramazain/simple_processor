// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your design here
`timescale 1ns / 1ns
module test();
	reg CLOCK_50;
	reg [15:0]i0,i1,i2,i3,i4,i5,i6,i7,i8,i9;
	reg [3:0]sel;
	wire [15:0]mux_out;
	parameter CLOCK_PERIOD=2;
	
	mux m(sel,mux_out,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9);
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
	i0=0;i1=16'bx;i2=1;i3=2;i4=3;i5=4;i6=5;i7=6;i8=9;i9=10;
	
	end
	
	

	
	
	
	initial
	begin
	sel=4'd0;
	#2;sel=4'd1;
	#2;sel=4'd2;
	#2;sel=4'd3;
	#2;sel=4'd4;
	#2;sel=4'd5;
	#2;sel=4'd6;
	#2;sel=4'd7;
	#2;sel=4'd0;
	#2;sel=4'dx;
	#2;sel=4'd10;

	

		
	
	
	
	
	
	
	
	
	
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
