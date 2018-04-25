#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

char asdf[1024];

int main()
{
	struct {
		unsigned long long i;
		unsigned char fdsa[128];
	} local;
	int j = 0;
	int k = 0;

	puts("\"No Leaks\" was good enough in March, but to make it to finals, you'll need to do in PIE, and blindfolded!");
	printf("Index: ");
	scanf("%d", &local.i);
	if (local.i >= sizeof(asdf))
	{
		puts("NOT SO FAST!");
		exit(0x46);
	}
	printf("Hex: ");
	read(0, local.fdsa, 2*(sizeof(asdf)-local.i));
	for (j = 0; (k = sscanf(local.fdsa+j+k, "%2hhx", asdf+local.i+k)) >= 0; j += k);
	puts("Better luck next time!");
}
