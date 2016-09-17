/***************************************************************************
 * Copyright (C) 2010
 * by Dimok
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any
 * damages arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any
 * purpose, including commercial applications, and to alter it and
 * redistribute it freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you
 * must not claim that you wrote the original software. If you use
 * this software in a product, an acknowledgment in the product
 * documentation would be appreciated but is not required.
 *
 * 2. Altered source versions must be plainly marked as such, and
 * must not be misrepresented as being the original software.
 *
 * 3. This notice may not be removed or altered from any source
 * distribution.
 *
 * for WiiXplorer 2010
 ***************************************************************************/
#ifndef IMAGEWRITE_H_
#define IMAGEWRITE_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <gd.h>

/** Supported image write formats **/
#define IMAGE_PNG		0
#define IMAGE_JPEG		1
#define IMAGE_GIF		2
#define IMAGE_TIFF		3
#define IMAGE_BMP		4
#define IMAGE_GD		5
#define IMAGE_GD2		6

/** compression **/
//!< JPEG-Format (0-100):   where 0 is best quality and 100 best compression
//!< BMP-Format (0-9):	  where 0 is no compression and 9 best compression
//!< GD2-Format (0-1):	  where 0 is no compression and 1 compressed
//!<
//!< Does not affect other formats.

bool WriteGDImage(const char * filepath, gdImagePtr gdImg, u8 format, u8 compression);

#ifdef __cplusplus
}
#endif //__cplusplus

#endif //IMAGEWRITE_H_
