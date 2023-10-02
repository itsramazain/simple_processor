module control(instruction,clock,Run,Rest,Done,Gin,addsub,Ain,sel,IRin,state,Rin);
	input clock,Run,Rest;
	input [15:0]instruction;
	output reg [3:0]sel;
	output  reg IRin,addsub,Gin,Ain,Done;
	output [7:0]Rin;
	output reg [1:0]state;
	reg Erx;
	wire [3:0]opcode;
	wire [2:0]rx_addr,ry_addr;
	wire immorreg;
	wire imm;
	
	
	
	
	
	assign opcode=instruction[15:13];
	assign immorreg=instruction[12];
	assign rx_addr=instruction[11:9];
	assign ry_addr=instruction[2:0];
	assign imm=instruction[8:0];
	
	
	parameter T0=2'b00,T1=2'b01,T2=2'b10,T3=2'b11;
	
	dec3to8 n(Erx, rx_addr ,Rin );
	
	always@(posedge clock )
	begin
	if (!Rest|(state===2'bx)&(Run==1'b1))
	begin
	state=T0;
	end 
	if ((state!==2'bx)&(Run==1'b1))
	begin
		case(state)
		T0:
	
		state=T1;
		
		
		T1:
		begin
		case(opcode)
		3'b000:
		
		state=T0;
		
		
		
		
		3'b001:
	
		
		state=T0;
	
		3'b010:
	
		
		
		
		state=T2;

		3'b011:
	
		
		
		state=T2;
	
		
		endcase
		end
		T2:
	
		state=T3;
		
		
		T3:
		
	
	
		state=T0;
		
		
		
		
		endcase
	end 
	end

			
	
	 
	
	
	always@(posedge clock )

	if ((state!==2'bx)&(Run==1'b1))

	
	
	begin
		case(state)
		T0:
		begin
		sel=4'bx;
		IRin=1;
		addsub=1'bx;
		Gin=0;
		Ain=0;
		Erx=0;
		Done=0;
		
		end
		
		T1:
		begin
		case(opcode)
		3'b000:
		
		begin
		if (immorreg)
		begin
			sel=4'd9;
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=0;
		Erx=1;
		Done=1;
		
		end
		
		else
		begin
		sel={1'b0,ry_addr};
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=0;
		Erx=1;
		Done=1;
		
		end
		
		
		
		end
		3'b001:
		begin
		sel=4'd10;
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=0;
		Erx=1;
		Done=1;
		
		end
		3'b010:
		begin
		if (immorreg)
		begin
			sel=4'd9;
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=1;
		Erx=0;
		Done=0;
		end
		
		else
		begin
			sel={1'b0,ry_addr};
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=1;
		Erx=0;
		Done=0;
		

		end
		end
		3'b011:
		begin
		if (immorreg)
		begin
			sel=4'd9;
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=1;
		Erx=0;
		Done=0;
		
		end
		
		else
		begin
			sel={1'b0,ry_addr};
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=1;
		Erx=0;
		Done=0;
		

		end
		end
		
		endcase
		end
		T2:
		
		begin
		case(opcode)
		3'b010:
		begin
		if (immorreg)
		begin
			sel={1'b0,rx_addr};
		IRin=0;
		addsub=1'b0;
		Gin=1;
		Ain=0;
		Erx=0;
		Done=0;
		
		end
		
		else
		begin
			sel={1'b0,rx_addr};
		IRin=0;
		addsub=1'b0;
		Gin=1;
		Ain=0;
		Erx=0;
		Done=0;
		
		end
		end
		3'b011:
		begin
		if (immorreg)
		begin
			sel={1'b0,rx_addr};
		IRin=0;
		addsub=1'b1;
		Gin=1;
		Ain=0;
		Erx=0;
		Done=0;
	
		end
		
		else
		begin
			sel={1'b0,rx_addr};
		IRin=0;
		addsub=1'b1;
		Gin=1;
		Ain=0;
		Erx=0;
		Done=0;
	
		end
		
		end
		
		
		endcase
		end
		T3:
		
		begin
		sel=4'd8;
		IRin=0;
		addsub=1'bx;
		Gin=0;
		Ain=0;
		Erx=1;
		Done=1;
		
		
		
		
		
		end
		endcase
	end 
	
	
endmodule



module dec3to8(E, W, Y);
    input E; // enable
    input [2:0] W;
    output [0:7] Y;
    reg [0:7] Y;
   
    always @(*)
        if (E == 0)
            Y = 8'b00000000;
        else
            case (W)
                3'b000: Y = 8'b10000000;
                3'b001: Y = 8'b01000000;
                3'b010: Y = 8'b00100000;
                3'b011: Y = 8'b00010000;
                3'b100: Y = 8'b00001000;
                3'b101: Y = 8'b00000100;
                3'b110: Y = 8'b00000010;
                3'b111: Y = 8'b00000001;
            endcase
endmodule
