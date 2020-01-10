#include <stdio.h>
#include <stdint.h>

#include <sys/mman.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
	int fd = open("/dev/mem", O_RDWR);
	
	void *ptr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x40000000);

	if (ptr == MAP_FAILED) {
		printf("mmap failed");
		return -1;
	}

	volatile uint32_t *led = ptr;

	*led = 3;

	munmap(ptr, 4096);
	return 0;
};
