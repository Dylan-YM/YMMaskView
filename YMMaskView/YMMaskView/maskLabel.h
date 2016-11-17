//
//  maskLabel.h
//  customMaskView
//
//  Created by X X on 2016/11/16.
//  Copyright © 2016年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface maskLabel : UIView

/**
 * backColor            背景字体颜色
 * frontColor           遮盖字体颜色
 * labelText            显示的文字
 * labelFont            显示字体大小
 * maskLayerFrame       遮盖的大小
 * maskCornerRadius     遮盖的弧度
 */
- (void)createMaskLabelWithbackColor:(UIColor *)backColor frontColor:(UIColor *)frontColor labelText:(NSString *)labelText labelFont:(UIFont* )labelFont maskLayerFrame:(CGRect)maskLayerFrame  maskCornerRadius:(NSInteger)maskCornerRadius maskColor:(UIColor *)maskColor ;

@end
