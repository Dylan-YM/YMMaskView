//
//  ViewController.m
//  YMMaskView
//
//  Created by X X on 2016/11/16.
//  Copyright © 2016年 ym. All rights reserved.
//

#import "ViewController.h"
#import "maskBtn.h"
#import "maskLabel.h"

@interface ViewController ()
@property(nonatomic,strong)UIImage * snow ;
@property(nonatomic,strong)maskBtn * btnView ;
@property(nonatomic,strong)maskLabel * labelView ;
@property (weak, nonatomic) IBOutlet UIButton *maskBtn;
@property (weak, nonatomic) IBOutlet UIButton *maskLabelBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * image =  [self scaleImage:[UIImage imageNamed:@"snow"] toScale:0.3];
    self.view.backgroundColor = [UIColor blackColor];
    self.snow = image;
    [self setupSnow];
    
    
}
- (BOOL)prefersStatusBarHidden{

    return  YES;
}
- (IBAction)maskLabelClick:(UIButton *)sender {
    sender.enabled = NO;
    self.maskBtn.enabled = YES;
    self.btnView.hidden = YES;
    
    maskLabel * labView = [[maskLabel alloc]initWithFrame:CGRectMake(0, 200, 375, 50)];
    self.labelView = labView;
    [labView createMaskLabelWithbackColor:[UIColor greenColor] frontColor:[UIColor redColor] labelText:@"我们的距离到这刚刚好不够我们拥抱就挽回不了" labelFont:    [UIFont systemFontOfSize:14] maskLayerFrame:CGRectMake(0, 0, 20, 50) maskCornerRadius:5 maskColor:[UIColor redColor]];
    [self.view addSubview:labView];
    
}
- (IBAction)maskBtnClick:(UIButton *)sender {
    
    sender.enabled = NO;
    self.maskLabelBtn.enabled = YES;
    self.labelView.hidden = YES;
    maskBtn * btnView = [[maskBtn alloc]initWithFrame:CGRectMake(0, 200, 375, 50)];
    self.btnView = btnView;
    btnView.titleNameArr = @[@"演员",@"刚刚好",@"初学者",@"认真的雪"];
    [btnView addBackViewWithlabelLeftMargin:10 labelMidMargin:5 labSize:CGSizeMake(80, 50) backGroundColor:[UIColor whiteColor] fontColor:[UIColor blackColor] cornerRadius:25 maskLayerColor:[UIColor redColor]];
    [self.view addSubview:btnView];
    
    
}
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
- (void)setupSnow{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);      //粒子发射器的位置
    snowEmitter.emitterSize = CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    
    // Spawn points for the flakes are within on the outline of the line
    snowEmitter.emitterMode = kCAEmitterLayerOutline;
    snowEmitter.emitterShape = kCAEmitterLayerRectangle;
    
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    //    随机颗粒的大小
    snowflake.scale = 0.2;
    snowflake.scaleRange = 0.5;
    
    //    缩放比列速度
    //        snowflake.scaleSpeed = 0.1;
    
    //    粒子参数的速度乘数因子；
    snowflake.birthRate = 20.0;     //每秒产生的 cell数量
    
    //生命周期
    snowflake.lifetime = 60.0;     //在屏幕上的生存周期
    
    //    粒子速度
    snowflake.velocity = 20; // falling down slowly
    snowflake.velocityRange = 10;
    //    粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    //    周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;// some variation in angle
    //    自动旋转
    snowflake.spinRange = 0.25 * M_PI; // slow spin
    
    snowflake.contents = (id) self.snow.CGImage;
    snowflake.color = [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    // Add everything to our backing layer below the UIContol defined in the storyboard
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    [self.view.layer addSublayer:snowEmitter];
    
}

@end
