# Tarkov-Like Game in Godot

A lightweight, optimized game inspired by Escape from Tarkov, built in Godot 4.3. Designed to run on both mobile (8GB RAM) and PC (12GB RAM) with efficient performance.

## Features

- **First-Person Controller** - Smooth FPS movement and camera controls
- **Inventory System** - Manage loot with slot-based inventory (20 slots)
- **Loot Containers** - Interactive containers with randomized loot
- **Optimized Performance** - GL Compatibility rendering with VRAM compression for mobile
- **Cross-Platform** - Works on PC, Android, and iOS
- **Low Memory Usage** - Optimized for 8GB mobile and 12GB PC

## Quick Start

1. **Clone** this repository
2. **Open** in Godot 4.3+
3. **Press F5** to play

## Controls

- **WASD** - Move around
- **Mouse** - Look around (click to lock/unlock mouse)
- **Shift** - Sprint
- **Space** - Jump
- **E** - Loot containers (coming soon)
- **Esc** - Unlock mouse / Menu
- **Tab** - Toggle inventory (coming soon)

## Project Structure

```
tarkov-godot/
├── project.godot              # Project config (mobile/PC optimized)
├── scenes/
│   ├── main.tscn             # Main game scene
│   └── player.tscn           # Player controller
├── scripts/
│   ├── main.gd               # Main game manager
│   ├── player/
│   │   └── player.gd         # Player controller + movement
│   ├── inventory/
│   │   └── inventory_manager.gd  # Inventory system
│   └── loot/
│       └── loot_container.gd     # Loot spawning
└── README.md
```

## Performance Optimizations

- **Rendering**: GL Compatibility for mobile/low-end PC support
- **Textures**: ETC2/ASTC compression for mobile devices
- **Lighting**: Ambient light only, disabled SDFGI and reduced GI quality
- **Physics**: Simplified physics for better performance
- **Memory**: Efficient inventory and loot systems designed for low RAM

## Next Steps to Expand

1. Add more loot containers to the map
2. Create weapon models and systems
3. Implement enemy AI (simple patrol/combat)
4. Build map progression and extraction points
5. Add raid timer system
6. Create UI inventory panel
7. Add sound effects and ambient audio
8. Implement save/load system

## System Requirements

- **Godot**: 4.3+
- **Mobile**: 8GB RAM minimum
- **PC**: 12GB RAM minimum
- **Storage**: ~2GB for project files

## How to Extend

### Adding Loot Items
Edit `scripts/loot/loot_container.gd` and modify the `loot_items` array:
```gdscript
@export var loot_items: Array[Dictionary] = [
    {"name": "Item Name", "rarity": "common", "value": 100},
]
```

### Adding Loot Containers to Scene
1. Open `scenes/main.tscn` in Godot
2. Instance a new `LootContainer` node
3. Position it in the scene
4. Customize loot items in the inspector

### Adjusting Player Speed
In `scripts/player/player.gd`:
```gdscript
@export var move_speed: float = 7.0      # Normal speed
@export var sprint_speed: float = 12.0   # Sprint speed
@export var jump_power: float = 8.0      # Jump height
```

## License

Free to use and modify for personal projects!

## Support

For issues or questions, open a GitHub issue in this repository.
