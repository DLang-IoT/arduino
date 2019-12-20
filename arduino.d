import gpio;
import adc;

/** 
 * This function sets the pin mode for the given pin
 * If the function called by digitalRead throws an exception, the execution will stop.
 * Params:
 *   pinNumber = GPIO pin to be set.
 *   pinMode = mode for the pin to be set
 * Example:
 *    arduino.pinMode(12, "in");
 */
void pinMode(int pinNumber, string pinMode)
{
	gpio.mode(pinNumber, pinMode);
}

/** 
 * This function reads the digital value from the given pin
 * If the function called by digitalRead throws an exception, the execution will stop.
 * Params:
 *   pinNumber = pin number to read from.
 * Example:
 *    int res = arduino.digitalRead(12);
 */
int digitalRead(int pinNumber)
{
	return gpio.read(pinNumber);
}


/** 
 * This function writes the given digital value to the given pin
 * If the function called by digitalWrite throws an exception, the execution will stop.
 * Params:
 *   pinNumber = pin number to write to.
 *   value = value to be written
 * Example:
 *    arduino.digitalWrite(12, 1);
 */
void digitalWrite(int pinNumber, int value)
{
	gpio.write(pinNumber, value);
}

/** 
 * This function reads the analog value from the given pin
 * If the function called by analogRead throws an exception, the execution will stop.
 * The function adc.read throws exception if the board used is other than BeagleBone (that supports ADC)
 * Params:
 *   pinNumber = pin to read from.
 * Example:
 *    float res = arduino.digitalRead(12);
 */
float analogRead(int pinNumber)
{
	return adc.read(pinNumber);
}

/** 
 * This function unexports the given pin
 * If the function called by unexportPin throws an exception, the execution will stop. 
 * Must be called for each exported pin at the end of the program
 * Params:
 *   pinNumber = GPIO pin to be unexported
 * Example:
 *   gpio.unexportPin(12);
 */
void unexportPin(int pinNumber)
{
	gpio.unexport(pinNumber);
}

/* Function not implemented yet */
void analogWrite(int pinNumber, int value)
{
	// not yet unimplemented
}