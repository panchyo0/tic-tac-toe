//
//  ViewController.m
//  Tic-Tac-Toe
//
//  Created by 庞祺 on 2017/2/22.
//  Copyright © 2017年 panchy. All rights reserved.
//

#import "ViewController.h"

#define xturn @"X turns"
#define oturn @"O turns"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    OImag=[UIImage imageNamed:@"o-icon.png"];
    XImag=[UIImage imageNamed:@"x-icon.png"];
    
    playerToken=1;
    
    _showTurn.text=@"X goes first >.<";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches]anyObject];
    
    for (int i=1; i<=9; i++) {
        //NSLog(@"i is %d",i);
        UIImageView *ima=[self.view viewWithTag:i] ;
        
        if (CGRectContainsPoint([ima frame], [touch locationInView:self.view])) {
            if (playerToken==1) {
                ima.image=XImag;
                //NSLog(@"tag is %ld",(long)ima.tag);
            }
            else if (playerToken==2){
                ima.image=OImag;
                //NSLog(@"tag is %ld",(long)ima.tag);
            }
        }

    }
    [self updatePlayerInf];
}

- (IBAction)restartButton:(UIButton *)sender {
    [self resetBord];
}

-(BOOL)checkForWin{
    
    //Horzontal win
    if ((_img1.image==_img2.image)&&(_img2.image==_img3.image)&&(_img1.image=_img3.image)&&(_img1.image!=NULL)) {
      
        return true;
    }
    if ((_img4.image==_img5.image)&&(_img4.image==_img6.image)&&(_img5.image=_img6.image)&&(_img4.image!=NULL)) {
        return true;
    }
    if ((_img7.image==_img8.image)&&(_img9.image==_img7.image)&&(_img8.image=_img9.image)&&(_img7.image!=NULL)) {
        return true;
    }
    //vertical win
    if ((_img1.image==_img4.image)&&(_img1.image==_img7.image)&&(_img4.image=_img7.image)&&(_img1.image!=NULL)) {
        return true;
    }
    if ((_img8.image==_img2.image)&&(_img2.image==_img5.image)&&(_img8.image=_img5.image)&&(_img2.image!=NULL)) {
        return true;
    }
    if ((_img9.image==_img6.image)&&(_img9.image==_img3.image)&&(_img6.image=_img3.image)&&(_img3.image!=NULL)) {
        return true;
    }
    //diagonal win
    if ((_img7.image==_img5.image)&&(_img7.image==_img3.image)&&(_img5.image=_img3.image)&&(_img7.image!=NULL)) {
        return true;
    }
    if ((_img1.image==_img9.image)&&(_img1.image==_img5.image)&&(_img9.image=_img5.image)&&(_img1.image!=NULL)) {
        return true;
    }
    
    return false;
    
}

-(void)updatePlayerInf{

    if (playerToken==1) {
        playerToken=2;
        _showTurn.text=oturn;
        //NSLog(@"player token=%ld",(long)playerToken);
        
    }
    else if(playerToken==2){
        playerToken=1;
        _showTurn.text=xturn;
        //NSLog(@"player token=%ld",(long)playerToken);
    }
    
    if ([self checkForWin]) {
        UIAlertView *win=[[UIAlertView alloc] initWithTitle:@" Win -,-!" message:@"Win" delegate:self cancelButtonTitle:@"Finish" otherButtonTitles:nil];
        [win show];
        
        [self resetBord];
    }
}

-(void)resetBord{
    for (int i=1; i<=9; i++) {
        UIImageView *imag=[self.view viewWithTag:i];
        imag.image=NULL;
    }
    //_img1.image=NULL;
    playerToken=1;
    _showTurn.text=@"X goes first >.<";
}

@end
