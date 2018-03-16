//
//  UIColor+SSColorCoversion.m
//  Sanbox-SSZJ
//
//  Created by 难怪 on 16/7/19.
//  Copyright © 2016年 难怪. All rights reserved.
//

#import "UIColor+SSColorCoversion.h"

@implementation UIColor (SSColorCoversion)
+ (UIColor *)hexStringToColor:(NSString *)stringToConvert {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    NSRange range;
    range.location          = 0;
    range.length            = 2;
    NSString *rString       = [cString substringWithRange:range];
    range.location          = 2;
    NSString *gString       = [cString substringWithRange:range];
    range.location          = 4;
    NSString *bString       = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
@end