//feito por Murilo Xavier e Gustavo Zanella;

module mult2Bit(
	input [0:1] a, b,
	output [0:3] out
);

assign out[0] = a[0] & b[0];
assign out[1] = (a[0] & b[1]) ^ (a[1] & b[0]);
assign out[2] = (a[1] & b[1]) ^ ((a[0] & b[1]) & (a[1] & b[0]));
assign out[3] = (a[1] & b[1]) & ((a[0] & b[1]) & (a[1] & b[0]));

endmodule

module teste;

reg [0:1] a, b;
wire [0:3] out;

mult2Bit m(a, b, out);

initial begin
	$monitor("a = %b%b * b = %b%b \nResultado = %b%b%b%b", a[1], a[0], b[1], b[0], out[3] ,out[2], out[1] , out[0]);

	a[1] = 1;	//[1] = bit mais significativo, [0] = bit menos significativo
	a[0] = 0;
	b[1] = 1;
	b[0] = 1;

	#2

	$finish;

end

endmodule