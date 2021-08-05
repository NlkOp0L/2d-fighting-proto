#pragma once

#include <string>

#include "scene.hpp"



class Game {
    public:
        Game(int width, int height, std::string title, int fps): m_width(width), m_height(height), m_title(title), m_fps(fps) {
            m_isRunning = true;
            m_curScene = new Scene();
            
            init();
        }
        ~Game() {}

        void init();
        void run();
        void update(float dt);
        void render();

    private:
        int m_width, m_height;
        std::string m_title;
        int m_fps;
        bool m_isRunning;
        Scene* m_curScene;
};