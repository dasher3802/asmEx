#Makefile

OBJECTS = test.o
TARGET = test
SRCS = $(OBJECTS:.o=.s)

$(TARGET): $(OBJECTS)
	gcc -o $@ $+

$(OBJECTS): $(SRCS)
	as -o $@ $<

clean:
	rm -vf $(TARGET) *.o
