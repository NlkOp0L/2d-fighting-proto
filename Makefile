SRC=src
BLD=build
OBJ=$(BLD)/obj
EXE=$(BLD)/proto

ifeq ($(shell uname),Darwin)
	CC=cc
	LFLAGS=-framework CoreVideo -framework IOKit -framework Cocoa -framework GLUT -framework OpenGL lib/raylib/macOS/libraylib.a
else ifeq ($(shell uname),Linux)
	CC=g++
	LFLAGS=-L lib/raylib/linux -lm -lraylib -lopengl32
else
	CC=g++
	LFLAGS=-L lib/raylib/win10 -lm -lraylib -lopengl32 -lwinmm -mwindows
endif
CCFLAGS=-std=c++17 -Wextra -Wall -pedantic

IFLAGS=-I lib/raylib/



all: $(EXE)

$(EXE): $(OBJ)/main.o
	$(CC) -o $(EXE) $(OBJ)/main.o $(LFLAGS)

$(OBJ)/main.o: src/main.cpp
	$(CC) -o $(OBJ)/main.o -c $(SRC)/main.cpp $(CCFLAGS) $(IFLAGS)

clean:
	rm -rf $(BLD)
	mkdir -p $(OBJ)
