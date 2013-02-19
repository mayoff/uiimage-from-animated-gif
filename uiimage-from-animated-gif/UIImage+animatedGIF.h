#import <UIKit/UIKit.h>

@interface UIImage (animatedGIF)

+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)data;
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)url;

@end
