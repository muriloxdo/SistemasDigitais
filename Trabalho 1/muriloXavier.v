//feito por Murilo Xavier e Gustavo Zanella;

module pisc(
    input clock,
    input r,
    output s
    );
reg sign;
assign s = sign;

always @(clock) begin
    sign <= ~sign;
end

always @(r) begin
    sign <= 0;
end

endmodule

module t_pisc;

wire s;
reg clk, r;

pisc p(clk, r, s);

always #2 begin
    clk <= ~clk;
end

initial begin
    $dumpvars(0, p);
    #2;
    clk <= 1;
    #2;
    r <= 0;
    #5;
    clk <= 1;
    #250;
    $finish;
end

endmodule