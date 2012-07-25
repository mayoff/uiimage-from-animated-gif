This project defines a category `animatedGIF` on `UIImage`.  The category defines two methods.  This method creates an animated `UIImage` using the frames of the GIF in `data`:

    +[UIImage animatedImageWithAnimatedGIFData:(NSData *)data duration:(NSTimeInterval)duration]

This method creates an animated `UIImage` using the frames of the GIF loaded from `url`:

    +[UIImage animatedImageWithAnimatedGIFURL:(NSURL *)url duration:(NSTimeInterval)duration]

**To use this category in your own project,** copy `UIImage+animatedGIF.h` and `UIImage+animatedGIF.m` to your project, and add `ImageIO.framework` to the "Link Binary With Libraries" build phase of your target.

The implementation of this category is quite simple.  It uses the [Image I/O Framework](http://developer.apple.com/library/ios/#documentation/GraphicsImaging/Conceptual/ImageIOGuide/imageio_intro/ikpg_intro.html) to do all of the real work.

The contents of this repository are dedicated to the public domain, in accordance with the [CC0 1.0 Universal Public Domain Dedication](http://creativecommons.org/publicdomain/zero/1.0/), which is reproduced in the file `COPYRIGHT`.

Author: Rob Mayoff
2012-01-27
