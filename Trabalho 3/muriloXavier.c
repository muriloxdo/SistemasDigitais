//feito por Murilo Xavier e Gustavo Zanella;

#include <stdio.h>
#include <stdlib.h>

typedef struct{
	float x;
	float y;

} points;

float sinal (points point_a, points point_b, points point_c){
    int resul=(point_a.x - point_c.x) * (point_b.y - point_c.y) - (point_b.x - point_c.x) * (point_a.y - point_c.y);
    return resul;
}

int pontoNoTriangulo(points p, points a, points b, points c){
    int v1, v2, v3;

    v1 = sinal(p, a, b) < 0.0f;
    v2 = sinal(p, b, c) < 0.0f;
    v3 = sinal(p, c, a) < 0.0f;

    if(((v1 == v2) && (v2 == v3)))
    	return 1;

    else
    	return 0;
}

int main(){
	points a, b, c, p;
	puts("Digite o x de a");
	scanf("%f", &a.x);
	puts("Digite o y de a");
	scanf("%f", &a.y);
	puts("Digite o x de b");
	scanf("%f", &b.x);
	puts("Digite o y de b");
	scanf("%f", &b.y);
	puts("Digite o x de c");
	scanf("%f", &c.x);
	puts("Digite o y de c");
	scanf("%f", &c.y);
	puts("Digite o x do ponto");
	scanf("%f", &p.x);
	puts("Digite o y do ponto");
	scanf("%f", &p.y);
	
	if(pontoNoTriangulo(p, a, b, c)){
		printf("OK\n");
	}
	else{
		printf("FALSO\n");
	}

	return 0;
}