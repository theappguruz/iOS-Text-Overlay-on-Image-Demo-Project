//
//  ViewController.h
//  TextOverylayOnImage
//
//  Created by TheAppGuruz-New-6 on 10/04/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    float firstX;
    float firstY;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgeview;
- (IBAction)btnCaptureImageClicked:(id)sender;


@end
