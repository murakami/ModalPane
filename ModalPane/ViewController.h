//
//  ViewController.h
//  ModalPane
//
//  Created by 村上 幸雄 on 12/01/19.
//  Copyright (c) 2012年 ビッツ有限会社. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalPaneViewController.h"

@interface ViewController : UIViewController <ModalPaneViewControllerDelegate>

- (IBAction)modalPane:(id)sender;

@end
