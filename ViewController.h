//
//  ViewController.h
//  Tic-Tac-Toe
//
//  Created by 庞祺 on 2017/2/22.
//  Copyright © 2017年 panchy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImage *OImag;
    IBOutlet UIImage *XImag;
    NSInteger playerToken;
}

@property (weak, nonatomic) IBOutlet UITextField *showTurn;
- (IBAction)restartButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *board;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;

@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;

@property (weak, nonatomic) IBOutlet UIImageView *img7;
@property (weak, nonatomic) IBOutlet UIImageView *img8;
@property (weak, nonatomic) IBOutlet UIImageView *img9;

-(void)updatePlayerInf;
-(BOOL)checkForWin;
-(void)resetBord;

@end

