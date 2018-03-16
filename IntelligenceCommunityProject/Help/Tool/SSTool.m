//
//  SSTool.m
//  Sanbox-SSZJ
//
//

#import "SSTool.h"
static NSString *path;

@implementation SSTool
/*
 * 获取是否为IPHONE_X,并返回Nav高度
 */
+ (CGFloat )IS_IPHONE_XNavHeight{
    if (IS_IPHONE_X) {
        return 88.0;
    }else {
        return 64.0;
    }
    
}
#pragma mark -- 获取APP信息
+ (NSDictionary *)appInfo                       {
    //设备ID
    NSString *deviceId = [[UIDevice currentDevice].identifierForVendor UUIDString];
    //系统版本
    NSString *os = [UIDevice currentDevice].systemVersion;
    os = [NSString stringWithFormat:@"IOS-%@",os];
    //分辨率
    CGFloat scale = [UIScreen mainScreen].scale;
    NSString *resolution = [NSString stringWithFormat:@"%f_%f",SCREENWIDTH*scale,SCREENHEIGHT*scale];
    //网络
    NSString *networkState = [self networkingStatesFromStatebar];
    //图片质量
    NSString *imgquality = [[NSUserDefaults standardUserDefaults]objectForKey:@"downImageQuality"];
    imgquality = !imgquality ? @"0" : @"1";
    //APP版本号
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSCharacterSet *setToRemove = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *version = [[currentVersion componentsSeparatedByCharactersInSet:setToRemove] componentsJoinedByString:@""];
    NSString *token = [SSTool getLocationData:@"token"];
    
    if(token ==nil  || [token isEqual:[NSNull null]] || token .length == 0) {
        return @{ @"deviceId"       : deviceId,
                  @"V"        : currentVersion,
                  @"pm"             : @"1",
                  @"os"             : os,
                  @"src"            : @"101",
                  @"resolution"     : resolution,
                  @"network"        : networkState,
                  @"imgquality"     : imgquality,
                  @"deviceType"     : @"1"
                  };
    }
    
    return @{ @"deviceId"   : deviceId,
              @"V"    : currentVersion,
              @"pm"         : @"1",
              @"os"         : os,
              @"src"        : @"101",
              @"resolution" : resolution,
              @"network"    : networkState,
              @"imgquality" : imgquality,
              @"deviceType" : @"1",
              @"token"      : token,
              @"_uid"       : [NSString stringWithFormat:@"%@",[self getLocationData:@"current_userser_id"]]
              };
}

