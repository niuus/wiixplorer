#ifndef _HTTP_H_
#define _HTTP_H_

#include <errno.h>
#include <ogcsys.h>
#include <stdarg.h>
#include <string.h>

#ifdef __cplusplus
extern "C"
{
#endif

#include "dns.h"

/**
 * A simple structure to keep track of the size of a malloc()ated block of memory
 */
struct block
{
	u32 size;
	unsigned char *data;
};

extern const struct block emptyblock;

struct block downloadfile(const char *url);
s32 GetConnection(char * domain);
int network_request(int connection, const char * request, char * filename);
int network_read(int connection, u8 *buf, u32 len);

#ifdef __cplusplus
}
#endif

#endif /* _HTTP_H_ */
