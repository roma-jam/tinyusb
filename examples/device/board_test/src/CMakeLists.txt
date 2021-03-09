idf_component_register(SRCS "main.c"
                    INCLUDE_DIRS "."
                    REQUIRES freertos soc)
                    
string(REGEX MATCH "^(esp32s[2-3])*" board_target "${BOARD}")

if(NOT BOARD OR NOT board_target)
    message(FATAL_ERROR "Incorrect or unsupported board type: ${BOARD}, example: make BOARD=esp32s2_saola_1" )
else()
    message(STATUS , "START src folder cmake file ${BOARD}")
    set(chip_family "esp32sx")
    set(IDF_TARGET "${board_target}")
endif()

string(TOUPPER ${board_target} upper_case_target)

target_compile_options(${COMPONENT_TARGET} PUBLIC
  "-DCFG_TUSB_MCU=OPT_MCU_${upper_case_target}"
  "-DCFG_TUSB_OS=OPT_OS_FREERTOS"
)

idf_component_get_property( FREERTOS_ORIG_INCLUDE_PATH freertos ORIG_INCLUDE_PATH)
target_include_directories(${COMPONENT_TARGET} PUBLIC
  "${FREERTOS_ORIG_INCLUDE_PATH}"
  "${TOP}/hw"
  "${TOP}/src"
)