#pragma mark -- 当前国家区域
+ (NSDictionary *)getTheLocalAreaCode           {
    NSLocale *locale = [NSLocale currentLocale];
    
    NSDictionary *dictCodes = [NSDictionary dictionaryWithObjectsAndKeys:@"972", @"IL",
                               @"93", @"AF", @"355", @"AL", @"213", @"DZ", @"1", @"AS",
                               @"376", @"AD", @"244", @"AO", @"1", @"AI", @"1", @"AG",
                               @"54", @"AR", @"374", @"AM", @"297", @"AW", @"61", @"AU",
                               @"43", @"AT", @"994", @"AZ", @"1", @"BS", @"973", @"BH",
                               @"880", @"BD", @"1", @"BB", @"375", @"BY", @"32", @"BE",
                               @"501", @"BZ", @"229", @"BJ", @"1", @"BM", @"975", @"BT",
                               @"387", @"BA", @"267", @"BW", @"55", @"BR", @"246", @"IO",
                               @"359", @"BG", @"226", @"BF", @"257", @"BI", @"855", @"KH",
                               @"237", @"CM", @"1", @"CA", @"238", @"CV", @"345", @"KY",
                               @"236", @"CF", @"235", @"TD", @"56", @"CL", @"86", @"CN",
                               @"61", @"CX", @"57", @"CO", @"269", @"KM", @"242", @"CG",
                               @"682", @"CK", @"506", @"CR", @"385", @"HR", @"53", @"CU",
                               @"537", @"CY", @"420", @"CZ", @"45", @"DK", @"253", @"DJ",
                               @"1", @"DM", @"1", @"DO", @"593", @"EC", @"20", @"EG",
                               @"503", @"SV", @"240", @"GQ", @"291", @"ER", @"372", @"EE",
                               @"251", @"ET", @"298", @"FO", @"679", @"FJ", @"358", @"FI",
                               @"33", @"FR", @"594", @"GF", @"689", @"PF", @"241", @"GA",
                               @"220", @"GM", @"995", @"GE", @"49", @"DE", @"233", @"GH",
                               @"350", @"GI", @"30", @"GR", @"299", @"GL", @"1", @"GD",
                               @"590", @"GP", @"1", @"GU", @"502", @"GT", @"224", @"GN",
                               @"245", @"GW", @"595", @"GY", @"509", @"HT", @"504", @"HN",
                               @"36", @"HU", @"354", @"IS", @"91", @"IN", @"62", @"ID",
                               @"964", @"IQ", @"353", @"IE", @"972", @"IL", @"39", @"IT",
                               @"1", @"JM", @"81", @"JP", @"962", @"JO", @"77", @"KZ",
                               @"254", @"KE", @"686", @"KI", @"965", @"KW", @"996", @"KG",
                               @"371", @"LV", @"961", @"LB", @"266", @"LS", @"231", @"LR",
                               @"423", @"LI", @"370", @"LT", @"352", @"LU", @"261", @"MG",
                               @"265", @"MW", @"60", @"MY", @"960", @"MV", @"223", @"ML",
                               @"356", @"MT", @"692", @"MH", @"596", @"MQ", @"222", @"MR",
                               @"230", @"MU", @"262", @"YT", @"52", @"MX", @"377", @"MC",
                               @"976", @"MN", @"382", @"ME", @"1", @"MS", @"212", @"MA",
                               @"95", @"MM", @"264", @"NA", @"674", @"NR", @"977", @"NP",
                               @"31", @"NL", @"599", @"AN", @"687", @"NC", @"64", @"NZ",
                               @"505", @"NI", @"227", @"NE", @"234", @"NG", @"683", @"NU",
                               @"672", @"NF", @"1", @"MP", @"47", @"NO", @"968", @"OM",
                               @"92", @"PK", @"680", @"PW", @"507", @"PA", @"675", @"PG",
                               @"595", @"PY", @"51", @"PE", @"63", @"PH", @"48", @"PL",
                               @"351", @"PT", @"1", @"PR", @"974", @"QA", @"40", @"RO",
                               @"250", @"RW", @"685", @"WS", @"378", @"SM", @"966", @"SA",
                               @"221", @"SN", @"381", @"RS", @"248", @"SC", @"232", @"SL",
                               @"65", @"SG", @"421", @"SK", @"386", @"SI", @"677", @"SB",
                               @"27", @"ZA", @"500", @"GS", @"34", @"ES", @"94", @"LK",
                               @"249", @"SD", @"597", @"SR", @"268", @"SZ", @"46", @"SE",
                               @"41", @"CH", @"992", @"TJ", @"66", @"TH", @"228", @"TG",
                               @"690", @"TK", @"676", @"TO", @"1", @"TT", @"216", @"TN",
                               @"90", @"TR", @"993", @"TM", @"1", @"TC", @"688", @"TV",
                               @"256", @"UG", @"380", @"UA", @"971", @"AE", @"44", @"GB",
                               @"1", @"US", @"598", @"UY", @"998", @"UZ", @"678", @"VU",
                               @"681", @"WF", @"967", @"YE", @"260", @"ZM", @"263", @"ZW",
                               @"591", @"BO", @"673", @"BN", @"61", @"CC", @"243", @"CD",
                               @"225", @"CI", @"500", @"FK", @"44", @"GG", @"379", @"VA",
                               @"852", @"HK", @"98", @"IR", @"44", @"IM", @"44", @"JE",
                               @"850", @"KP", @"82", @"KR", @"856", @"LA", @"218", @"LY",
                               @"853", @"MO", @"389", @"MK", @"691", @"FM", @"373", @"MD",
                               @"258", @"MZ", @"970", @"PS", @"872", @"PN", @"262", @"RE",
                               @"7", @"RU", @"590", @"BL", @"290", @"SH", @"1", @"KN",
                               @"1", @"LC", @"590", @"MF", @"508", @"PM", @"1", @"VC",
                               @"239", @"ST", @"252", @"SO", @"47", @"SJ", @"963", @"SY",
                               @"886", @"TW", @"255", @"TZ", @"670", @"TL", @"58", @"VE",
                               @"84", @"VN", @"1", @"VG", @"1", @"VI", nil];
    
    NSString* tt = [locale objectForKey:NSLocaleCountryCode];
    
    NSString* defaultCode = [dictCodes objectForKey:tt];
    
    NSString *code = [NSString stringWithFormat:@"%@",defaultCode];
    
    NSString* defaultCountryName = [locale displayNameForKey:NSLocaleCountryCode value:tt];
    
    if(defaultCountryName && code) {
        return @{@"are":defaultCountryName,@"code":code};
    } else {
        return @{@"are":@"中国",@"code":@"86"};
    }
}

