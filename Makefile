SOURCE = $(wildcard main.c huffman/*.c fileio/*.c LZW/*.c error/*.c)

OBJ = $(subst .c,.o,$(SOURCE))

HEADER_I = huffman/include/ fileio/include/ LZW/include/ error/include/

HEADER = $(wildcard $(addsuffix *.h,$(HEADER_I)))

I_FLAG = $(addprefix -I ,$(HEADER_I))
#DEBUG = -g3
C_FLAG = -Wall $(DEBUG)
#MEM_FLAG = -fsanitize=address

EXE = compress

all: run

run : $(OBJ)
	$(CC) $(I_FLAG) $(MEM_FLAG) $(OBJ) -o $(EXE)

%.o:%.c $(HEADER) Makefile
	$(CC) $(I_FLAG) $(C_FLAG) $< -c -o $@

.PHONY: clean gendata plotdata

clean:
	-rm $(OBJ)

gendata:
	./results/generate_data.sh dat/dat[1-5]/*

plotdata:
	./results/plot.py result_huff.txt result_lzw.txt
	

