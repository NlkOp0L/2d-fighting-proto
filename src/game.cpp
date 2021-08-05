#include "game.hpp"

#include <raylib/raylib.h>



void Game::init() {
    InitWindow(m_width, m_height, m_title.c_str());
    SetTargetFPS(m_fps); 
}

void Game::run() {
    while (m_isRunning && !WindowShouldClose())
    {
        update(GetFrameTime()); // Not sure about that dt
        render();
    }

    CloseWindow();
}

void Game::update(float dt) {
     m_curScene->update(dt);
}

void Game::render() {
    BeginDrawing();
     m_curScene->render();
    EndDrawing();
}