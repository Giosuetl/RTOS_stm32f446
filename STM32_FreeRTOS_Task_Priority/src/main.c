/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/


#include "stm32f4xx.h"

#include "stm32f4xx.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "task.h"
#include <FreeRTOS.h>
#define TRUE	1
#define FALSE	0

#define NOT_PRESSED	FALSE
#define PRESSED		TRUE


uint8_t button_status_flag = NOT_PRESSED,switch_prio;

static void prvSetupHardware(void);
static void pvrSetupUart(void);
void printmsg(char *msg);
char usr_msg[250];
void vTask1_handler(void *params);
void vTask2_handler(void *params);
void rtos_delay(uint32_t delay_in_ms);
TaskHandle_t xTaskHandle1= NULL;
TaskHandle_t xTaskHandle2= NULL;


int main(void)
{
	//1. Reset the RCC clock configuration to the default reset state.
	//HSI ON, PLL OFF, HSE OFF, system clock = 16MHz, cpu_clock = 16MHz
	RCC_DeInit();
	//DWT->CTRL |= (1<<0);// Enable CYCCNT in DWT_CTRL
	//2. Update the SystemCoreClock variable
	SystemCoreClockUpdate();
	prvSetupHardware();
	//Start Recording
	//SEGGER_SYSVIEW_Conf();
	//SEGGER_SYSVIEW_Start();
	//lets create led_task
	xTaskCreate(vTask1_handler,"TASK-1",500,NULL,2,&xTaskHandle1);

	xTaskCreate(vTask2_handler,"TASK-1",500,NULL,3,&xTaskHandle2);

	//lets start the scheduler
	vTaskStartScheduler();
	for(;;);
}
void vTask1_handler(void *params)
{
	UBaseType_t p1,p2;
	sprintf(usr_msg,"Task-1 is running\r\n");
	printmsg(usr_msg);

	sprintf(usr_msg,"Task-1 Priority %ld\r\n",uxTaskPriorityGet(xTaskHandle1));
	printmsg(usr_msg);

	sprintf(usr_msg,"Task-2 Priority %ld\r\n",uxTaskPriorityGet(xTaskHandle2));
	printmsg(usr_msg);
	while(1)
	{
		sprintf(usr_msg,"Task-1 is running\r\n");
		printmsg(usr_msg);
		if(switch_prio)
		{
			sprintf(usr_msg,"Cambiando Prioridad\r\n");
			printmsg(usr_msg);
			switch_prio=FALSE;
			p1= uxTaskPriorityGet(xTaskHandle1);
			p2= uxTaskPriorityGet(xTaskHandle2);
			vTaskPrioritySet(xTaskHandle1,p2);
			vTaskPrioritySet(xTaskHandle2,p1);
		}else
		{
			GPIO_ToggleBits(GPIOA,GPIO_Pin_5);
			rtos_delay(1000);
		}
	}
}

void vTask2_handler(void *params)
{
	UBaseType_t p1,p2;
	sprintf(usr_msg,"Task-2 is running\r\n");
	printmsg(usr_msg);

	sprintf(usr_msg,"Task-1 Priority %ld\r\n",uxTaskPriorityGet(xTaskHandle1));
	printmsg(usr_msg);

	sprintf(usr_msg,"Task-2 Priority %ld\r\n",uxTaskPriorityGet(xTaskHandle2));
	printmsg(usr_msg);

	while(1)
	{
		sprintf(usr_msg,"Task-2 is running\r\n");
		printmsg(usr_msg);
		if(switch_prio)
		{
			sprintf(usr_msg,"Cambiando Prioridad\r\n");
			printmsg(usr_msg);
			switch_prio=FALSE;
			p1= uxTaskPriorityGet(xTaskHandle1);
			p2= uxTaskPriorityGet(xTaskHandle2);
			vTaskPrioritySet(xTaskHandle1,p2);
			vTaskPrioritySet(xTaskHandle2,p1);
		}else
		{
			GPIO_ToggleBits(GPIOA,GPIO_Pin_5);
			rtos_delay(1000);
		}
	}
}

void button_handler(void *params)
{
	button_status_flag ^=1;//XOR

}

