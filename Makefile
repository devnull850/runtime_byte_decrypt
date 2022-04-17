all: exe

exe: mod
	chmod +x a.out
	rm test test.o hello hello.o bytes xor

mod: cp
	dd if=/dev/zero of=a.out bs=1 count=8 seek=40 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=6 seek=58 conv=notrunc
	dd if=test of=a.out bs=1 count=1 seek=56 skip=120 conv=notrunc
	dd if=test.s of=a.out bs=1 count=1 seek=24 skip=14 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=8 seek=72 conv=notrunc
	dd if=test.s of=a.out bs=1 count=1 seek=72 skip=14 conv=notrunc
	dd if=test.s of=a.out bs=1 count=1 seek=80 skip=14 conv=notrunc
	dd if=test.s of=a.out bs=1 count=1 seek=88 skip=14 conv=notrunc

cp: test bytes
	dd if=test of=a.out bs=1 count=64
	dd if=test of=a.out bs=1 count=56 seek=64 skip=120
	dd if=test of=a.out bs=1 count=90 seek=120 skip=4096
	dd if=bytes of=a.out bs=1 count=43 seek=122 conv=notrunc

test: test.o
	ld -o test test.o

test.o: test.s
	as -o test.o test.s

bytes: xor hello
	./xor

xor: xor.c
	gcc -Wall -Werror -o xor xor.c

hello: hello.o
	ld -o hello hello.o

hello.o: hello.s
	as -o hello.o hello.s

.PHONY:
clean:
	rm a.out
