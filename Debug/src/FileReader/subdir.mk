################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/FileReader/FileReader.cpp 

OBJS += \
./src/FileReader/FileReader.o 

CPP_DEPS += \
./src/FileReader/FileReader.d 


# Each subdirectory must supply rules for building sources it contributes
src/FileReader/%.o: ../src/FileReader/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