#pragma mark -- 验证电话（手机号码）
+ (BOOL)isMobileNumber:(NSString *)mobileNum    {
    NSString *pattern = @"^1+[34578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:mobileNum];
    return isMatch;
}

+ (NSString *)parseDict:(NSDictionary *) dict   {
    NSArray *keys = dict.allKeys;
    NSMutableString *json = [[NSMutableString alloc] initWithString:@"{"];
    for (NSString *key in keys) {
        [json appendFormat:@"\"%@\":\"%@\"",key,dict[key]];
        [json appendString:@","];
    }
    if (keys.count > 0) {
        NSUInteger location = [json length]-1;
        NSRange range       = NSMakeRange(location, 1);
        [json replaceCharactersInRange:range withString:@"}"];
    } else {
        [json appendString:@"}"];
    }
    return json;
}

+ (NSString *)parseDict1:(NSDictionary *) dict  {
    NSArray *keys           = dict.allKeys;
    NSMutableString *json   = [[NSMutableString alloc] initWithString:@"{"];
    for (NSString *key in keys) {
        id v = dict[key];
        if ([v isKindOfClass:[NSString class]]) {
            [json appendFormat:@"\"%@\":\"%@\"",key,v];
        } else if([v isKindOfClass:[NSDictionary class]]){
            [json appendFormat:@"\"%@\":%@",key,[self parseDict1:v]];
        } else {
            [json appendFormat:@"\"%@\":%@",key,v];
        }
        [json appendString:@","];
    }
    
    if (keys.count > 0) {
        NSUInteger location = [json length]-1;
        NSRange range       = NSMakeRange(location, 1);
        [json replaceCharactersInRange:range withString:@"}"];
    } else {
        [json appendString:@"}"];
    }
    return json;
}

#pragma mark -- 自适应文字高度
+ (CGRect)rectForText:(NSString*)text withFont:(UIFont*)font inSize:(CGSize) size       {
    return [text boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:font}
                              context:nil];
}

//#pragma mark -- 弹出的提示信息
//+ (void)pop_upPromptBoxReminder:(NSString *)reminderString toView:(UIView *)view        {
//    MBProgressHUD *hud  = [[MBProgressHUD alloc] initWithView:view];
//    hud.label.text      = reminderString;      //显示提示
//    hud.mode            = MBProgressHUDModeCustomView;
//    [view addSubview:hud];
//    [hud showAnimated:YES];
//    [hud hideAnimated:YES afterDelay:1];
//}

