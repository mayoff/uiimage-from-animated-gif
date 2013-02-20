#import "ViewController.h"
#import "UIImage+animatedGIF.h"

@implementation ViewController
@synthesize dataImageView;
@synthesize urlImageView;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"gif"];
    self.dataImageView.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
    self.urlImageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];

    url = [[NSBundle mainBundle] URLForResource:@"variableDuration" withExtension:@"gif"];
    self.variableDurationImageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
