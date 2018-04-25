#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
	unsigned long long offset1;
	unsigned long long offset2;
	unsigned char what;
	while (1)
	{
		if (scanf("asdf[%llx] = %2hhx", &offset1, &what) == 2) asdf[offset] = what;
		else if (scanf("(*(asdf+%llx))[%llx] = %2hhx", &offset1, offset2, &what) == 2)
		{
			(*(asdf+offset))[offset2] = what;
			break;
		}
		else break;
	}
}
