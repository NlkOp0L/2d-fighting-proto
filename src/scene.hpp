#pragma once



class Scene {
    public:
        Scene() {}
        ~Scene() {}

        void update(float dt);
        void render();

//    private:
//        std::vector<Entity> m_entities;
//        std::vector<Background> m_backgrounds;
};