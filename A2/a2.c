#include <stdio.h>

int testCounter = 1;

void test(short int x, char y, char z, short v) {
    printf("\n");

    short v_c, v_as;

    __asm__(
        "# calculating numerator \n\n"

        "\t mov al, %2       # y --> al \n"
        "\t cbw              # y --> word \n"
        "\t imul %1          # x * y \n"
        "\t sub ax, 4        # ax - 4 --> ax \n"
        "\t mov bx, ax"

        "\t # calculating denominator \n\n"

        "\t mov al, %3       # z --> dl \n"
        "\t cbw              # z --> word \n"
        "\t sub ax, 2        # dx - 2 --> dx \n\n"
        "\t xchg ax, bx      # ax <--> bx \n"

        "\t idiv bx          # ax / bx --> ax \n"
        "\t sub ax, 2        # ax - 2 --> ax \n\n"

        "\t mov %0, ax       # ax --> v"

        : "=m" (v_as)                
        : "m" (x), "m" (y), "m" (z)  
    );

    v_c = ((short)y * x - 4) / ((short) z - 2.0) - 2;

    printf("Test %d\n", testCounter++);
    printf("Assembler result: %d (10-system) or %hx (16-system)\n", v_as, v_as);
    printf("C result: %d or %hx\n", v_c, v_c);
    printf("Correct values: %d or %hx\n", v, v);

    printf("\n");
}

int main() {
    test(0x2, -0x3, 0x7, -0x4);
    printf("===========\n");
    test(0x5AE, 0x62, -0x7E, -0x45B);

    return 0;
}