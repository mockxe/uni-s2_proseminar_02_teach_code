#include <stdio.h>

int main(void) {
    int x, y, z = 0;

    printf("enter x: ");
    scanf("%d", &x);
    printf("enter y: ");
    scanf("%d", &y);

    for (int i = 0; i < x; i++) {
        z += y;
    }

    printf("result: %d\n", z);

    return 0;
}
