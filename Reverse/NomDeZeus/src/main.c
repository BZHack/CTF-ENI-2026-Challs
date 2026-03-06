#include <stdio.h>
#include <string.h>

int main() {
    const char *flag = "ENI{221_Gigowatts!}";

    char input[64];

    printf("=== DELOREAN SECURITY SYSTEM ===\n");
    printf("Entrez le code de demarrage : ");

    if (scanf("%63s", input) != 1) return 1;

    if (strcmp(input, flag) == 0) {
        printf("Moteur allume ! Direction le futur !\n");
    } else {
        printf("Erreur : Moteur cale.\n");
    }
    return 0;
}
