#import <UIKit/UIKit.h>

@interface UIImage (animatedGIF)

+ (UIImage *)imageWithAnimatedGIFData:(NSData *)data duration:(NSTimeInterval)duration;
+ (UIImage *)imageWithAnimatedGIFURL:(NSURL *)url duration:(NSTimeInterval)duration;

@end
