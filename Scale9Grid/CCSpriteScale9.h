//
// CCSpriteScale9.h
// http://jpsarda.tumblr.com/post/9162433577/scale9grid-for-cocos2d
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface CCSpriteScale9 : CCNode <CCRGBAProtocol, CCTextureProtocol> {
	CGSize capSize,spriteSize;
	CGSize capSizeInPixels,spriteSizeInPixels;
	
	int vertexDataCount;
	ccV2F_C4F_T2F *vertexData;
	//
	// Data used when the sprite is self-rendered
	//
	ccBlendFunc				blendFunc_;				// Needed for the texture protocol
	CCTexture2D				*texture_;				// Texture used to render the sprite
	
	// Texture rects
	CGRect	rect_;
	CGRect	rectInPixels_;
	
	// opacity and RGB protocol
	GLubyte		opacity_;
	ccColor3B	color_;
	ccColor3B	colorUnmodified_;
	BOOL		opacityModifyRGB_;
}
+(id)spriteWithFile:(NSString*)f andLeftCapWidth:(float)lw andTopCapHeight:(float)th;
/** conforms to CCTextureProtocol protocol */
@property (nonatomic,readwrite) ccBlendFunc blendFunc;
-(void) setTextureRect:(CGRect) rect;
//Scale the sprite preserving the corners aspect ratio
-(void) scale9:(CGSize) size;
//Same as scale9 except that if the size is too small, we scale down the sprite
-(void) adaptiveScale9:(CGSize) size;
@end
