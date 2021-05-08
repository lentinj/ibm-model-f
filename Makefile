layout.bin: layout.txt
	./tools/bin/scas layout.txt layout.bin

write: layout.bin
	./tools/bin/scwr layout.bin

.PHONY: write
