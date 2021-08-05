#include "game.hpp"

#include <raylib/raylib.h>



void Game::init() {
    InitWindow(m_width, m_height, m_title.c_str());
    SetTargetFPS(m_fps); 
}

void Game::run() {
    while (m_isRunning && !WindowShouldClose())
    {
        update();
        render();
    }

    CloseWindow();
}

void Game::update() {

}

void Game::render() {
    BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
    EndDrawing();
}