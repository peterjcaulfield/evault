//
//  MainViewController.m
//  e-vault
//
//  Created by Peter Caulfield on 08/12/2013.
//  Copyright (c) 2013 Peter Caulfield. All rights reserved.
//

#import "MainViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)vibrate
{
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

// lazy loader for password array
- (NSMutableArray *)password
{
    if (!_password)
    {
        _password = [[NSMutableArray alloc] init];
        return _password;
    }
    return _password;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)keyPadButtonPressed:(id)sender {
    UIButton *keyPadButton = sender;
    [[self password] addObject:[NSNumber numberWithInt:[keyPadButton tag]]];
    
    if ([[self password] count] > 3 )
    {
        [self checkPassword:[self password]];
    }
}

// cancel last num choice
- (IBAction)cancelButtonPressed:(id)sender {
    if ( [[self password] count] > 0)
    {
        [[self password] removeLastObject];
    }
}

-(bool)checkPassword:(NSMutableArray *)password
{
    NSString *passwordAttempt = [password componentsJoinedByString:@""];
    NSLog(@"%@", passwordAttempt);
    if ([passwordAttempt isEqualToString:@"1234"])
    {
        NSLog(@"pass is correct");
    }
    else // pass incorrect
    {
        NSLog(@"pass is incorrect");
        [password removeAllObjects];
        [self vibrate];
    }
        
    return NO;
}

@end
