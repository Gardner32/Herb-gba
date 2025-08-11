# Herm GBA Starter (devkitPro / libgba)

This is a tiny starting point for a Game Boy Advance platformer starring **Herm**.
It renders a 16×16 sprite and lets you move with the D-pad and jump with **A**.

## What you need
- **devkitPro** and **devkitARM** toolchain
- **libgba** (installed via devkitPro package manager)
- Optional: **mGBA** to test the ROM quickly

### Install devkitPro
- **Windows**: install from https://devkitpro.org/wiki/devkitPro_pacman
- **macOS**: `brew install devkitpro` (if you use Homebrew) or follow the site
- **Linux**: follow the site; use `pacman` per instructions

Then install GBA libs:That installs `devkitARM`, `libgba`, and templates.

## Build
Open a terminal in this folder and run:You should get `herm_gba.gba`.

## Run
- With **mGBA**: `mgba-qt herm_gba.gba`
- With **Delta** (iOS): AirDrop or import `herm_gba.gba` into Delta and run.

## Next steps
- Replace the placeholder 16×16 tile with real **Herm** sprite frames (4bpp).
- Add multiple tiles and animation; use OAM to switch tile indices per frame.
- Add a tiled background (Mode 0, BG0) for platforms & level.
- I can convert your pixel art into proper 4bpp tiles + palette using `grit` and wire it into this project.
