//
//  MainViewController.h
//  e-vault
//
//  Created by Peter Caulfield on 08/12/2013.
//  Copyright (c) 2013 Peter Caulfield. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
- (IBAction)keyPadButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
@property (nonatomic) NSMutableArray *password;
@end