#pragma mark -- 删除一个视图
+ (void)removeView:(NSInteger)tag superView:(UIView *)superView                         {
    for (UIView *v in superView.subviews) {
        if (v.tag == tag && [v isKindOfClass:[UIView class]]) {
            [v removeFromSuperview];
        }
    }
}

#pragma mark -- 过滤特殊字符串
+ (NSString *)filterTheSpecialCharacters:(NSString *)string                             {
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、 []{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    NSString *filterCompleteString = [string stringByTrimmingCharactersInSet:set];
    return filterCompleteString;
}

#pragma mark -- 返回一个带有删除线的Label
+ (UILabel *)conversion:(UILabel *)label                                                {
    NSUInteger length = [label.text length];
    if (length > 0) {
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:label.text];
        [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
        [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor hexStringToColor:@"cccccc"] range:NSMakeRange(0, length)];
        [label setAttributedText:attri];
        return label;
    } else {
        return nil;
    }
}


/** （key）
 *  1. myInfoData           自己的信息
 *  2. token                当前token
 *  3. loginState           登录状态
 *  4. hiddenPrompt         首页登录提示
 *  5. shutDownAD           首页广告隐藏
 *  6. welcome              引导页记录  value : welcomeIsGenerate
 *  7. FirstOpen            第一次打开App
 *  8. latAndLng            保存第一次进入时候的经纬度
 *  9. current_userser_id   保存当前用户的UID
 *  10.currentCity          保存当前获取到的城市
 */
#pragma mark -- 保存到本地的数据
+ (void)saveToLocationData:(id)obj key:(NSString *)key          {
    NSUserDefaults *myInfo  = [NSUserDefaults standardUserDefaults];
    //拼接当前用户的用户id，确保每一个用户的key唯一
//    NSString *key_id = [NSString str]
    
    [myInfo setObject:obj forKey:key];
    [myInfo synchronize];
}

#pragma mark -- 删除本地的信息
+ (void)delectLocationData:(NSString *)key                      {
    NSUserDefaults *myInfo  = [NSUserDefaults standardUserDefaults];
    [myInfo removeObjectForKey:key];
    [myInfo synchronize];
}

#pragma mark -- 获取本地的信息
+ (id)getLocationData:(NSString *)key                           {
    NSUserDefaults *myInfo  = [NSUserDefaults standardUserDefaults];
    id infoValue = [myInfo objectForKey:key];
    return infoValue;
}

#pragma mark -- 存储某一个带用户id的key
+ (void)storageAKey:(NSString *)key value:(NSString *)value     {
    NSString *newKey               = [NSString stringWithFormat:@"%@_%ld", key, (long)[self getSelfId]];
    NSUserDefaults *shareCourseArr = [NSUserDefaults standardUserDefaults];
    [shareCourseArr setObject:value forKey:newKey];
    [shareCourseArr synchronize];
}

#pragma mark -- 取出某一个带用户id的key
+ (NSString *)takeOutTheAValue:(NSString *)key                  {
    NSString *newKey               = [NSString stringWithFormat:@"%@_%ld", key, (long)[self getSelfId]];
    NSUserDefaults *tempData       = [NSUserDefaults standardUserDefaults];
    NSString *value                = [tempData objectForKey:newKey];
    if (value.length > 0) {
        return value;
    } else {
        return nil;
    }
}

