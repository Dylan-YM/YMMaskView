//
//  maskLabel.m
//  customMaskView
//
//  Created by X X on 2016/11/16.
//  Copyright © 2016年 ym. All rights reserved.
//

#import "maskLabel.h"

@interface maskLabel ()

// 遮盖控制器
@property(nonatomic,strong)CALayer * maskLayer ;
// 遮盖的文字
@property(nonatomic,strong)UILabel * frontLab ;
@end
@implementation maskLabel


- (void)createMaskLabelWithbackColor:(UIColor *)backColor frontColor:(UIColor *)frontColor labelText:(NSString *)labelText labelFont:(UIFont* )labelFont maskLayerFrame:(CGRect)maskLayerFrame  maskCornerRadius:(NSInteger)maskCornerRadius maskColor:(UIColor *)maskColor {
    // 创建背景文字
    UILabel * backLab = [self addLabel:self.bounds color:backColor text:labelText labelFont:labelFont];
    [self addSubview:backLab];
    // 创建遮盖文字
    UILabel * frontLab = [self addLabel:self.bounds color:frontColor text:labelText labelFont:labelFont];
    self.frontLab = frontLab;
    [self addSubview:frontLab];
    // 创建遮盖控制器
    [self addMaskLayerWithFrame:maskLayerFrame maskCornerRadius:maskCornerRadius maskColor:maskColor frontLab:frontLab];
    
    
}

- (void)addMaskLayerWithFrame:(CGRect )maskFrame maskCornerRadius:(NSInteger)maskCornerRadius maskColor:(UIColor *)maskColor frontLab:(UILabel *)frontLab{
    self.maskLayer = [[CALayer alloc]init];
    self.maskLayer.frame = maskFrame;
    
    self.maskLayer.cornerRadius = maskCornerRadius;
    self.maskLayer.backgroundColor = maskColor.CGColor;
    frontLab.layer.mask  = self.maskLayer;
    
}
- (UILabel *)addLabel:(CGRect )frame color:(UIColor *)color text:(NSString *)text labelFont:(UIFont *)font{
    UILabel * lab = [[UILabel alloc]init];
    lab.text = text;
    lab.frame = frame;
    lab.textColor = color;
    lab.font = font;
    lab.textAlignment = NSTextAlignmentLeft;
    
    return  lab;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch * touch in touches) {
        CGPoint movePoint = [touch locationInView:self.frontLab];
        CGRect maskFrame = self.maskLayer.frame;
        maskFrame.origin.x = movePoint.x - maskFrame.size.width/2;
        self.maskLayer.frame = maskFrame;
        
    }

}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch * touch in touches) {
        CGPoint movePoint = [touch locationInView:self.frontLab];
        CGRect maskFrame = self.maskLayer.frame;
        maskFrame.origin.x = movePoint.x - maskFrame.size.width/2;
        self.maskLayer.frame = maskFrame;
        
    }

}
@end
