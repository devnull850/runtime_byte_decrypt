#include <stdio.h>

#define LEN 0x2b

int main(void) {
	FILE *fd;
	unsigned char b[LEN+1];

	fd = fopen("hello.o", "rb");
	fseek(fd, 0x40, SEEK_SET);
	fread(b, 1, LEN, fd);
	fclose(fd);

	b[LEN] = 0;

	for (unsigned i = 0, *p = (unsigned *) b; i < 0xb; ++i) {
		*p ^= 0xae1fc0de;
		++p;
	}

	fd = fopen("bytes", "wb");
	fwrite(b, 1, LEN, fd);
	fclose(fd);

	return 0;
}
