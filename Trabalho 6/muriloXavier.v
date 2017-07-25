//feito por Murilo Xavier e Gustavo Zanella;

module sign(
	input [10:0] x1, y1,x2, y2, x3, y3,
	output out
	);

wire [20:0] aux1, aux2, aux3, aux4;

assign aux1 = x1 - x3;
assign aux2 = y2 - y3;
assign aux3 = x2 - x3;
assign aux4 = y1 - y3;
assign out = (aux1 * aux2) - (aux3 * aux4);

endmodule

module pointInTriangle(
	input [10:0] point_x, point_y,
	input clock,
	output out);


reg [10:0] x1, y1, x2, y2, x3, y3;

wire b1, b2, b3;
reg out_reg;

reg [0:1]cont;

assign out = out_reg;

sign A(point_x, point_y, x1, y1, x2, y2, b1);
sign B(point_x, point_y, x2, y2, x3, y3, b2);
sign C(point_x, point_y, x3, y3, x1, y1, b3);

always @(*) begin
	if(b1 == b2 && b2 == b3)begin
		out_reg <= 1;
	end		
	else begin
		out_reg <= 0;
	end
end

always @(posedge clock) begin
	if (cont == 0) begin
		x1 <= 4; 
		y1 <= 9; 
		
		x2 <= 9; 
		y2 <= 5;
		
		x3 <= 12; 
		y3 <= 11;

		cont <= cont +1;
	end
	else if (cont == 1) begin
		x1 <= 6; 
		y1 <= 1; 
		
		x2 <= 9; 
		y2 <= 3;
	
		x3 <= -4; 
		y3 <= 15;

		cont <= cont + 1;
	end
	if (cont == 2) begin
		x1 <= 1; 
		y1 <= 2; 
		
		x2 <= 1; 
		y2 <= 2;
		
		x3 <= 2; 
		y3 <= 21;

		cont <= cont + 1;
	end
	else begin
		x1 <= 6; 
		y1 <= 7; 
		
		x2 <= 7; 
		y2 <= 8;
		
		x3 <= 8; 
		y3 <= 18;

		cont <= cont + 1;
	end

end

endmodule

module test;

reg clock;
reg [10:0] point_x;
reg [10:0] point_y;
wire out;

pointInTriangle A(point_x, point_y, clock, out);

always #2 begin
	if(clock == 1)begin
		clock <= 0;
	end
	else begin
		clock <= 1;
	end
end

initial begin
	$dumpvars(0, A);
	#6;
	point_x <= 9;
	point_y <= 9;
	
	#6;
	point_x <= -5;
	point_y <= -4;
	
	#6;
	point_x <= 3; 
	point_y <= 1;
	
	#6;
	point_x <= 9; 
	point_y <= 0;

	#6;
	point_x <= 9; 
	point_y <= 9;

	#12

	$finish;

end

endmodule