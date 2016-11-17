//
//  maskBtn.m
//  customMaskView
//
//  Created by X X on 2016/11/15.
//  Copyright © 2016年 ym. All rights reserved.
//

#import "maskBtn.h"


@interface maskBtn ()
// 遮盖控制器
@property(nonatomic,strong)CALayer * maskLayer ;
// 背景视图
@property(nonatomic,strong)UIView * backView;
// 遮盖的视图
@property(nonatomic,strong)UIView * fontView ;
// 左边间距
@property(nonatomic,assign)CGFloat  leftMargin ;
// 每个按钮的间距
@property(nonatomic,assign)CGFloat MidMargin ;
// 按钮的大小
@property(nonatomic,assign)CGSize  BtnSize ;
@end

@implementation maskBtn


- (void)addBackViewWithlabelLeftMargin:(CGFloat )labelLeftMargin labelMidMargin:(CGFloat )labelMidMargin labSize:(CGSize )labSize backGroundColor:(UIColor *)backGroundColor fontColor:(UIColor *)fontColor cornerRadius:(NSInteger)cornerRadius maskLayerColor:(UIColor *)maskLayerColor {
    self.leftMargin = labelLeftMargin;
    self.MidMargin = labelMidMargin;
    self.BtnSize = labSize;
    // 创建背景视图
    UIView * backView = [[UIView alloc]initWithFrame:self.bounds];
    // 创建背景视图显示的文字
    [self addBackGroundlabel:backGroundColor superView:backView leftMargin:labelLeftMargin midMargin:labelMidMargin labSize:labSize];
    //创建遮盖的视图
    UIView * fontView = [[UIView alloc]initWithFrame:backView.bounds];
    self.fontView  =  fontView;
    fontView.backgroundColor = maskLayerColor;
    // 创建遮盖的文字
    [self addBackGroundlabel:fontColor superView:fontView leftMargin:labelLeftMargin midMargin:labelMidMargin labSize:labSize];
    [backView addSubview:fontView];
    // 创建遮盖控制器
    [self addMaskfontView:fontView cornerRadius:cornerRadius maskLayerColor:maskLayerColor labSize:labSize leftMargin:labelLeftMargin];
    // 创建点击按钮
    [self addTopBtnleftMargin:labelLeftMargin midMargin:labelMidMargin labSize:labSize backView:backView];
    [self addSubview:backView];
}

- (void)addBackGroundlabel:(UIColor *)color superView:(UIView *)superView leftMargin:(CGFloat )leftMargin midMargin:(CGFloat )midMargin labSize:(CGSize )labSize{
    
    for (NSInteger i = 0; i < self.titleNameArr.count ; i++) {
        UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin+(midMargin + labSize.width)* i,  0, labSize.width, labSize.height)];
        lab.textColor = color;
        lab.font = [UIFont systemFontOfSize:18];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = self.titleNameArr[i];
        [superView addSubview:lab];
    }
}
- (NSArray *)titleNameArr{
    if (!_titleNameArr) {
        _titleNameArr = [NSArray array];
    }
    return _titleNameArr;
}
- (void)addMaskfontView:(UIView *)fontView cornerRadius:(NSInteger)cornerRadius maskLayerColor:(UIColor *)maskLayerColor  labSize:(CGSize)labSize leftMargin:(CGFloat)leftMargin {
    self.maskLayer = [[CALayer alloc]init];
    self.maskLayer.frame = CGRectMake(leftMargin, 0, labSize.width, labSize.height);
    self.maskLayer.cornerRadius = cornerRadius;
    self.maskLayer.backgroundColor = maskLayerColor.CGColor;
    fontView.layer.mask = self.maskLayer;
}
- (void)addTopBtnleftMargin:(CGFloat)leftMargin  midMargin:(CGFloat)midMargin labSize:(CGSize)labSize backView:(UIView *)backView{
    
    for (NSInteger i = 0; i < self.titleNameArr.count ; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(leftMargin+(midMargin + labSize.width)* i,  0, labSize.width, labSize.height)];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];
    }
    
}
- (void)btnClick:(UIButton *)btn{
    
    self.maskLayer.frame = CGRectMake(self.leftMargin+(self.MidMargin + self.BtnSize.width)* btn.tag,  0, self.BtnSize.width, self.BtnSize.height);
}
@end
