//
//  ViewController.m
//  TextOverylayOnImage
//
//  Created by TheAppGuruz-New-6 on 10/04/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgeview;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [imgeview setImage:[UIImage imageNamed:@"demo.png"]];
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 250, 40)];
    myLabel.text = @"Hello There";
    myLabel.textColor = [UIColor blackColor];
    myLabel.font=[UIFont fontWithName:@"Marker Felt" size:35];
    [imgeview addSubview:myLabel];
    [imgeview setUserInteractionEnabled:YES];
    [myLabel setUserInteractionEnabled:YES];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [panGesture setMinimumNumberOfTouches:1];
    [panGesture setMaximumNumberOfTouches:1];
    
    [myLabel addGestureRecognizer:panGesture];
    panGesture = nil;
}

-(void)handlePanGesture:(id)sender
{
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
    }
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    [[sender view] setCenter:translatedPoint];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnCaptureImageClicked:(id)sender
{
    [self createImage:imgeview];
}

-(UIImage *)createImage:(UIImageView *)imgView
{
    UIGraphicsBeginImageContextWithOptions(imgeview.bounds.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [imgeview.layer renderInContext:context];
    UIImage *imgs = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(imgs,self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
    return imgs;
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alertView;
    if(!error)
    {
        alertView=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Error Occured" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
    else
    {
        alertView=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Your image has been saved successfully to your photo album." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}
@end
