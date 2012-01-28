#import <UIKit/UIKit.h>

@interface UIImage (animatedGIF)

+ (UIImage *)imageWithAnimatedGIFData:(NSData *)data;
+ (UIImage *)imageWithAnimatedGIFURL:(NSURL *)url;

@end
