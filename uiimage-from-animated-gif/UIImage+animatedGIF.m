#import "UIImage+animatedGIF.h"
#import <ImageIO/ImageIO.h>

#if __has_feature(objc_arc)
#define toCF (__bridge CFTypeRef)
#else
#define toCF (CFTypeRef)
#endif

@implementation UIImage (animatedGIF)

static UIImage *imageWithAnimatedGIFImageSource(CGImageSourceRef source, NSTimeInterval duration) {
    if (!source)
        return nil;
    
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:count];
    for (size_t i = 0; i < count; ++i) {
        CGImageRef cgImage = CGImageSourceCreateImageAtIndex(source, i, NULL);
        if (!cgImage)
            return nil;
        [images addObject:[UIImage imageWithCGImage:cgImage]];
        CGImageRelease(cgImage);
    }

    return [UIImage animatedImageWithImages:images duration:duration];
}

static UIImage *imageWithAnimatedGIFReleasingImageSource(CGImageSourceRef source, NSTimeInterval duration) {
    UIImage *image = imageWithAnimatedGIFImageSource(source, duration);
    CFRelease(source);
    return image;
}

+ (UIImage *)imageWithAnimatedGIFData:(NSData *)data duration:(NSTimeInterval)duration {
    return imageWithAnimatedGIFReleasingImageSource(CGImageSourceCreateWithData(toCF data, NULL), duration);
}

+ (UIImage *)imageWithAnimatedGIFURL:(NSURL *)url duration:(NSTimeInterval)duration {
    return imageWithAnimatedGIFReleasingImageSource(CGImageSourceCreateWithURL(toCF url, NULL), duration);
}

@end
