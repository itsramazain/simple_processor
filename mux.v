module mux(sel,mux_out,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9);
	input [3:0]sel;
	output reg [15:0]mux_out;
	input[15:0] i0,i1,i2,i3,i4,i5,i6,i7,i8,i9 ;
	always@(sel,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9)
	case(sel)
	4'd0:mux_out=i0;
	4'd1:mux_out=i1;
	4'd2:mux_out=i2;
	4'd3:mux_out=i3;
	4'd4:mux_out=i4;
	4'd5:mux_out=i5;
	4'd6:mux_out=i6;
	4'd7:mux_out=i7;
	4'd8:mux_out=i8;
	4'd9:mux_out=i9;
	default:mux_out=16'bx;
	endcase
	
	

	
	
endmodule
