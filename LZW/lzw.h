#ifndef __LZW_H
#define __LZW_H

#include "dict.h"
long insert_chars(dict *code_dict);

long lzw_encoder(file *infile, file *outfile);

#endif
