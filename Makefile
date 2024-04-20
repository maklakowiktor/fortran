.PHONY: compile run

CC = gfortran
SRC = src/
BUILD_DIR = ./build

compile:
	@$(CC) $(SRC)/$(PROGRAM) -o $(BUILD_DIR)/$(PROGRAM)

run:
	@$(BUILD_DIR)/$(PROGRAM)