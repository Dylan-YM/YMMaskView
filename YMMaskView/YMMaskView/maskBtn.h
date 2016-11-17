//
//  maskBtn.h
//  customMaskView
//
//  Created by X X on 2016/11/15.
//  Copyright © 2016年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface maskBtn : UIView


// 显示文字的数组
@property(nonatomic,strong)NSArray * titleNameArr;

/**
 *
 * labelLeftMargin 左边间距
 * labelMidMargin  中间间距
 * labSize 显示文字的宽度长度
 * backGroundColor 背景颜色
 * fontColor前置颜色
 * cornerRadius 按钮弧度
 * maskLayerColor 遮盖颜色
 */

- (void)addBackViewWithlabelLeftMargin:(CGFloat )labelLeftMargin labelMidMargin:(CGFloat )labelMidMargin labSize:(CGSize )labSize backGroundColor:(UIColor *)backGroundColor fontColor:(UIColor *)fontColor cornerRadius:(NSInteger)cornerRadius maskLayerColor:(UIColor *)maskLayerColor ;
@end
