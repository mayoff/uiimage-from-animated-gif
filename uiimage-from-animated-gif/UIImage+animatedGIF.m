#import "UIImage+animatedGIF.h"
#import <ImageIO/ImageIO.h>

#if __has_feature(objc_arc)
#define toCF (__bridge CFTypeRef)
#define toNSString (__bridge NSString*)
#define toNSDictionary (__bridge NSDictionary *)
#else
#define toCF (CFTypeRef)
#define toNSString (NSString*)
#define toNSDictionary (NSDictionary *)
#endif

@implementation UIImage (animatedGIF)

static UIImage *animatedImageWithAnimatedGIFImageSource(CGImageSourceRef source) {
    if (!source)
        return nil;
    
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray *delays = [NSMutableArray arrayWithCapacity:count];
    NSNumber *delay;
    NSDictionary *dict, *gifDict;
    double minDelay = INT_MAX, totalTime = 0;
    int times;
    // Properties
    for (size_t i = 0; i < count; ++i) {
        dict = toNSDictionary CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        
        gifDict = [dict objectForKey:toNSString kCGImagePropertyGIFDictionary];
        delay = [gifDict objectForKey:toNSString kCGImagePropertyGIFDelayTime];
        
        // store delay for each frame
        [delays addObject:delay];
        if ([delay doubleValue]>0 && [delay doubleValue]<minDelay) {
            minDelay = [delay doubleValue];
        }
    }
    if ([delays count]!=count) {
        return nil;
    }
    // setup frame images
    for (size_t i = 0; i < count; ++i) {
        CGImageRef cgImage = CGImageSourceCreateImageAtIndex(source, i, NULL);
        if (!cgImage)
            return nil;
        
        delay = [delays objectAtIndex:i];
        times = (int)round([delay doubleValue]/minDelay);
        times = times>0?times:1;

        // a long delayed frame is represented by several similar images
        for (int j=0; j<times; j++) {
            [images addObject:[UIImage imageWithCGImage:cgImage]];
            totalTime += minDelay;
        }
        CGImageRelease(cgImage);
    }

    return [UIImage animatedImageWithImages:images duration:totalTime];
}

static UIImage *animatedImageWithAnimatedGIFReleasingImageSource(CGImageSourceRef source) {
    UIImage *image = animatedImageWithAnimatedGIFImageSource(source);
    CFRelease(source);
    return image;
}

+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)data {
    return animatedImageWithAnimatedGIFReleasingImageSource(CGImageSourceCreateWithData(toCF data, NULL));
}

+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)url {
    return animatedImageWithAnimatedGIFReleasingImageSource(CGImageSourceCreateWithURL(toCF url, NULL));
}

@end
