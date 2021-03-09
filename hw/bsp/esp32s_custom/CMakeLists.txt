idf_component_register(SRCS "${BOARD}.c" "led_strip/src/led_strip_rmt_ws2812.c"
                    INCLUDE_DIRS "led_strip/include"
                    PRIV_REQUIRES "driver"
                    REQUIRES freertos src)

message("cmake project configured target = ${CONFIG_IDF_TARGET}.")
          
if($ENV{IDF_TARGET} STREQUAL "esp32s3")
  set(tusb_mcu "OPT_MCU_ESP32S3")
  set(board_led_pin "47")
elseif($ENV{IDF_TARGET} STREQUAL "esp32s2")
  set(tusb_mcu "OPT_MCU_ESP32S2")
  set(board_led_pin "18")
else()
  message("TinyUSB does not support target $ENV{IDF_TARGET}.")
  return()
endif()

target_compile_options(${COMPONENT_TARGET} PUBLIC
  "-DCFG_TUSB_MCU=${tusb_mcu}"
  "-DLED_PIN=${board_led_pin}"
)

idf_component_get_property( FREERTOS_ORIG_INCLUDE_PATH freertos ORIG_INCLUDE_PATH)
target_include_directories(${COMPONENT_TARGET} PUBLIC
  "${FREERTOS_ORIG_INCLUDE_PATH}"
  "${TOP}/hw"
  "${TOP}/src"  
)
