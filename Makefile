PREFIX ?= /usr/local
SRC = src/mon.c deps/ms/ms.c deps/commander/src/commander.c
OBJ = $(SRC:.c=.o)
CFLAGS = -D_GNU_SOURCE -std=c99 -I deps/ms -I deps/commander/src

mon: $(OBJ)
	$(CC) $^ -o $@

%.o: %.c
	$(CC) $< $(CFLAGS) -c -o $@

install: mon
	cp -f mon $(PREFIX)/bin/mon

uninstall:
	rm -f $(PREFIX)/bin/mon

clean:
	rm -f mon $(OBJ)

.PHONY: clean install uninstall