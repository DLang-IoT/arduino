import gpio;

void pinMode(int pinNumber, string pinMode)
{
	try {
		gpio.mode(pinNumber, pinMode);
	} catch (Exception e) {
		writeln(e.message);
	}
}


int digitalRead(int pinNumber)
{
	return gpio.read(pinNumber);
}

void digitalWrite(int pinNumber, int value)
{
	return gpio.write(pinNumber, value);
}

int analogRead(int pinNumber)
{
	// unimplemented
}

void analogRead(int pinNumber, int value)
{
	// unimplemented
}