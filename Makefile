layout.bin: soarer layout.txt
	./soarer/tools/scas layout.txt layout.bin

dl/Soarer_Converter_v1.10.zip:
	mkdir -p dl
	curl 'https://geekhack.org/index.php?action=dlattach;topic=17458.0;attach=10519' > $@

dl/Soarer_Converter_v1.12_update.zip:
	mkdir -p dl
	curl 'https://geekhack.org/index.php?action=dlattach;topic=17458.0;attach=25397' > $@

dl/Soarer_Converter_v1.12_docs.zip:
	mkdir -p dl
	curl 'https://geekhack.org/index.php?action=dlattach;topic=17458.0;attach=29917' > $@

soarer: dl/Soarer_Converter_v1.10.zip dl/Soarer_Converter_v1.12_update.zip dl/Soarer_Converter_v1.12_docs.zip
	mkdir -p soarer/
	cd soarer && unzip ../dl/Soarer_Converter_v1.10.zip
	cd soarer && unzip -o ../dl/Soarer_Converter_v1.12_docs.zip
	cd soarer/firmware && unzip ../../dl/Soarer_Converter_v1.12_update.zip
	cd soarer/tools && tar -zxvf Soarer_sctools_v1.10_linux.tar.gz

write: soarer layout.bin
	./soarer/tools/scwr layout.bin

.PHONY: write
