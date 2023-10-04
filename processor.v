module proc(clock,Run,Rest,Done,Din,in,state,IRin_o,Rin_o,sel_out,Mux_out_o,imme,r0_out_o,r1_out_o,r2_out_o,r3_out_o,r4_out_o,r5_out_o,r6_out_o,r7_out_o,alu_result_o,G_out_o,A_out_o,Gin_o,Ain_o,addsub);
	output Gin_o,Ain_o;
	input [15:0]Din;
	input Run,Rest;
	output addsub;
	output [15:0]in;
	wire [15:0]instruction;
	assign in=instruction;
	output Done;
	input clock;
	output [3:0]sel_out;
	output [15:0]imme;
	
	wire IRin,Ain,Gin,AddSub;
	wire [7:0]Rin;
	output [7:0]Rin_o;
	assign Rin_o=Rin;
	wire [3:0]sel;
	wire [15:0]Mux_out,G_out,A_out,r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,alu_result;
	assign sel_out=sel;
	output [15:0]Mux_out_o;
	assign Mux_out_o=Mux_out;
	output [15:0]r0_out_o,r1_out_o,r2_out_o,r3_out_o,r4_out_o,r5_out_o,r6_out_o,r7_out_o,alu_result_o,G_out_o,A_out_o;
	assign r0_out_o=r0_out;
	assign r1_out_o=r1_out;
	assign r2_out_o=r2_out;
	assign r3_out_o=r3_out;
	assign r4_out_o=r4_out;
	assign r5_out_o=r5_out;
	assign r6_out_o=r6_out;
	assign r7_out_o=r7_out;
	assign Ain_o=Ain;

	
	assign alu_result_o=alu_result;
	assign G_out_o=G_out;
	assign A_out_o=A_out;
	assign Gin_o=Gin;
	assign addsub=AddSub;
	wire [1:0] sate ;
	output [1:0]state;
	output IRin_o;
	assign IRin_o=IRin;
	wire [3:0]opcode;
	wire [2:0]rx_addr,ry_addr;
	wire immorreg;
	wire [8:0]imm;
	assign imme={ {7{imm[8]}}, imm[8:0] };
	
	
	
	
	assign opcode=instruction[15:13];
	assign immorreg=instruction[12];
	assign rx_addr=instruction[11:9];
	assign ry_addr=instruction[2:0];
	assign imm=instruction[8:0];
	
	
	rgister IN(clock,IRin,Rest,Din,instruction);
	
	rgister ro(clock,Rin[7],Rest,Mux_out,r0_out);
	rgister r1(clock,Rin[6],Rest,Mux_out,r1_out);
	rgister r2(clock,Rin[5],Rest,Mux_out,r2_out);
	rgister r3(clock,Rin[4],Rest,Mux_out,r3_out);
	rgister r4(clock,Rin[3],Rest,Mux_out,r4_out);
	rgister r5(clock,Rin[2],Rest,Mux_out,r5_out);
	rgister r6(clock,Rin[1],Rest,Mux_out,r6_out);
	rgister r7(clock,Rin[0],Rest,Mux_out,r7_out);
	
	rgister A(clock,Ain,Rest,Mux_out,A_out);
	rgister G(clock,Gin,Rest,alu_result,G_out);
	
	
	
	mux mux(sel,Mux_out,r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,G_out,{ {7{imm[8]}} , imm[8:0] },{imm[7:0],8'b0});
	control con(instruction,clock,Run,Rest,Done,Gin,AddSub,Ain,sel,IRin,state,Rin);
	alu add_sub(Mux_out,A_out,AddSub,alu_result);

	


		

	
	
	
	

	
	
	
	
	

	
	
	
endmodule
