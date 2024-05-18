#include <stdio.h> // Input/output library.
#include <string.h> // String library for special function: strlen etc.

int testCounter = 1;

void printUnsignedCharArray(unsigned char arr[16], int ALength) {
    if (ALength == 0) {
        return;
    }

    printf("%d", arr[0]);

    for (int i = 1; i < ALength; i++) {
        printf(", %d", arr[i]);
    }

    printf("\n");
}

void printIntArray(int arr[15], int ALength) {
    if (ALength == 0) {
        return;
    }

    printf("%d", arr[0]);

    for (int i = 1; i < ALength; i++) {
        printf(", %d", arr[i]);
    }

    printf("\n");
}

void test(unsigned char A[16]) {
    printf("Test %d.\n", testCounter++);
    printf("A: ");
    printUnsignedCharArray(A, 16);

    unsigned char B[15] = {0};
    int C[15] = {0};

    int CLength = 0;

    __asm__ (
        "mov esi, %1;      \n"
        "lea edi, %2;      \n"
        "lea ebx, %3;      \n"

        "mov ecx, 15;      \n"

    "loop_start:           \n"
        "mov al, [esi];    \n"
        "inc esi;           \n"
        "mov dl, [esi];    \n"

        "sub al, dl;      \n"
        "js negative;      \n"

        "mov [edi], al;     \n"
        "jmp loop_continue \n"
    
    "negative:    \n"
        "mov [ebx], edi; \n"

        "inc ebx; \n"
        "inc %0; \n"

        "jmp loop_continue \n"
    
    "loop_continue: \n"
        "inc edi;           \n"
        "dec ecx;          \n"

        "cmp ecx, 0;         \n"
        "jne loop_start     \n"

        : "=m" (CLength)
        : "m" (A), "m" (B), "m" (C)
        : "esi", "edi", "eax", "ebx", "ecx", "edx"
    );

    printf("B: ");
    printUnsignedCharArray(B, 15);

    printf("C: ");
    printIntArray(C, CLength);
}

int main() {
    // Test 1.
    unsigned char A[16] = {13, 12, 13, 15, 1, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0};

    test(A);

    return 0;
}