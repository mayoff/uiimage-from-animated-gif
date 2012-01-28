#import "ViewController.h"
#import "UIImage+animatedGIF.h"

@implementation ViewController
@synthesize dataImageView;
@synthesize urlImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"gif"];
    self.dataImageView.image = [UIImage imageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
    self.urlImageView.image = [UIImage imageWithAnimatedGIFURL:url];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidUnload {
    [self setDataImageView:nil];
    [self setUrlImageView:nil];
    [super viewDidUnload];
}
@end
