################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.c 

OBJS += \
./Third-Party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.o 

C_DEPS += \
./Third-Party/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/SEGGER/OS/%.o: ../Third-Party/SEGGER/OS/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F446RETx -DNUCLEO_F446RE -DDEBUG -DSTM32F446xx -DUSE_STDPERIPH_DRIVER -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/StdPeriph_Driver/inc" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/Third-Party/SEGGER/Config" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/Third-Party/SEGGER/OS" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/Third-Party/SEGGER/SEGGER" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/Config" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/Third-Party/FreeRTOS/org/Source/include" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/inc" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/CMSIS/device" -I"C:/Users/Nestor/Documents/embedded/freeRtos/RTOS_workspace/STM32_FreeRTOS_Led_and_button_IT_/CMSIS/core" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


