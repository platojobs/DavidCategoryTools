//
//  UIColor+DavidExtention.m
//  HHUU
//
//  Created by MOON FLOWER on 2018/10/25.
//  Copyright © 2018 David. All rights reserved.
//

#import "UIColor+DavidExtention.h"

@implementation UIColor (DavidExtention)

+ (UIColor *)davRGBColorWithRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue{
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
    
}

+ (UIColor *)davrandomColor{
    
    
    CGFloat red = random() % 256;
    CGFloat green = random() % 256;
    CGFloat blue = random() % 256;
    
    return [UIColor davRGBColorWithRed:red withGreen:green withBlue:blue];
    
}
+(UIColor *)colorWithHexString:(NSString *)colorString{
    return [self colorWithHexString:colorString Alpha:1.0f];
}

+(UIColor *)colorWithHexString:(NSString *)colorString Alpha:(CGFloat)alpha{
    //    转化传进来的字符串，去除空格
    NSString *tranString = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    //    如果直接输入6位颜色码也可以让处理
    if (tranString.length < 6) {
        //        小于6位的为 非法的颜色代码
        return [UIColor whiteColor];
    }else if (tranString.length == 6){
        return [self colorWithRGB:tranString Alpha:alpha];
    }else{
        //    判断字符串格式的问题--从计算机的数值表示上讲，0x开头的其实并不是所谓颜色代码的表示方法，而是16进制数的标准写法。譬如0xA就是十进制的10。
        //    而#开头的六（或三）位十六进制数是在设计领域（如CSS以及一些绘图软件）中颜色代码的表示方法。
        if ([tranString hasPrefix:@"0X"]||[tranString hasPrefix:@"0x"]) {
            tranString = [tranString substringWithRange:NSMakeRange(2, tranString.length-2)];
        }else if ([tranString hasPrefix:@"#"]) {
            tranString = [tranString substringWithRange:NSMakeRange(1, tranString.length-1)];
        }else{
            return [UIColor whiteColor];
        }
    }
    //    返回所设置的颜色
    return [self colorWithRGB:tranString Alpha:alpha];
}

+(UIColor *)colorWithRGB:(NSString *)rgbString Alpha:(CGFloat)alpha{
    NSRange range;
    range.length = 2;
    //    R
    range.location = 0;
    NSString *rString = [rgbString substringWithRange:range];
    //    G
    range.location = 2;
    NSString *gString = [rgbString substringWithRange:range];
    //    B
    range.location = 4;
    NSString *bString = [rgbString substringWithRange:range];
    
    //    NSScanner是一个类，用于在字符串中扫描指定的字符，尤其是把它们翻译/转换为数字和别的字符串。可以在创建NSScaner时指定它的string属性，然后scanner会按照你的要求从头到尾地扫描这个字符串的每个字符
    unsigned int R, G ,B;
    [[NSScanner scannerWithString:rString] scanHexInt:&R];
    [[NSScanner scannerWithString:gString] scanHexInt:&G];
    [[NSScanner scannerWithString:bString] scanHexInt:&B];
    
    return [UIColor colorWithRed:((float) R/255.f) green:((float) G/255.f) blue:((float) B/255.f) alpha:alpha];
}

///  获取canvas用的颜色字符串
- (NSString *)canvasColorString
{
    CGFloat *arrRGBA = [self getRGB];
    int r = arrRGBA[0] * 255;
    int g = arrRGBA[1] * 255;
    int b = arrRGBA[2] * 255;
    float a = arrRGBA[3];
    return [NSString stringWithFormat:@"rgba(%d,%d,%d,%f)", r, g, b, a];
}

///  获取网页颜色字串
- (NSString *)webColorString
{
    CGFloat *arrRGBA = [self getRGB];
    int r = arrRGBA[0] * 255;
    int g = arrRGBA[1] * 255;
    int b = arrRGBA[2] * 255;
    NSLog(@"%d,%d,%d", r, g, b);
    NSString *webColor = [NSString stringWithFormat:@"#%02X%02X%02X", r, g, b];
    return webColor;
}

/// 加亮
- (UIColor *) lighten
{
    CGFloat *rgb = [self getRGB];
    CGFloat r = rgb[0];
    CGFloat g = rgb[1];
    CGFloat b = rgb[2];
    CGFloat alpha = rgb[3];
    
    r = r + (1 - r) / 6.18;
    g = g + (1 - g) / 6.18;
    b = b + (1 - b) / 6.18;
    
    UIColor * uiColor = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    return uiColor;
}

- (UIColor *) darken{ //变暗
    CGFloat *rgb = [self getRGB];
    CGFloat r = rgb[0];
    CGFloat g = rgb[1];
    CGFloat b = rgb[2];
    CGFloat alpha = rgb[3];
    
    r = r * 0.618;
    g = g * 0.618;
    b = b * 0.618;
    
    UIColor *uiColor = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    return uiColor;
}

- (UIColor *) mix: (UIColor *) color{
    CGFloat * rgb1 = [self getRGB];
    CGFloat r1 = rgb1[0];
    CGFloat g1 = rgb1[1];
    CGFloat b1 = rgb1[2];
    CGFloat alpha1 = rgb1[3];
    
    CGFloat * rgb2 = [color getRGB];
    CGFloat r2 = rgb2[0];
    CGFloat g2 = rgb2[1];
    CGFloat b2 = rgb2[2];
    CGFloat alpha2 = rgb2[3];
    
    //mix them!!
    CGFloat r = (r1 + r2) / 2.0;
    CGFloat g = (g1 + g2) / 2.0;
    CGFloat b = (b1 + b2) / 2.0;
    CGFloat alpha = (alpha1 + alpha2) / 2.0;
    
    UIColor * uiColor = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    return uiColor;
}

- (CGFloat *) getRGB{
    UIColor * uiColor = self;
    
    CGColorRef cgColor = [uiColor CGColor];
    
    NSUInteger numComponents = CGColorGetNumberOfComponents(cgColor);
    
    if (numComponents == 4){
        static CGFloat * components = Nil;
        components = (CGFloat *) CGColorGetComponents(cgColor);
        return (CGFloat *)components;
    } else { //否则默认返回黑色
        static CGFloat components[4] = {0};
        CGFloat f = 0;
        //非RGB空间的系统颜色单独处理
        if ([uiColor isEqual:[UIColor whiteColor]]) {
            f = 1.0;
        } else if ([uiColor isEqual:[UIColor lightGrayColor]]) {
            f = 0.8;
        } else if ([uiColor isEqual:[UIColor grayColor]]) {
            f = 0.5;
        }
        components[0] = f;
        components[1] = f;
        components[2] = f;
        components[3] = 1.0;
        return (CGFloat *)components;
    }
}


@end