#pragma mark -- 获取是否登录（判断token存在）
+ (BOOL)isLoginSuccess {
   NSString *token = [[self class] getLocationData:@"token"];
    if (token.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark -- 删除某一个带用户id的key
+ (void)delectKey:(NSString *)key                               {
    NSString *newKey               = [NSString stringWithFormat:@"%@_%ld", key, (long)[self getSelfId]];
    NSUserDefaults *tempData       = [NSUserDefaults standardUserDefaults];
    [tempData removeObjectForKey:newKey];
    [tempData synchronize];
}

/**
 *  获取数据
 */
#pragma mark -- 获取自己的机构ID
+ (NSString *)takeSelfID                                        {
    NSDictionary *dic = [SSTool getLocationData:@"myInfoData"];
    NSString *tempID = [NSString stringWithFormat:@"%ld",[dic[@"id"] integerValue]];
    if (tempID.length > 0) {
        return tempID;
    } else {
        return @"";
    }
}

#pragma mark -- 获取自己的机构code
+ (NSString *)takeSelfOrganCode                                 {
    NSDictionary *dic = [SSTool getLocationData:@"myInfoData"];
    NSString *orgCode = [NSString stringWithFormat:@"%ld", [dic[@"orgCode"] integerValue]];
    if (orgCode.length > 0) {
        return orgCode;
    } else {
        return @"";
    }
}

#pragma mark -- 获取个人ID
+ (NSInteger)getSelfId                                   {
        NSDictionary *user_data = [SSTool getLocationData:@"myInfoData"];
        NSInteger user_id       = [user_data[@"id"] integerValue];
        if (user_id != 0) {
            return user_id;
        } else {
            return 0;
        }
}

#pragma mark -- 获取第一次进入保存的经纬度
+ (NSDictionary *)toObtainTheLatitudeAndLongitude               {
    NSUserDefaults *latAndLng = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic         = [latAndLng objectForKey:@"latAndLng"];
    return dic;
}

#pragma mark -- 获取网络类型
+ (NSString *)networkingStatesFromStatebar                      {
    // 状态栏是由当前app控制的，首先获取当前app
    UIApplication *app = [UIApplication sharedApplication];
    
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
   // NSLog(@"%@",children);
    
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
           
        }
    }
    
    NSString *stateString = @"wifi";
    
    switch (type) {
        case 0:
            stateString = @"-1";
            break;
            
        case 1:
            stateString = @"1";
            break;
            
        case 2:
            stateString = @"2";
            break;
            
        case 3:
            stateString = @"3";
            break;
            
        case 4:
            stateString = @"3";
            break;
            
        case 5:
            stateString = @"0";
            break;
        default:
            break;
    }
    return stateString;
}


/**
 *  数据库操作
 *  1.classInfo(首页分类信息) key : class
 *  2.chat(im账户信息) key : 每个人的im名称
 *  3.advertising(广告) key : ad
 *  4.SSMain_one(首页数据) key : data
 */
//#pragma mark -- 数据库内容保存
//+ (void)save_databaseTableName:(NSString *)name dataVlue:(id)value dataKey:(NSString *)key      {
//    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"sanbox-sszj.db"];
//    [store createTableWithName:name];
//    [store putObject:value withId:key intoTable:name];
//}
//
//#pragma mark -- 数据库内容获取
//+ (NSDictionary *)takeout_databaseTableName:(NSString *)name dataKey:(NSString *)key            {
//    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"sanbox-sszj.db"];
//    NSDictionary *query = [store getObjectById:key fromTable:name];
//    return query;
//}
//
//#pragma mark -- 数据库内容清除
//+ (void)clear_takeout_databaseTableName:(NSString *)name                                        {
//    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"sanbox-sszj.db"];
//    [store clearTable:name];
//}

//#pragma mark -- 读取所有的数据
//+ (NSArray *)take_databaseTableName:(NSString *)name                                            {
//    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"sanbox-sszj.db"];
//    NSArray * array =[store getAllItemsFromTable:name];
//    return array;
//}




