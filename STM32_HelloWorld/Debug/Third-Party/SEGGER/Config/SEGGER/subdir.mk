################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT.c \
../Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT_printf.c \
../Third-Party/SEGGER/Config/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT.o \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT_printf.o \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT.d \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_RTT_printf.d \
./Third-Party/SEGGER/Config/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/SEGGER/Config/SEGGER/%.o: ../Third-Party/SEGGER/Config/SEGGER/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F446RETx -DNUCLEO_F446RE -DDEBUG -DSTM32F446xx -DUSE_STDPERIPH_DRIVER -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/StdPeriph_Driver/inc" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/SEGGER/Config" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/SEGGER/OS" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/SEGGER/SEGGER" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Config" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/FreeRTOS/org/Source/include" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/inc" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/CMSIS/device" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/CMSIS/core" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Third-Party/SEGGER/Config/SEGGER/%.o: ../Third-Party/SEGGER/Config/SEGGER/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F446RETx -DNUCLEO_F446RE -DDEBUG -DSTM32F446xx -DUSE_STDPERIPH_DRIVER -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/StdPeriph_Driver/inc" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/SEGGER/Config" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/SEGGER/OS" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/SEGGER/SEGGER" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Config" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/Third-Party/FreeRTOS/org/Source/include" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/inc" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/CMSIS/device" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_HelloWorld/CMSIS/core" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


