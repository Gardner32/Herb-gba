# -------- Herm GBA Makefile --------
TARGET := herm_gba

# Source folders: our code + grit outputs
SOURCES  := source build
INCLUDES := $(DEVKITPRO)/libgba/include

# Tools
CC      := arm-none-eabi-gcc
LD      := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy

# Compile / Link flags
CFLAGS  := -mthumb -mthumb-interwork -O2 -Wall -Wextra \
           -ffast-math -fno-strict-aliasing -I$(INCLUDES) -Ibuild
LDFLAGS := -specs=gba.specs -mthumb -mthumb-interwork \
           -L$(DEVKITPRO)/libgba/lib

# Gather all .c files from SOURCES
CFILES := $(foreach d,$(SOURCES),$(wildcard $(d)/*.c))
OBJS   := $(CFILES:.c=.o)

.PHONY: all clean
all: $(TARGET).gba

$(TARGET).elf: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ -lgba

$(TARGET).gba: $(TARGET).elf
	$(OBJCOPY) -O binary $< $@
	@gbafix $@ -t"HERM TEST" -c"01" -m"00"

# Generic C compile rule
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS) $(TARGET).elf $(TARGET).gba