#pragma mark -- 判断时间是不是今天不是今天删除数据从新进行加载数据
+ (BOOL)determineWhetherToday:(NSString *)string                            {
    //timeKey_appShareTime
    NSString *key                                   = @"timeKey";
    NSString *key1                                  = [key stringByAppendingString:[NSString stringWithFormat:@"_%@", string]];
    NSString *time                                  = [[NSUserDefaults standardUserDefaults] objectForKey:key1];
    //todayKey_signIn
    if (time) {
        //获取当前时间
        NSDateFormatter *dateFormatter          = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY/MM/dd"];
        NSString *dateNow                       = [dateFormatter stringFromDate:[NSDate date]];
        
        //判断当前时间和本地存储时间是否一致
        if ([time isEqualToString:dateNow]) {
            return YES;
        } else {
            //如果不一样就把所有数据清除 从新请求数据
            NSUserDefaults *deleteKey                   = [NSUserDefaults standardUserDefaults];
            NSString *dateKey                           = @"timeKey";
            NSString *dateKey1                          = [dateKey stringByAppendingString:[NSString stringWithFormat:@"_%@", string]];
            [deleteKey removeObjectForKey:dateKey1];    //删除以前存储的时间
            [deleteKey removeObjectForKey:key1];        //删除以前的key
            [deleteKey synchronize];
            [[self class] todayTime:string];
            return NO;
        }
    } else {
        [[self class] todayTime:string];
    }
    return NO;
}

#pragma mark -- 今天的时间
+ (void)todayTime:(NSString *)string                                        {
    //如果time是空， 保存现在的时间
    NSDateFormatter *dateFormatter          = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    NSString *dateNow                       = [dateFormatter stringFromDate:[NSDate date]];
    NSUserDefaults *deleteKey               = [NSUserDefaults standardUserDefaults];
    NSString *dateKey                       = @"timeKey";
    NSString *dateKey1                      = [dateKey stringByAppendingString:[NSString stringWithFormat:@"_%@", string]];
    [deleteKey setObject:dateNow forKey:dateKey1]; //现在的时间timeKey_signIn
    [deleteKey synchronize];
}

/**
 *  图片操作
 */
#pragma mark -- 压缩图片
+ (NSData *)uploadImg:(NSData *)data                                                                                                        {
    UIImage *tmpImage = [UIImage imageWithData:data];
    
    if(tmpImage.size.width > 960) {
        tmpImage = [SSTool imageCompressForWidth:tmpImage targetWidth:960];
        
        data = UIImageJPEGRepresentation(tmpImage, 1.0);
        
        if(data.length > 512 * 1024) {
            data = UIImageJPEGRepresentation([UIImage imageWithData:data], 0.8);
            tmpImage = [UIImage imageWithData:data];
        }
    } else {
        if(data.length > 512 * 1024){
            data = UIImageJPEGRepresentation(tmpImage, 0.7);
            tmpImage = [UIImage imageWithData:data];
        }
    }
    return data;
}

#pragma mark -- 压缩图片
+ (NSString *)getCutDownImageUrl:(NSString *)imageUrl                                                                                       {
    NSString *imgurl;
    NSString *net = [SSTool networkingStatesFromStatebar];
    if([imageUrl hasPrefix:@"http://115.29.172.104"]) {
        if([net isEqualToString:@"1"]) {
            imgurl        = [NSString stringWithFormat:@"%@!s200",imageUrl];
        } else if ([net isEqualToString:@"2"]) {
            imgurl        = [NSString stringWithFormat:@"%@!s320",imageUrl];
        } else if ([net isEqualToString:@"3"]) {
            imgurl        = [NSString stringWithFormat:@"%@!s640",imageUrl];
        } else {
            imgurl        = [NSString stringWithFormat:@"%@",imageUrl];
        }
    } else {
        imgurl = [NSString stringWithFormat:@"%@",imageUrl];
    }
    return imgurl;
}

#pragma mark -- 图片等比压缩
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth                                                 {
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth,  targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



/**
 * 对字典中的<null>进行处理
 */
+ (NSDictionary *)deleteNull:(NSArray *)keys keyAllData:(NSDictionary *)dic {
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyString in keys) {
        if ([[dic objectForKey:keyString] isEqual:[NSNull null]]) {
            [mutableDic setObject:@"" forKey:keyString];
        } else {
            [mutableDic setObject:[dic objectForKey:keyString] forKey:keyString];
        }
    }
    return mutableDic;
}



