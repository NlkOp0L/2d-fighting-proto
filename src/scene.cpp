#include "scene.hpp"

#include <raylib/raylib.h>



void Scene::update(float dt) {

}

void Scene::render() {
    ClearBackground(RAYWHITE);
    DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
}