#include <gba.h>

int main(void) {
    // Set video mode: Mode 0, BG2 on
    REG_DISPCNT = MODE_0 | OBJ_ON | OBJ_1D_MAP;

    // Example sprite data (placeholder Herm block)
    u16* spriteData = (u16*)0x6010000;
    for (int i = 0; i < 16*16/2; i++) {
        spriteData[i] = RGB5(0,31,0) | (RGB5(31,31,31) << 8);
    }

    // Sprite attribute memory
    OBJATTR* obj = &OAM[0];
    obj->attr0 = ATTR0_SQUARE | 80;   // y=80
    obj->attr1 = ATTR1_SIZE_16 | 120; // x=120
    obj->attr2 = 0;                   // tile index 0

    while (1) {
        VBlankIntrWait();
    }
}
