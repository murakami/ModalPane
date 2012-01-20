//
//  ModalPaneViewController.m
//  ModalPane
//
//  Created by 村上 幸雄 on 12/01/19.
//  Copyright (c) 2012年 ビッツ有限会社. All rights reserved.
//

#import "ModalPaneViewController.h"

@interface ModalPaneViewController ()
@end

@implementation ModalPaneViewController

@synthesize delegate = _delegate;
@synthesize completionHandler = _completionHandler;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    self.delegate = nil;
    self.completionHandler = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBAction

- (IBAction)done:(id)sender
{
    DBGMSG(@"%s", __func__);
    if ((self.delegate)
            && ([self.delegate respondsToSelector:@selector(modalPaneViewControllerDidDone:)])) {
        [self.delegate modalPaneViewControllerDidDone:self];
    }
    if (self.completionHandler) {
        self.completionHandler(ModalPaneViewControllerResultDone);
    }
}

- (IBAction)cancel:(id)sender
{
    DBGMSG(@"%s", __func__);
    if ((self.delegate)
            && ([self.delegate respondsToSelector:@selector(modalPaneViewControllerDidCancel:)])) {
        [self.delegate modalPaneViewControllerDidCancel:self];
    }
    if (self.completionHandler) {
        self.completionHandler(ModalPaneViewControllerResultCancelled);
    }
}

@end
