all: aufg5_cor

test: aufg5_cor
	./aufg5_cor

aufg5_cor: aufg5_cor.pas
	fpc -TLINUX aufg5_cor.pas

clean:
	rm -f aufg5_cor.o aufg5_cor

edit: aufg5_cor.pas
	nano aufg5_cor.pas
