# Set Cross Compiler for ESP32 chip and USB target

$(call check_defined, IDF_TARGET, example: IDF_TARGET=esp32s2)

ifneq ("$(IDF_TARGET)","esp32s2")
    ifeq ("$(IDF_TARGET)","esp32s3")
        CROSS_COMPILE = xtensa-esp32s3-elf-
        CFLAGS += \
        "-DCFG_TUSB_MCU=OPT_MCU_ESP32S3"
        "-DLED_PIN=47" 
    else 
        $(error Incorrect target $(IDF_TARGET) for board ${BOARD} specified.)
    endif
else
    CROSS_COMPILE = xtensa-esp32s2-elf-
    CFLAGS += \
    "-DCFG_TUSB_MCU=OPT_MCU_ESP32S2"
    "-DLED_PIN=18"
endif
