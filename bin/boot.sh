


# Turn on drivers

sudo modprobe -i uinput
sleep 1s

# Init input drivers

sudo python /home/pi/firmware/drivers/input/input_driver.py &
sleep 1s

# Init video driver GPIO

sudo echo "5" > /sys/class/gpio/export
sleep 1s

# Set GPIO direction

sudo echo "out" > /sys/class/gpio/gpio5/direction
sleep 1s

# Set active low, set to 0 to enable

sudo echo "0" > /sys/class/gpio/gpio5/value
sleep 1s

# Activate framebuffer

sudo /home/pi/firmware/drivers/video/fbcp-ili9341 &
sleep 1s

# Activate LEDs

sudo /home/pi/firmware/bin/lights.sh
sudo /home/pi/firmware/drivers/leds/open_lightsocket &
sleep 1s

# Display startup LED sequence

python /home/pi/firmware/drivers/leds/light_client/lightclient.py
