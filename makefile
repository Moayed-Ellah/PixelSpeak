language_name = pixelspeak
exec = $(language_name).out
sources = $(wildcard src/*.c)
objects = $(sources:.c=.o)
CFLAGS = -g

# build the executable 'PixelSpeak.out
$(exec): $(objects)
	gcc $(objects) $(CFLAGS) -o $(exec)
	
%.o: %.c include/%.h
	gcc -c $(CFLAGS) $< -o $@

# install the language globally on the system
install:
	make
	cp ./$(language_name).out /usr/bin/$(language_name)

# remove all the object files and the executable
clean:
	-rm *.o
	-rm *.out
	-rm src/*.o

# uninstall the language from the system
uninstall:
	-rm /usr/bin/$(language_name)
	
.PHONY: clean install uninstall

# Path: PixelSpeak/src/main.c