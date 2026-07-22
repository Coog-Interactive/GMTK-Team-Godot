# GMTK-Team-Godot
Here is some stuff you should know.
## File Structure
```
.
├── assets (This is where we will store our textures and sfx)
│   ├── icon.svg
│   └── icon.svg.import
├── project.godot
├── README.md
├── source (This is where we will store all of our "prefabs", levels, and scripts)
│   ├── scripts
│   └── scenes
```
## Coding Conventions
Please follow the typical coding conventions of GDScript, and give your variables type-annotations whenever possible. It improves readability.
```
var snake_case: Vector2 = Vector2.ZERO
```
## The Repo
I ended up opting to keep the `main` branch unlocked, but please create new branches for the feature you're currently working on. This should prevent conflicts in main.