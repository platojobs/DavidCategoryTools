//
//  UIColor+DavidExtention.h
//  HHUU
//
//  Created by MOON FLOWER on 2018/10/25.
//  Copyright © 2018 David. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIColor (DavidExtention)


/**
 *  设置RGB颜色
 *
 *  @param red   red: 0 ~ 255
 *  @param green green: 0 ~ 255
 *  @param blue  blue: 0 ~ 255
 *
 *  @return RGB颜色
 */
+ (UIColor *)davRGBColorWithRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue;

/**
 *  生成随机色
 *
 *  @return 返回随机色
 */
+ (UIColor *)davrandomColor;


//声明直接输入颜色代码以字符串形式传入的方法，单参形式
+(UIColor *)colorWithHexString:(NSString *)colorString;

//声明直接输入颜色代码以字符串形式传入和透明度以CGFloat形式传入的方法，两个输出参数
+(UIColor *)colorWithHexString:(NSString *)colorString Alpha:(CGFloat)alpha;


///  获取canvas用的颜色字符串
- (NSString *)canvasColorString;

///获取网页颜色字串
- (NSString *) webColorString;

///获取RGB值
- (CGFloat *) getRGB;

///让颜色更亮
- (UIColor *) lighten;

///让颜色更暗
- (UIColor *) darken;

///取两个颜色的中间
- (UIColor *) mix: (UIColor *) color;




@end


