//
//  ViewController.m
//  MaskGuideView
//
//  Created by Dxc_iOS on 2018/9/29.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import "ViewController.h"
#import "CJKTMaskGuideCoverView.h"
@interface ViewController ()<CJKTMaskGuideViewQueueDelegate,CJKTMaskGuideViewDelegate>
@property (nonatomic,strong)UIButton *btn0;
@property (nonatomic,strong)UIButton *btn1;
@property (nonatomic,strong)UIButton *btn2;
@property (nonatomic,strong)UIButton *btn3;
@property (nonatomic,strong)UIButton *btn4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.btn0 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    [self.view addSubview:self.btn0];
    [self.btn0 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn0.backgroundColor = [UIColor grayColor];
    [self.btn0 setTitle:@"不同类型" forState:UIControlStateNormal];
    self.btn0.layer.cornerRadius = 6.f;
    [self.btn0 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 100 , 40)];
    [self.view addSubview:self.btn1];
    [self.btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn1.backgroundColor = [UIColor grayColor];
    [self.btn1 setTitle:@"btn1" forState:UIControlStateNormal];
    self.btn1.layer.cornerRadius = 6.f;
    
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 250, 100 , 40)];
    [self.view addSubview:self.btn2];
    [self.btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn2.backgroundColor = [UIColor grayColor];
    [self.btn2 setTitle:@"btn2" forState:UIControlStateNormal];
    self.btn2.layer.cornerRadius = 6.f;
    
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFIRST]) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFIRST];
        
        [self btnClick];
        
    }else {
      
         self.view.backgroundColor = [UIColor redColor];
    }
    
   
}

-(void)btnClick{
    CJKTMaskGuideViewQueue *queue = [[CJKTMaskGuideViewQueue alloc] init];
    queue.delegate = self;
    
    CJKTMaskGuideView *cover1 = [[CJKTMaskGuideView alloc] initWithRevalView:self.btn0 layoutType:CJKTMaskGuideViewLayoutTypeRightDown];
    cover1.des = @"看一看";
    cover1.detailDes = @"详细的看看";
//    [cover1 showInView:self.view];
    
    
    CJKTMaskGuideView *cover2 = [[CJKTMaskGuideView alloc] initWithBgColor:[UIColor colorWithWhite:0 alpha:0.5] revealView:self.btn2 revealType:CJKTMaskGuideViewRevealTypeRect layoutType:CJKTMaskGuideViewLayoutTypeRight];
    cover2.des = @"再看一看";
    cover2.detailDes = @"再详细的看看";
//    [cover2 showInView:self.view];
    
    [queue addCoverView:cover1];
    [queue addCoverView:cover2];
    
    [queue showCoversInView:self.view];
    
}
@end
