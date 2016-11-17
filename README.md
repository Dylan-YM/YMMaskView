## 这是一个封装了两个maskLayer的视图。

一个是maskBtn
![maskBtn](https://github.com/RichardYM/YMMaskView/blob/1f8e839f3fa4ceea1b129fd61256dc2375a3211d/YMMaskView/maskBtn.gif?raw=true)  

## 属性：
```objc
NSArray * titleNameArr;
```

## 方法：
```objc
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
```

一个是 maskLabel ![maskLabel](https://raw.githubusercontent.com/RichardYM/YMMaskView/1f8e839f3fa4ceea1b129fd61256dc2375a3211d/YMMaskView/masklabel.gif)  
## 方法：
```objc

/**
 * backColor            背景字体颜色
 * frontColor           遮盖字体颜色
 * labelText            显示的文字
 * labelFont            显示字体大小
 * maskLayerFrame       遮盖的大小
 * maskCornerRadius     遮盖的弧度
 */
- (void)createMaskLabelWithbackColor:(UIColor *)backColor frontColor:(UIColor *)frontColor labelText:(NSString *)labelText labelFont:(UIFont* )labelFont maskLayerFrame:(CGRect)maskLayerFrame  maskCornerRadius:(NSInteger)maskCornerRadius maskColor:(UIColor *)maskColor ;
```

###喜欢的给我点个start。 还有其他的文章在我的简书上[我的简书](http://www.jianshu.com/users/ee84d859d5f0/latest_articles)。
