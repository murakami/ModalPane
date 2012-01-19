//
//  ModalPaneViewController.h
//  ModalPane
//
//  Created by 村上 幸雄 on 12/01/19.
//  Copyright (c) 2012年 ビッツ有限会社. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalPaneViewController;

@protocol ModalPaneViewControllerDelegate <NSObject>
- (void)modalPaneViewControllerDidDone:(ModalPaneViewController *)modalPaneViewController;
- (void)modalPaneViewControllerDidCancel:(ModalPaneViewController *)modalPaneViewController;
@end

@interface ModalPaneViewController : UIViewController

@property (nonatomic, weak) id<ModalPaneViewControllerDelegate>   delegate;

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@end
