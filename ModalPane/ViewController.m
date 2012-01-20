//
//  ViewController.m
//  ModalPane
//
//  Created by 村上 幸雄 on 12/01/19.
//  Copyright (c) 2012年 ビッツ有限会社. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)didDone:(id)arg;
- (void)didCencel:(id)arg;
@end

@implementation ViewController

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

#pragma mark - IBAction

- (IBAction)modalPane:(id)sender
{
    DBGMSG(@"%s", __func__);
    ModalPaneViewController *viewController = [[ModalPaneViewController alloc] 
                                               initWithNibName:@"ModalPaneViewController"
                                               bundle:nil];
    //viewController.delegate = self;
    [viewController setCompletionHandler:^(ModalPaneViewControllerResult result) {
        switch (result) {
            case ModalPaneViewControllerResultCancelled:
                [self performSelectorOnMainThread:@selector(didCencel:) withObject:nil waitUntilDone:NO];
                break;
            case ModalPaneViewControllerResultDone:
                [self performSelectorOnMainThread:@selector(didDone:) withObject:nil waitUntilDone:NO];
                break;
            default:
                break;
        }
        
        [self dismissModalViewControllerAnimated:YES];
    }];
    [self presentModalViewController:viewController animated:YES];
}

#pragma mark - private

- (void)didDone:(id)arg
{
    DBGMSG(@"%s", __func__);
}

- (void)didCencel:(id)arg
{
    DBGMSG(@"%s", __func__);
}

#pragma mark - ModalPaneViewControllerDelegate

- (void)modalPaneViewControllerDidDone:(ModalPaneViewController *)modalPaneViewController
{
    DBGMSG(@"%s", __func__);
    [self dismissModalViewControllerAnimated:YES];
}

- (void)modalPaneViewControllerDidCancel:(ModalPaneViewController *)modalPaneViewController
{
    DBGMSG(@"%s", __func__);
    [self dismissModalViewControllerAnimated:YES];
}

@end
