all: aufg1 aufg2

test1: aufg1
	./aufg1

test2: aufg2
	./aufg2

aufg1: aufg1.pas
	fpc -TLINUX aufg1.pas

aufg2: aufg2.pas
	fpc -TLINUX aufg2.pas

clean:
	rm -f *.o aufg1 aufg2
