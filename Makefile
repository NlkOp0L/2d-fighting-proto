SRC=src
BLD=build
OBJ=$(BLD)/obj
EXE=$(BLD)/proto

CC=g++
CCFLAGS=-std=c++17 -Wextra -Wall -pedantic

IFLAGS=-I ../raylib/src
LFLAGS=-L ../raylib/src -lm -lraylib -lopengl32 -lwinmm -mwindows



all: $(EXE)

$(EXE): $(OBJ)/main.o
	$(CC) -o $(EXE) $(OBJ)/main.o $(LFLAGS)

$(OBJ)/main.o: src/main.cpp
	$(CC) -o $(OBJ)/main.o -c $(SRC)/main.cpp $(CCFLAGS) $(IFLAGS)

clean:
	rm -rf $(BLD)
	mkdir -p $(OBJ)