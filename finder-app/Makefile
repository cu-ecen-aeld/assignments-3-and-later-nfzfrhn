CC = gcc
CFLAGS = -Wall -g

# If cross-compiling, specify the cross-compiler prefix (this will be passed with `CROSS_COMPILE`)
CROSS_COMPILE ?= 
CC = $(CROSS_COMPILE)gcc

# The output file (executable)
OUTPUT = writer

# Source files
SRC = writer.c

# Object files
OBJ = writer.o

# Default target: build the application
all: $(OUTPUT)

$(OUTPUT): $(OBJ)
	$(CC) $(OBJ) -o $(OUTPUT)

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $(SRC)

# Clean target: remove build artifacts
clean:
	rm -f $(OUTPUT) $(OBJ)

