# Cross Compiler for ESP32
CROSS_COMPILE = xtensa-esp32s2-elf-

CFLAGS += \
    "-DCFG_TUSB_MCU=OPT_MCU_ESP32S2"
    
CHIP_TARGET = esp32s2
CHIP_FAMILY = esp32sx
VENDOR = espressif