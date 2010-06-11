/** <title>CGFont</title>

   <abstract>C Interface to graphics drawing library</abstract>

   Copyright <copy>(C) 2006 Free Software Foundation, Inc.</copy>

   Author: BALATON Zoltan <balaton@eik.bme.hu>
   Date: 2006
   Author: Eric Wasylishen <ewasylishen@gmail.com>
   Date: January, 2010

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.
   
   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.
   
   You should have received a copy of the GNU Lesser General Public
   License along with this library; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
   */

#include "CoreGraphics/CGBase.h"
#include "CoreGraphics/CGDataProvider.h"
#include "CoreGraphics/CGFont.h"

#import "internal/CGFontInternal.h"

//FIXME: hack
#ifdef __MINGW__
#import "cairo/CairoFontWin32.h"
#else
#import "cairo/CairoFontX11.h"
#endif

@implementation CGFont

+ (Class) fontClass
{
#ifdef __MINGW__
  return [CairoFontWin32 class];
#else
  return [CairoFontX11 class];
#endif
}

- (bool) canCreatePostScriptSubset: (CGFontPostScriptFormat)format
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CFStringRef) copyGlyphNameForGlyph: (CGGlyph)glyph
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CFDataRef) copyTableForTag: (uint32_t)tag
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CFArrayRef) copyTableTags
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CFArrayRef) copyVariationAxes
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CFDictionaryRef) copyVariations
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CGFontRef) createCopyWithVariations: (CFDictionaryRef)variations
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CFDataRef) createPostScriptEncoding: (const CGGlyph[])encoding
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CFDataRef) createPostScriptSubset: (CFStringRef)name
                                    : (CGFontPostScriptFormat)format
                                    : (const CGGlyph[])glyphs
                                    : (size_t)count
                                    : (const CGGlyph[])encoding
{
  [self doesNotRecognizeSelector: _cmd];
}

+ (CGFontRef) createWithDataProvider: (CGDataProviderRef)provider
{
  [self doesNotRecognizeSelector: _cmd];
}

+ (CGFontRef) createWithFontName: (CFStringRef)name
{
  [self doesNotRecognizeSelector: _cmd];
}

+ (CGFontRef) createWithPlatformFont: (void *)platformFontReference
{
  [self doesNotRecognizeSelector: _cmd];
}

- (bool) getGlyphAdvances: (const CGGlyph[])glyphs
                         : (size_t)count
                         : (int[]) advances
{
  [self doesNotRecognizeSelector: _cmd];
}

- (bool) getGlyphBBoxes: (const CGGlyph[])glyphs
                       : (size_t)count
                       : (CGRect[])bboxes
{
  [self doesNotRecognizeSelector: _cmd];
}

- (CGGlyph) glyphWithGlyphName: (CFStringRef)glyphName
{
  [self doesNotRecognizeSelector: _cmd];
}

@end



bool CGFontCanCreatePostScriptSubset(
  CGFontRef font,
  CGFontPostScriptFormat format)
{
  return [(CGFont*)font canCreatePostScriptSubset: format];
}

CFStringRef CGFontCopyFullName(CGFontRef font)
{
  return ((CGFont*)font)->fullName;
}

CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph)
{
  return [(CGFont*)font copyGlyphNameForGlyph: glyph];
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return ((CGFont*)font)->postScriptName;
}

CFDataRef CGFontCopyTableForTag(CGFontRef font, uint32_t tag)
{
  return [(CGFont*)font copyTableForTag: tag];
}

CFArrayRef CGFontCopyTableTags(CGFontRef font)
{
  return [(CGFont*)font copyTableTags];
}

CFArrayRef CGFontCopyVariationAxes(CGFontRef font)
{
  return [(CGFont*)font copyVariationAxes];
}

CFDictionaryRef CGFontCopyVariations(CGFontRef font)
{
  return [(CGFont*)font copyVariations];
}

CGFontRef CGFontCreateCopyWithVariations(
  CGFontRef font,
  CFDictionaryRef variations)
{
  return [(CGFont*)font createCopyWithVariations: variations];
}

CFDataRef CGFontCreatePostScriptEncoding(
  CGFontRef font,
  const CGGlyph encoding[256])
{
  return [(CGFont*)font createPostScriptEncoding: encoding];
}

CFDataRef CGFontCreatePostScriptSubset(
  CGFontRef font,
  CFStringRef name,
  CGFontPostScriptFormat format,
  const CGGlyph glyphs[],
  size_t count,
  const CGGlyph encoding[256])
{
  return [(CGFont*)font createPostScriptSubset: name : format : glyphs : count : encoding];
}

CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider)
{
  return [[CGFont fontClass] createWithDataProvider: provider];
}

CGFontRef CGFontCreateWithFontName(CFStringRef name)
{
  return [[CGFont fontClass] createWithFontName: name];
}

CGFontRef CGFontCreateWithPlatformFont(void *platformFontReference)
{
  return [[CGFont fontClass] createWithPlatformFont: platformFontReference];
}

int CGFontGetAscent(CGFontRef font)
{
  return ((CGFont*)font)->ascent;
}

int CGFontGetCapHeight(CGFontRef font)
{
  return ((CGFont*)font)->capHeight;
}

int CGFontGetDescent(CGFontRef font)
{
  return ((CGFont*)font)->descent;
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  return ((CGFont*)font)->fontBBox;
}

bool CGFontGetGlyphAdvances(
  CGFontRef font,
  const CGGlyph glyphs[],
  size_t count,
  int advances[])
{
  return [(CGFont*)font getGlyphAdvances: glyphs : count : advances];
}

bool CGFontGetGlyphBBoxes(
  CGFontRef font,
  const CGGlyph glyphs[],
  size_t count,
  CGRect bboxes[])
{
  return [(CGFont*)font getGlyphBBoxes: glyphs : count : bboxes];
}

CGGlyph CGFontGetGlyphWithGlyphName(CGFontRef font, CFStringRef glyphName)
{
  return [(CGFont*)font glyphWithGlyphName: glyphName];
}

CGFloat CGFontGetItalicAngle(CGFontRef font)
{
  return ((CGFont*)font)->italicAngle;
}

int CGFontGetLeading(CGFontRef font)
{
  return ((CGFont*)font)->leading;
}

size_t CGFontGetNumberOfGlyphs(CGFontRef font)
{
  return ((CGFont*)font)->numberOfGlyphs;
}

CGFloat CGFontGetStemV(CGFontRef font)
{
  return ((CGFont*)font)->stemV;
}

CFTypeID CGFontGetTypeID()
{
  // FIXME: correct subclass?
  return [CGFont fontClass];
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return ((CGFont*)font)->unitsPerEm;
}

int CGFontGetXHeight(CGFontRef font)
{
  return ((CGFont*)font)->xHeight;
}

CGFontRef CGFontRetain(CGFontRef font)
{
  return (CGFontRef)[(CGFont*)font retain];
}

void CGFontRelease(CGFontRef font)
{
  [(CGFont*)font release];
}