#include <gba.h>

int main(void) {
    // Set GBA video mode to Mode 3 (bitmap mode, BG2 enabled)
    REG_DISPCNT = MODE_3 | BG2_ENABLE;

    // Fill the screen with green
    for (int y = 0; y < 160; y++) {
        for (int x = 0; x < 240; x++) {
            MODE3_FB[y][x] = RGB5(0, 31, 0); // pure green
        }
    }

    // Infinite loop so it stays on screen
    while (1);
}