/**
 *  json转字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
/**
 *  字体间距
 */

+ (UILabel *)newLabel:(UILabel *)oldLabel {
    if (oldLabel.text.length > 0) {
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:oldLabel.text];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [oldLabel.text length])];
        [oldLabel setAttributedText:attributedString1];
        [oldLabel sizeToFit];
        return oldLabel;
    }else{
        return nil;
    }
}

//----------------------------------------------------------------------------
/**
 *   保存最新的个人信息
 */
+ (void)saveLatestUserInformation:(NSDictionary *)userinfo      {
    NSUserDefaults *userInfoDic = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"latestUserInformation_%d", [self getSelfId]];
    [userInfoDic setObject:userinfo forKey:key];
    [userInfoDic synchronize];
}
/**
 *   获取最新的个人信息
 */
+ (NSDictionary *)getTheLatestUserInformation                   {
    NSUserDefaults *userInforDic = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"latestUserInformation_%d", [self getSelfId]];
    NSDictionary *dic = [userInforDic objectForKey:key];
    if ([dic count] > 0) {
        return dic;
    } else {
        return nil;
    }
    return nil;
}
/**
 *   删除最新的个人信息
 */
+ (void)delectTheLatestUserInformation                          {
    NSUserDefaults *userInforDic = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"latestUserInformation_%d", [self getSelfId]];
    [userInforDic removeObjectForKey:key];
    [userInforDic synchronize];
}

/**
 *   金币界面课程分享
 */
+ (void)goldPageShareCourseData:(NSMutableArray *)arr                       {
    NSUserDefaults *shareCourseArr = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"当前ID为_%d", [self getSelfId]];
    [shareCourseArr setObject:arr forKey:key];
    [shareCourseArr synchronize];
}

+ (NSMutableArray *)returnGoldPageShareCourseData                           {
    BOOL isThereAre = [SSTool    determineWhetherToday:@"goldPageCourseShare"];
  
       NSString *key = [NSString stringWithFormat:@"当前ID为_%d",[self getSelfId]];
    NSUserDefaults *shareCourseArr = [NSUserDefaults standardUserDefaults];
    if (isThereAre) {
        NSMutableArray *arr = [shareCourseArr objectForKey:key];
        if (arr) {
            return arr;
        } else {
            return nil;
        }
    } else {
        [shareCourseArr removeObjectForKey:key];
        [shareCourseArr synchronize];
        return nil;
    }
}


+ (NSMutableArray *)goldPageAlreadyShareCourseData:(NSInteger)courseId      {
    NSUserDefaults *shareCourseArr = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"当前ID为_%d", [self getSelfId]];
    NSMutableArray *arr = [shareCourseArr objectForKey:key];
    
    NSMutableArray *copyMutableArr = [NSMutableArray array];
    if (arr.count > 0) {
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj[@"id"] integerValue] != courseId) {
                [copyMutableArr addObject:obj];
            } else {
                
            }
        }];
    }
    
    NSUserDefaults *tempShareCourseArr = [NSUserDefaults standardUserDefaults];
  //  [tempShareCourseArr removeObjectForKey:@"shareCourseArrKey"];
    
    [shareCourseArr removeObjectForKey:key];
    [tempShareCourseArr setObject:copyMutableArr forKey:key];
    [tempShareCourseArr synchronize];
    
    if (copyMutableArr.count > 0) {
        return copyMutableArr;
    } else {
        return nil;
    }
}

+ (void)deleGoldPageShareCourseData{
    NSUserDefaults *shareCourseArr = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"当前ID为_%d", [self getSelfId]];
    
    
    [shareCourseArr removeObjectForKey:key];
    
     [shareCourseArr synchronize];
}

/**
 *   存储一个本地的数组数据带ID
 */

