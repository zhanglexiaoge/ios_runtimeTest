//
//  NSString+NSString_NSNULL.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/3/5.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "NSString+NSString_NSNULL.h"

@implementation NSString (NSString_NSNULL)
+(BOOL)nullstr:(NSString *)mystr {
    //token == nil || [token isEqual:[NSNull null]] || token.length == 0
    if (mystr == nil || [mystr isEqual:[NSNull null]] ||[mystr isEqualToString:@"(null)"] || mystr.length == 0) {
        return YES;
    }else {
        return NO;
    }
    
}
@end
