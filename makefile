CC=gcc
CFLAGS=-Wall -Wextra
BUILD_PATH=./build
TARGET_NAME=sh
TARGET_PATH=$(BUILD_PATH)/$(TARGET_NAME)

all: $(TARGET_NAME)

$(BUILD_PATH)/sh.o: sh.c 
	mkdir -p $(@D)
	$(CC) -c $(CFLAGS) -o $@ $<

$(TARGET_NAME): $(BUILD_PATH)/sh.o
	$(CC) $(CFLAGS) -o $(TARGET_PATH) $(BUILD_PATH)/sh.o

clean:
	rm -rf $(BUILD_PATH)

run: $(TARGET_NAME)
	$(TARGET_PATH)

mem: $(TARGET_NAME)
	valgrind --leak-check=full --show-leak-kinds=all $(TARGET_PATH)
