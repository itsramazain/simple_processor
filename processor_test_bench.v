// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your design here
`timescale 1ns / 1ns
module test();
	reg CLOCK_50;
	reg [15:0]Din;
	reg Run,Rest;
	wire Done;
	/*wire [15:0]r0_o,r1_o,r2_o,r3_o,r4_o,r5_o,r6_o,r7_o,A_o,G_o,mux_o;
		wire [3:0]sl_o;
		wire [7:0]Rin_o;
		wire [1:0]state;*/
		//wire IRin_o,Ain_o,Gin_o,addsub_o;
	// proc proc1(CLOCK_50,Din,Run,Rest,Done,r0_o,r1_o,r2_o,r3_o,r4_o,r5_o,r6_o,r7_o,A_o,G_o,mux_o,sl_o,Ain_o,Gin_o,IRin_o,addsub_o,Rin_o,state);
	wire [15:0]in;
	wire [7:0]Rin_o;
	wire [1:0]state_o;
	wire IRin_o;
	wire [15:0]Mux_out_o,imme;
	wire [3:0]sel;
	wire Gin_o,AddSub;
	wire Ain_o;
	wire [2:0]rx_addr;
	wire [15:0]r0_out_o,r1_out_o,r2_out_o,r3_out_o,r4_out_o,r5_out_o,r6_out_o,r7_out_o,alu_result_o,G_out_o,A_out_o;
	proc proc(CLOCK_50,Run,Rest,Done,Din,in,state_o,IRin_o,Rin_o,sel,Mux_out_o,imme,r0_out_o,r1_out_o,r2_out_o,r3_out_o,r4_out_o,r5_out_o,r6_out_o,r7_out_o,alu_result_o,G_out_o,A_out_o,Gin_o,Ain_o,AddSub,rx_addr);
	parameter CLOCK_PERIOD=5;
   
	
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
	Run	= 1'b1;
	
	Rest=1;
	end
	
	

	
	
	
	initial
	begin
			Run	<= 1'b1; Din	<= 16'b0001000000011100; // mv  r0, 0
		#4;
		#4;	
		#4;	Run	<= 1'b0; 
		#4;	Run	<= 1'b1; Din	<= 16'b0011001011111111; // mvt r1, 0
		#4;
		#4;
		#4;	Run	<= 1'b0;
		#4;	Run	<= 1'b1; Din	<= 16'b0101001011111111; // add r1, #0xFF
		#4;
		#4;
		#4;
		#4;
		#4;	Run	<= 1'b0;
		#4;	Run	<= 1'b1; Din	<= 16'b0110001000000000; // sub r1, r0
		#4;
		#4;
		#4;
		#4;	Run	<= 1'b0;
		#4;	Run	<= 1'b1; Din	<= 16'b0101001000000001; // add r1, #1
		#4;
		#4;
		#4;
		#4;	Run	<= 1'b0;
	



	

		
	
	
	
	
	
	
	
	
	
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
