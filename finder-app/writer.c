#include <stdio.h>
#include <string.h>
#include <syslog.h>
#include <errno.h>

int main(int argc, char *argv[]) {

    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Usage: %s <filename> <text>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error %s opening file", strerror(errno));
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to file %s", argv[2], argv[1]);

    if (fputs(argv[2], file) == EOF) {
        syslog(LOG_ERR, "Error %s writing to file", strerror(errno));
        fclose(file);
        return 1;
    }
    
    fclose(file);
    return 0;    
}