+ (void)saveArrData:(NSMutableArray *)arr {
    NSUserDefaults *taskArr = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"当前ID为_%d_task1", [self getSelfId]];
    [SSTool determineWhetherToday:key];  //保存每个人的任务信息时间key
    [taskArr setObject:(NSMutableArray *)arr forKey:key];
    [taskArr synchronize];
}
/**
 *   取出一个本地的数组数据带ID
 */
+ (NSMutableArray *)takeOoutTheArrData                           {
    NSString *saveKey = [NSString stringWithFormat:@"当前ID为_%d_task1", [self getSelfId]];
    NSUserDefaults *taskArr = [NSUserDefaults standardUserDefaults];
    BOOL isThereAre = [SSTool determineWhetherToday:saveKey];  //保存每个人的任务信息时间key
    if (isThereAre) {
        NSMutableArray *arr = [taskArr objectForKey:saveKey];
        if (arr.count > 0) {
            return arr;
        } else {
            return nil;
        }
    } else {
        [taskArr removeObjectForKey:saveKey];
        [taskArr synchronize];
        return nil;
    }
}
/**
 *   删除一个本地的数组数据带ID
 */
//#pragma mark -- 删除一个本地的数组数据带ID
+ (void)delectArrData {
    NSString *key = [NSString stringWithFormat:@"当前ID为_%d", [self getSelfId]];
    NSString *saveKey = [key stringByAppendingString:@"_task1"]; //获取每个人的任务信息key
    NSUserDefaults *tempShareCourseArr = [NSUserDefaults standardUserDefaults];
    [tempShareCourseArr removeObjectForKey:saveKey];
    [tempShareCourseArr synchronize];
}


/**
 * 判断一段话里面包含的字符串数量
 */
+ (NSInteger)convertToInt:(NSString*)strFrom {
    NSInteger count     = 0;
    NSInteger count1    = 0;
    for (int i = 0; i < strFrom.length; i++) {
        NSRange range =NSMakeRange(i, 1);
        NSString * strFromSubStr = [strFrom substringWithRange:range];
        const char* cStringFromstr = [strFromSubStr UTF8String];
        
        if (strlen(cStringFromstr) == 3) {
            //汉字
            count1++;
        } else if (strlen(cStringFromstr) == 1) {
            count++;
        }
    }
    return ceil(count / 2) + count1;
}

/**
 * 删除通知
 */
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"unreadMessages"
                                                  object:nil];
}

/**
 * 动态占位图
 */
+ (void)setPlaceholderGif:(UIImageView *)gitImage imageUrl:(NSString *)imageUrl {
    
//    NSMutableArray *tempArr = [NSMutableArray array];
//    for (int i = 0; i < 3; i ++) {
//        NSString *strImage = [NSString stringWithFormat:@"P_GIF_%d.jpg", i + 1];
//        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:strImage ofType:nil]];
//        image = [SSTool imageCompressForWidth:image targetWidth:130];
//        [tempArr addObject:image];
//    }
//    
//    //把存放图片的数组传给UIImageView的播放动画的数组
//    gitImage.animationImages = tempArr;
//    //设置动画播放时间
//    gitImage.animationDuration = 0.5f;
//    //设置动画连续播放次数
//    gitImage.animationRepeatCount = 0;
//    //开始播放动图
//    [gitImage startAnimating];
//    
//    [gitImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]
//                           completed:^(UIImage *image,
//                                       NSError *error,
//                                       EMSDImageCacheType cacheType,
//                                       NSURL *imageURL) {
//                               NSLog(@"%@", imageURL);
//                               [gitImage stopAnimating];
    
  //  NSLog(@"%@",[SSTool getCutDownImageUrl:imageUrl]);
  //  NSLog(@"%@",imageUrl);
    
   
                               [gitImage sd_setImageWithURL:[NSURL URLWithString: [SSTool getCutDownImageUrl:imageUrl]] placeholderImage:[UIImage imageNamed:ZWT]];
//                               [tempArr removeAllObjects];
//                           }];
}

@end
