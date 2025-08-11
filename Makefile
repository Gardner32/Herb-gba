# Herm GBA Starter Makefile
.PHONY: all clean

# Toolchain
PREFIX = arm-none-eabi-
CC     = $(PREFIX)gcc
LD     = $(PREFIX)gcc
OBJCOPY= $(PREFIX)objcopy

CFLAGS = -mthumb -mthumb-interwork -O2 -Wall -Wextra
CFLAGS += -ffast-math -fno-strict-aliasing
CFLAGS += -I$(DEVKITPRO)/libgba/include

LDFLAGS = -specs=gba.specs -mthumb -mthumb-interwork

SOURCES = $(wildcard source/*.c)
OBJECTS = $(SOURCES:.c=.o)

TARGET = herm_gba

all: $(TARGET).gba

$(TARGET).gba: $(TARGET).elf
	$(OBJCOPY) -O binary $< $@

$(TARGET).elf: $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^ -lgba

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJECTS) $(TARGET).elf $(TARGET).gba
