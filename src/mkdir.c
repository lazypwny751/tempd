#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Structs
enum STATUS {
    TRUE,
    FALSE
};

enum OPT {
    HELP,
    SINGLE,
    PARENT
};

// Functions (blocks)

void Add2Arr(unsigned char **arr, const unsigned char *val) {
    size_t currentSize = *arr ? strlen(*arr) : 0;
    size_t valueSize = strlen(val);

    *arr = realloc(*arr, currentSize + valueSize + 1);
    strcat(*arr, val);
}

// Main function (block)
int main(int argc, char *argv[]) {
    unsigned char *options = NULL;

    enum STATUS _STATUS_ = TRUE;
    enum OPT _OPT_ = SINGLE;

    for (int c = 1 ; c < argc ; c++) {
        if (strcmp("--parent", argv[c]) == 0) {
            _OPT_ = PARENT;
        } else if (strcmp("--help", argv[c]) == 0) {
            _OPT_ = HELP;
        } else {
            Add2Arr(&options, argv[c]);
        }
    }

    switch(_OPT_) {
        case 0:
            printf("help parameter\n");
            break;
        case 1:
            if (*options) {
                for (size_t i = 0; i < strlen(options); ++i) {
                    printf("%c\n", options[i]);
                }
                printf("\n");
            } else {
                printf("Null array.\n");
                _STATUS_ = FALSE;
            }
            break;
        case 2:

            break;
        default:
            printf("Unknown option.\n");
            _STATUS_ = FALSE;
    }

    free(options);
    return _STATUS_;
}