print('Hello World!')

gpio.mode(6, gpio.INPUT)

print(dht.read(6))
