SRC = baby.c

all:
	#make aarch64.bin
	#make alpha.bin
	#make arm.bin
	#make hppa64.bin
	#make hppa.bin
	#make i686.bin
	#make m68k.bin
	#make mips64el.bin
	#make mips64.bin
	#make mipsel.bin
	#make mips.bin
	#make powerpc64le.bin
	#make powerpc64.bin
	#make powerpc.bin
	#make powerpc.bin
	#make riscv64.bin
	#make s390x.bin
	#make sh4.bin
	#make sparc64.bin
	make x86_64.bin

%.bin : $(SRC)
	$(eval ARCH := $(shell echo $@ | sed -e "s/\..*//"))
	$(shell ls /usr/bin/$(ARCH)-linux-*-gcc | head -n1) -Wl,-z,lazy -o ../deployment/baby.$(ARCH) $(SRC)
