# arduino module for D-lang
Module for analog and digital functions, written in D-Lang
Analog and Digital functions for D-Lang

## Design
This module works with ADC module and GPIO module (also developed by me), uses sysfs and controls
the input and output pins through write and read operations. 

## Functions implemented
### Setting the pin mode
````d
void pinMode(int pinNumber, string pinMode);
````
Set the mode for the given pin. The function takes the following arguments:
* the number of the pin (must be a valid GPIO pin)
* the mode for the pin to be set :
    * "in" - the pin will be used as an input pin
        * can read the value, cannot write to this pin
    * "out" - the pin will be used as an output pin 
        * can write the value, does not matter if you read the value (will return the written value)

The function will do the following:
* Will call the ````d void mode(int pinNumber, string pinMode); ```` from the GPIO module. 
If an exception occurrs, the execution stops.

### Reading from a digital pin
````d
int digitalRead(int pinNumber)
````
Read the digital value from the given pin. The only argument taken is:
* the number of the pin(also a valid and already exported pin)

The function returns the value from the pin;

The function will do the following:
* Will call the ````d int read(int pinNumber); ```` from the GPIO module.
If an exception occurrs, the execution stops.

### Writing to a digital pin
````d
void digitalWrite(int pinNumber, int value);
````
Write the digital value to the given pin. The function takes the following arguments:
* the number of the pin(must be a valid, already exportet output pin)
* the value to be written to the pin

The function will do the following:
* Will call the ````d void read(int pinNumber, int value); ```` from the GPIO module.
If an exception occurrs, the exception stops.

### Reading from an analog pin
````d
float analogRead(int pinNumber)
````
Read the analog value from the given pin. The only argument taken is:
* the number of the pin(also a valid and already exported pin)

The function returns the value from the pin;

The function will do the following:
* Will call the ````d float read(int pinNumber); ```` from the ADC module.
If an exception occurrs, the execution stops.

### Unexporting a pin
````d
void unexportPin(int pinNumber);
````
Unexport the given GPIO pin, given as an argument.
This function must be called for each exported pin at the end of the program.
The function will do the following:
* Will call the ````d void unexport(int pinNumber); ```` from the GPIO module.
If an exception occurrs, the execution stops.


## Example: 
### Read potentiometer value to turn on a LED
````d
import gpio;
import core.thread;

void main() {
    int waitTime = 3, i = 0;
    /* set GPIO pin 12 as an output pin - the LED */
    arduino.mode(12, "out");
    /* run until the read value is higher than 0.9 */
    while (arduino.analogRead(1) < 0.9) {
        writeln("Potentiometer has not reached the desired resistance yet...");
    }
    /* value is reached */ 
    writeln("Value reached!");
    /* turn on the LED */
    arduino.digitalWrite(12, 1);
    /* wait 3 seconds before terminating */
    Thread.sleep(waitTime.seconds);
    /* unexport GPIO pin 12 */
    gpio.unexport(12);
}
````

### Waiting until a button is pressed to power on a LED
````d
import gpio;
import std.stdio;
import core.thread;

void main() {
    int waitTime = 5;
    /* set GPIO pin 12 as an input pin - the button */
    arduino.pinMode(12, "in");
    /* set GPIO pin 13 as an output pin - the LED */
    arduino.pinMode(13, "out");
    /* make sure the LED is being turned off */
    arduino.digitalWrite(13, 0);
    /* wait while button is not pressed and the read value is not 1(HIGH) */
    while (arduino.digitalRead(12) != 1) {
        writeln("Button not pressed yet...");
    }
    /* button is pressed */
    writeln("Button pressed!");
    /* turn on the LED */
    arduino.digitalWrite(13, 1);
    /* wait 5 seconds before terminating */
    Thread.sleep(waitTime.seconds);
    /* unexport GPIO pins 12 and 13*/
    arduino.unexportPin(12);
    arduino.unexportPin(13);
}
````