static void pvrSetupUart(void)
{
	GPIO_InitTypeDef gpio_uart_pins;
		USART_InitTypeDef uart2_init;
		//1. Enable the UART and GPIOA Peripheral clock

		RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);

		//PA2 is UART2_TX, PA3 is UART2_RX

		//2. Alternate fnction configurations of MCU pins to behave as UART2 TX and RX
		//zeroing each and every member element of the structure
		memset(&gpio_uart_pins,0,sizeof(gpio_uart_pins));
		gpio_uart_pins.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3;
		gpio_uart_pins.GPIO_Mode = GPIO_Mode_AF;
		gpio_uart_pins.GPIO_PuPd = GPIO_PuPd_UP;

		GPIO_Init(GPIOA, &gpio_uart_pins);

		//3. AF mode settings for the pins
		GPIO_PinAFConfig(GPIOA,GPIO_PinSource2,GPIO_AF_USART2);//PA2
		GPIO_PinAFConfig(GPIOA,GPIO_PinSource3,GPIO_AF_USART2);//PA3

		//4. UART parameter initializations1
		memset(&uart2_init,0,sizeof(uart2_init));
		uart2_init.USART_BaudRate = 115200;
		uart2_init.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
		uart2_init.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
		uart2_init.USART_Parity = USART_Parity_No;
		uart2_init.USART_StopBits = USART_StopBits_1;
		uart2_init.USART_WordLength = USART_WordLength_8b;
		USART_Init(USART2, &uart2_init);
		//5. Enable the UART2 peripheral
		USART_Cmd(USART2,ENABLE);
}
void prvSetupGpio(void)
{
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG,ENABLE);
	GPIO_InitTypeDef led_init,button_init;
	led_init.GPIO_Mode = GPIO_Mode_OUT;
	led_init.GPIO_OType = GPIO_OType_PP;
	led_init.GPIO_Pin = GPIO_Pin_5;
	led_init.GPIO_Speed = GPIO_Low_Speed;
	led_init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOA,&led_init);

	button_init.GPIO_Mode = GPIO_Mode_IN;
	button_init.GPIO_OType = GPIO_OType_PP;
	button_init.GPIO_Pin = GPIO_Pin_13;
	button_init.GPIO_Speed = GPIO_Low_Speed;
	button_init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOC,&button_init);
	//interrupt configuration for the button(pc13)
	//1. system configuration for exti line (SYSCFG settings)
	SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOC,EXTI_PinSource13);
	//2. EXTI line configuration 13, fallin edge, interrup mode
	EXTI_InitTypeDef exti_init;
	exti_init.EXTI_Line = EXTI_Line13;
	exti_init.EXTI_Mode = EXTI_Mode_Interrupt;
	exti_init.EXTI_Trigger = EXTI_Trigger_Falling;
	exti_init.EXTI_LineCmd = ENABLE;
	EXTI_Init(&exti_init);
	//3. NVIC settings (IRQ settings for the selected EXTI line(13))
	NVIC_SetPriority(EXTI15_10_IRQn,5);
	NVIC_EnableIRQ(EXTI15_10_IRQn);


}
static void prvSetupHardware()
{
	//Setup Button and LED
	prvSetupGpio();
	//setup UART2
	pvrSetupUart();
}

void printmsg(char *msg)
{
	for(uint32_t i =0;i < strlen(msg);i++)
	{
		while(USART_GetFlagStatus(USART2,USART_FLAG_TXE)!= SET);
		USART_SendData(USART2,msg[i]);
	}
}

void EXTI15_10_IRQHandler(void)
{
	//traceISR_ENTER();
	//1. clear the interrupt pending bit of the EXTI line (13)
	EXTI_ClearITPendingBit(EXTI_Line13);
	switch_prio=TRUE;
	//traceISR_EXIT();
}
void rtos_delay(uint32_t delay_in_ms)
{
	uint32_t current_tick_count = xTaskGetTickCount();
	uint32_t delay_in_ticks= (delay_in_ms*configTICK_RATE_HZ)/1000;

	while(xTaskGetTickCount() < (current_tick_count + delay_in_ticks));
}

