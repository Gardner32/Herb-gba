# GBA Game Makefile

# Game name (this becomes the .gba filename)
TARGET := herm_gba

# Source and include dirs
SOURCES := source
INCLUDES := $(DEVKITPRO)/libgba/include

# Compiler settings
CC := arm-none-eabi-gcc
LD := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy

CFLAGS := -mthumb -mthumb-interwork -O2 -Wall -Wextra \
          -ffast-math -fno-strict-aliasing \
          -I$(INCLUDES)

LDFLAGS := -specs=gba.specs -mthumb -mthumb-interwork \
           -L$(DEVKITPRO)/libgba/lib

# Object files
OBJS := $(SOURCES)/main.o

# Default rule
all: $(TARGET).gba

# Build ELF
$(TARGET).elf: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ -lgba

# Build GBA from ELF
$(TARGET).gba: $(TARGET).elf
	$(OBJCOPY) -O binary $< $@
	@gbafix $@ -t"HERM TEST" -c"01" -m"00"

# Compile C source
$(SOURCES)/%.o: $(SOURCES)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean
clean:
	rm -f $(SOURCES)/*.o $(TARGET).elf $(TARGET).gba
