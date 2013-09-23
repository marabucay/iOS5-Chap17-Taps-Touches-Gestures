//
//  BIDViewController.m
//  Swipes
//
//  Created by Maria Alice C. Lim on 9/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "BIDViewController.h"

#define kMinimumGestureLength 25
#define kMaximumVariance 5

@implementation BIDViewController
@synthesize label;
@synthesize gestureStartPoint;
- (void)eraseText {
    label.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    for (NSUInteger touchCount = 1; touchCount <= 5; touchCount++) {
        UISwipeGestureRecognizer *vertical;
        vertical = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                             action:@selector(reportVerticalSwipe:)];
        vertical.direction = UISwipeGestureRecognizerDirectionUp
        | UISwipeGestureRecognizerDirectionDown;
        vertical.numberOfTouchesRequired = touchCount;
        [self.view addGestureRecognizer:vertical];
        UISwipeGestureRecognizer *horizontal;
        horizontal = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                               action:@selector(reportHorizontalSwipe:)];
        horizontal.direction = UISwipeGestureRecognizerDirectionLeft
        | UISwipeGestureRecognizerDirectionRight;
        horizontal.numberOfTouchesRequired = touchCount;
        [self.view addGestureRecognizer:horizontal];
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
- (NSString *)descriptionForTouchCount:(NSUInteger)touchCount {
    switch (touchCount) {
        case 2:
            return @"Double ";
        case 3:
            return @"Triple ";
        case 4:
            return @"Quadruple ";
        case 5:
            return @"Quintuple ";
        default:
            return @"";
    }
}
- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer {
    label.text = [NSString stringWithFormat:@"%@Horizontal swipe detected",
                  [self descriptionForTouchCount:[recognizer numberOfTouches]]];
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}
- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer {
    label.text = [NSString stringWithFormat:@"%@Vertical swipe detected",
                   [self descriptionForTouchCount:[recognizer numberOfTouches]]];;
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

@end
