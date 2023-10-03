module procss(clk,Din,Run,Rest,Done,r0_o,r1_o,r2_o,r3_o,r4_o,r5_o,r6_o,r7_o,A_o,G_o,mux_o,sl_o,Ain_o,Gin_o,IRin_o,addsub_o,Rin_o,state);
		input [15:0]Din;
		input clk;
		input Run,Rest;
		output [1:0]state;
		output Done;
		output [7:0]Rin_o;
		output addsub_o;
		output IRin_o;
		output Ain_o,Gin_o;
		output [15:0]r0_o,r1_o,r2_o,r3_o,r4_o,r5_o,r6_o,r7_o,A_o,G_o,mux_o ;
		output [3:0]sl_o;
		
		
		
		
		wire [15:0]r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,A_out,G_out;
		wire [3:0]sel;
		wire [15:0]Mux_out;
		wire Ain,Gin;
		wire IRin;
		wire addsub;
		wire [7:0]RIn;
		wire [15:0]instruction;
		
	
		
		
		assign A_o=A_out;
		assign G_o=G_out;
		assign sl_o=sel;
		assign mux_o=Mux_out;
		assign Ain_o=Ain;
		assign Gin_o=Gin;
		assign IRin_o=IRin;
		assign addsub_o=addsub;
		assign Rin_o=RIn;
		
		
		
		
		
		
		
		
		
		assign r0_o=r0_out;
		assign r1_o=r1_out;
		assign r2_o=r2_out;
		assign r3_o=r3_out;
		assign r4_o=r4_out;
		assign r5_o=r5_out;
		assign r6_o=r6_out;
		assign r7_o=r7_out;
		
		wire [3:0]opcode;
		wire [2:0]rx_addr,ry_addr;
		wire immorreg;
		wire [8:0]imm;
		
		
		assign opcode=instruction[15:13];
		assign immorreg=instruction[12];
		assign rx_addr=instruction[11:9];
		assign ry_addr=instruction[2:0];
		assign imm=instruction[8:0];
		wire sign_extened;
		assign sign_extened=(imm[8])?{7'b1111111,imm}:{7'b0,imm};
	
	
		
		rgister IR(clk,IRin,Rest,Din,instruction);
		
		rgister r0(clk,RIn[0],Rest,Mux_out,r0_out);
		rgister r1(clk,RIn[1],Rest,Mux_out,r1_out);
		rgister r2(clk,RIn[2],Rest,Mux_out,r2_out);
		rgister r3(clk,RIn[3],Rest,Mux_out,r3_out);
		rgister r4(clk,RIn[4],Rest,Mux_out,r4_out);
		rgister r5(clk,RIn[5],Rest,Mux_out,r5_out);
		rgister r6(clk,RIn[6],Rest,Mux_out,r6_out);
		rgister r7(clk,RIn[7],Rest,Mux_out,r7_out);
		
		
		
		rgister A(clk,Ain,Rest,Mux_out,A_out);
		
		rgister G(clk,Gin,Rest,Mux_out,G_out);
		
		
		mux mm(sel,mux_out,r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,alu_out,sign_extened,{imm,7'b0});
		
		
		control cc(instruction,clk,Run,Rest,Done,G_in,addsub,A_in,sel,IRin,state,Rin);
		
		
		
		
		




endmodule
