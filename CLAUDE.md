# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a WezTerm terminal emulator configuration repository that provides a highly customized terminal experience with features like:
- GPU adapter selection for optimal performance
- Cross-platform key bindings (Mac, Windows, Linux)
- Custom color schemes and fonts
- Advanced window and pane management

## Code Architecture

The configuration follows a modular structure:

1. **Main Entry Point**: `wezterm.lua` - Loads and combines all configuration modules
2. **Configuration Modules**: `config/` directory containing separate config aspects:
   - `appearance.lua` - Visual settings, colors, fonts, window appearance
   - `bindings.lua` - All key and mouse bindings
   - `fonts.lua` - Font configuration
   - `general.lua` - General terminal behavior settings
   - `launch.lua` - Shell and launch menu configuration
3. **Utilities**: `utils/` directory with helper modules:
   - `gpu_adapter.lua` - GPU selection logic
   - `platform.lua` - Platform detection
4. **Event Handlers**: `events/` directory for WezTerm events
5. **Assets**: `colors/` for color schemes

## Development Commands

### Linting and Formatting
```bash
# Check Lua code formatting (uses stylua)
stylua -g '!/config/init.lua' --check wezterm.lua colors/ config/ events/ utils/

# Lint Lua code (uses luacheck)
luacheck wezterm.lua colors/* config/* events/* utils/*
```

### Testing Changes
Since this is a configuration repository, testing involves:
1. Making changes to the Lua files
2. Restarting WezTerm to see the changes take effect
3. Verifying functionality works as expected

The configuration automatically reloads when `automatically_reload_config = true` (set in `config/general.lua`).

## Key Features to Understand

1. **Modular Configuration System**: The config uses a custom `Config` class in `config/init.lua` that allows appending configuration options from different modules.

2. **GPU Adapter Selection**: The `utils/gpu_adapter.lua` module helps select the best GPU adapter based on platform-specific preferences.

3. **Cross-Platform Key Bindings**: The binding system uses platform detection to provide consistent key bindings across different operating systems.

4. **Event-Driven Architecture**: Various events like `gui-startup` are handled in the `events/` directory modules.