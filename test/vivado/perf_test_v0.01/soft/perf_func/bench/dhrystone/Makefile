CFLAGS= -O3 -mno-abicalls -funroll-all-loops -falign-jumps=16 -falign-functions=16 -fgcse-sm -fgcse-las -finline-functions -finline-limit=1000 -msoft-float -EL -march=mips1 -mips1
CFLAGS+= -G8 -DTIME -DRUNNUMBERS=10
CFLAGS+= -I ../../include -include stdio.h

all: $(patsubst %.c, %.o, $(wildcard *.c))
	$(CROSS_COMPILE)ar -cr dhrystone.a $^ 

%.o: %.c
	$(CROSS_COMPILE)gcc $(CFLAGS) -c $<

clean:
	rm -f *.o
	rm -f *.a
