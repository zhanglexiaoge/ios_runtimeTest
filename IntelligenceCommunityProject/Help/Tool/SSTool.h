//
//  SSTool.h
//  Sanbox-SSZJ
//


#import <Foundation/Foundation.h>

;

@interface SSTool : NSObject
/*
 * 获取APP信息
 */
+ (NSDictionary *)appInfo;

/*
 * 获取是否为IPHONE_X,并返回Nav高度
 */
+ (CGFloat )IS_IPHONE_XNavHeight;

/*
 * 获取用户是否登录
 */
+ (BOOL)isLoginSuccess;

/*
 * 获取网络类型
 */
+ (NSString *)networkingStatesFromStatebar;
/*
 * 获取字体高度
 */
+ (CGRect)rectForText:(NSString*)text withFont:(UIFont*)font inSize:(CGSize) size;

/*
 * 获取弹出的提示信息
 */
+ (void)pop_upPromptBoxReminder:(NSString *)reminderString toView:(UIView *)view;

/*
 * 获取当前国家代码
 */
+ (NSDictionary *)getTheLocalAreaCode;

/*
 * 删除一个视图
 */
+ (void)removeView:(NSInteger)tag superView:(UIView *)superView;

/*
 * 验证手机号
 */
+(BOOL)isMobileNumber:(NSString *)mobileNum;

/*
 *  返回一条删除线的label
 */
+ (UILabel *)conversion:(UILabel *)label;

/*
 * 
 */
+ (NSString *)parseDict:(NSDictionary *) dict;
+ (NSString *)parseDict1:(NSDictionary *) dict;

/**
 * 保存本地的信息
 */
+ (void)saveToLocationData:(id)obj key:(NSString *)key;

/**
 * 删除本地的信息
 */
+ (void)delectLocationData:(NSString *)key;

/**
 * 获取本地的信息
 */
+ (id)getLocationData:(NSString *)key;

/*
 * 图片等比压缩
 */
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;


/*
 * 获取标签数据
 */
+ (void)generalTakeOutTheCorrespondingData:(NSString *)string success_data:(void(^)(NSMutableArray *data))value;

/*
 * 过滤特殊字符串
 */
+ (NSString *)filterTheSpecialCharacters:(NSString *)string;

/*
 * 压缩图片
 */
+ (NSData *)uploadImg:(NSData *)data;

/*
 * 存储数据
 */
+ (void)save_databaseTableName:(NSString *)name dataVlue:(id)value dataKey:(NSString *)key;

/*
 * 读取数据
 */
+ (NSDictionary *)takeout_databaseTableName:(NSString *)name dataKey:(NSString *)key;

/*
 * 删除数据
 */
+ (void)clear_takeout_databaseTableName:(NSString *)name;

/*
 * 取出库下所有表
 */
+ (NSArray *)take_databaseTableName:(NSString *)name;

/*
 * 存储某一个带用户ID的key
 */
+ (void)storageAKey:(NSString *)key value:(NSString *)value;

/*
 * 取出某一个带用户ID的key
 */
+ (NSString *)takeOutTheAValue:(NSString *)key;

/*
 * 删除某一个带用户ID的key
 */
+ (void)delectKey:(NSString *)key;

/*
 * 取出个人id
 */
+ (NSInteger)getSelfId;

/*
 * 取出第一次进入保存的经纬度
 */
+ (NSDictionary *)toObtainTheLatitudeAndLongitude;



/**
 * 图片压缩
 */
+ (NSString *)getCutDownImageUrl:(NSString *)imageUrl;

/**
 * 对字典中的<null>进行处理
 */
+ (NSDictionary *)deleteNull:(NSArray *)keys keyAllData:(NSDictionary *)dic;

/**
 *  shan
 */
+ (void)deleObjectById:(NSString *)objectId fromTable:(NSString *)tableName;

/**
 * 字体间距
 */
+ (UILabel *)newLabel:(UILabel *)oldLabel;

/**
 *   保存最新的个人信息
 */
+ (void)saveLatestUserInformation:(NSDictionary *)userinfo ;
 /**
 *   获取最新的个人信息
 */
+ (NSDictionary *)getTheLatestUserInformation ;
/**
 *   删除最新的个人信息
 */
+ (void)delectTheLatestUserInformation ;
/**
 *   金币界面课程分享
 */


+ (void)goldPageShareCourseData:(NSMutableArray *)arr;
+ (NSMutableArray *)returnGoldPageShareCourseData;
+ (NSMutableArray *)goldPageAlreadyShareCourseData:(NSInteger)courseId;
+ (void)deleGoldPageShareCourseData;


/**
 *   判断时间是不是今天
 */

+ (BOOL)determineWhetherToday:(NSString *)string;

//今天时间
+ (void)todayTime:(NSString *)string;

/**
 *   存储一个本地的数组数据带ID
 */

+ (void)saveArrData:(NSMutableArray *)arr;

/**
 *   取出一个本地的数组数据带ID
 */
+ (NSMutableArray *)takeOoutTheArrData;

/**
 *   删除一个本地的数组数据带ID
 */
+ (void)delectArrData;

/**
 *   获取未读消息数量
 */
+ (void)getUnMeaasge;

/**
 * 判断一段话里面包含的字符串数量
 */
+ (NSInteger)convertToInt:(NSString*)strFrom;

/**
 * 动态占位图
 */
+ (void)setPlaceholderGif:(UIImageView *)gitImage imageUrl:(NSString *)imageUrl;
@end
