## Summary

This project defines a category `animatedGIF` on `UIImage`.  The category defines two methods.  This method creates an animated `UIImage` using the frames of the GIF in `data`:

    +[UIImage animatedImageWithAnimatedGIFData:(NSData *)data]

This method creates an animated `UIImage` using the frames of the GIF loaded from `url`:

    +[UIImage animatedImageWithAnimatedGIFURL:(NSURL *)url]
    
Look at the comments in `UIImage+animatedGIF.h` for details.

You can build and run the project to see a trivial demo app.

## To use this category in your own project

1. Copy `UIImage+animatedGIF.h` and `UIImage+animatedGIF.m` to your project.
2. Add `UIImage+animatedGIF.m` to your target's “Compile Sources” build phase, if you didn't tell Xcode to do that when you performed step 1.
3. Add `ImageIO.framework` to your target's "Link Binary With Libraries" build phase.

## Implementation notes

The implementation of this category uses the [Image I/O Framework](http://developer.apple.com/library/ios/#documentation/GraphicsImaging/Conceptual/ImageIOGuide/imageio_intro/ikpg_intro.html) to extract the images and durations from the GIF data.

[Diego Peinador](https://github.com/diegopeinador) provided the inspiration for handling variable-frame-rate animations, although I didn't end up using his code.

## Copyright or lack thereof

The contents of this repository are dedicated to the public domain, in accordance with the [CC0 1.0 Universal Public Domain Dedication](http://creativecommons.org/publicdomain/zero/1.0/), which is reproduced in the file `COPYRIGHT`.

Author: Rob Mayoff
2012-01-27
