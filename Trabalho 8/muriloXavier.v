//feito por Murilo Xavier e Gustavo Zanella;

module meio(
	input a, b,
	output soma, c
);

xor xor1(soma, a, b);
and and1(c, a, b);

endmodule

module inteiro(
	input a, b, c_entrada,
	output soma, c_saida
);

wire c1, c2, s;

meio m(a, b, s, c1);
meio m1(s, c_entrada, soma, c2);

or o(c_saida, c1, c2);

endmodule

module quatro_bit(
	input [0:3]a, b,
	input c_entrada,
	output c_saida,
	output [0:3]soma
);

wire [0:2]saida;

inteiro i1(a[0], b[0], c_entrada, soma[0], saida[0]);
inteiro i2(a[1], b[1], saida[0], soma[1], saida[1]);
inteiro i3(a[2], b[2], saida[1], soma[2], saida[2]);
inteiro i4(a[3], b[3], saida[2], soma[3], c_saida);

endmodule