# HxReaScript
Haxe externs(bindings) for Reaper's Lua ReaScript variant, write your Reaper plugins in Haxe and compile to Lua for ReaScript.

## Getting Started

1. Install Haxe
2. Add HxReaScript to haxelib `haxelib git hxReaScript https://github.com/inc0der/HxReaScript`
3. Create your `.hxml` file add `hxReaScript` as a library and target Lua.

```hxml
# Main plugin class
-main Main

# Add hxReaScript as library
-lib hxReaScript

# Use vanilla lua to avoid pulling in other dependencies (unless you need them)
-D lua-vanilla

--lua bin/lua/main.lua
```

## Note
Since it appears many of the C++ and Lua method names are similar this may be a good base to compile to the C++ ReaScript variant.