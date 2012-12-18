NAME=erg

erg: ${NAME}.cpp
	g++ -Wall -o ${NAME} ${NAME}.cpp

test: ${NAME}
	gnuplot -persist gnuplot.script

clean:
	rm -f ${NAME}
	rm -f ${NAME}.o