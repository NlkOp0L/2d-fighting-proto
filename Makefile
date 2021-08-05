SRC=src
BLD=build
OBJ=$(BLD)/obj
EXE=$(BLD)/proto

ifeq ($(shell uname),Darwin)
	CC=cc
	LFLAGS=-framework CoreVideo -framework IOKit -framework Cocoa -framework GLUT -framework OpenGL -lc++ lib/raylib/macOS/libraylib.a
else ifeq ($(shell uname),Linux)
	CC=g++
	LFLAGS=-L lib/raylib/linux -lm -lraylib -lopengl32
else
	CC=g++
	LFLAGS=-L lib/raylib/win10 -lm -lraylib -lopengl32 -lwinmm -mwindows
endif
CCFLAGS=-std=c++17 -Wextra -Wall -pedantic

IFLAGS=-I lib



all: pre-build $(EXE) $(TST_EXE)

$(EXE): $(OBJ)/main.o $(OBJ)/game.o $(OBJ)/scene.o
	$(CC) -o $(EXE) $(OBJ)/main.o $(OBJ)/game.o $(OBJ)/scene.o $(LFLAGS)

$(OBJ)/main.o: $(SRC)/main.cpp
	$(CC) -o $(OBJ)/main.o -c $(SRC)/main.cpp $(CCFLAGS) $(IFLAGS)

$(OBJ)/game.o: $(SRC)/game.cpp
	$(CC) -o $(OBJ)/game.o -c $(SRC)/game.cpp $(CCFLAGS) $(IFLAGS)

$(OBJ)/scene.o: $(SRC)/scene.cpp
	$(CC) -o $(OBJ)/scene.o -c $(SRC)/scene.cpp $(CCFLAGS) $(IFLAGS)

pre-build:
	mkdir -p $(OBJ)

clean:
	rm -rf $(BLD)
