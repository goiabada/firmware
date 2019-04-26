CC=arm-none-eabi-gcc
FIRMWARE=goiaba
GENBIN=arm-none-eabi-objcopy
SRC= $(wildcard src/*.c)
OBJ=$(SRC:.c=.o)
LINKFLAGS=-mcpu=cortex-m3 -mthumb -Os -lm -lgcc
FLAGS=-x c -c -g -Os -w -std=gnu11 -mcpu=cortex-m3 -mthumb -ffunction-sections \
	-fdata-sections -nostdlib -fno-threadsafe-statics --param max-inline-insns-single=500 \
	-fno-rtti -fno-exceptions -DF_CPU=84000000L -DARDUINO=10809 -DARDUINO_SAM_DUE -DARDUINO_ARCH_SAM \
	-D__SAM3X8E__ -mthumb -DUSB_VID=0x2341 -DUSB_PID=0x003e -DUSBCON \
	-I/home/igor/.arduino-core-sam/system/libsam -I/home/igor/.arduino-core-sam/system/CMSIS/Device/ATMEL
LIBDIR=-I

goiaba: link
	GENBIN -O 

link: $(OBJ)
	echo $(OBJ)
	$(CC) $(LINKFLAGS) -o $(FIRMWARE).elf $<

%.o: %.c 
	$(CC) $(FLAGS) $^


clean:
	rm -rf *.o *.elf *.map *.hex
