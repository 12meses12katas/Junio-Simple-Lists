################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Lists/DoublyLinkedList.cpp \
../src/Lists/SinglyLinkedList.cpp 

OBJS += \
./src/Lists/DoublyLinkedList.o \
./src/Lists/SinglyLinkedList.o 

CPP_DEPS += \
./src/Lists/DoublyLinkedList.d \
./src/Lists/SinglyLinkedList.d 


# Each subdirectory must supply rules for building sources it contributes
src/Lists/%.o: ../src/Lists/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


