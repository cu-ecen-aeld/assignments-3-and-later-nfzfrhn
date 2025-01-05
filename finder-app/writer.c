#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

void write_to_file(const char *writefile, const char *writestr) {
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        // Log error using syslog
        syslog(LOG_ERR, "Error opening file %s for writing", writefile);
        perror("Error opening file");
        exit(1);
    }

    if (fputs(writestr, file) == EOF) {
        // Log error using syslog
        syslog(LOG_ERR, "Error writing to file %s", writefile);
        perror("Error writing to file");
        fclose(file);
        exit(1);
    }

    // Log success message using syslog
    syslog(LOG_DEBUG, "Writing '%s' to %s", writestr, writefile);
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Please specify two arguments: the file path and the string to write\n");
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Initialize syslog
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    write_to_file(writefile, writestr);

    // Close syslog
    closelog();

    return 0;
}

