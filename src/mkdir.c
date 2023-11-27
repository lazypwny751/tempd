#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // Komut satırından dizin adını al
    if (argc != 2) {
        fprintf(stderr, "Kullanım: %s <dizin_adı>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Dizin oluştur
    if (mkdir(argv[1], 0777) == 0) {
        printf("Dizin başarıyla oluşturuldu: %s\n", argv[1]);
    } else {
        perror("Dizin oluşturma hatası");
        exit(EXIT_FAILURE);
    }

    return 0;
}
