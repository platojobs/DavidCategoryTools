# DavidCategoryTools
一些经常用的分类的汇总

        Hello!
        欢迎来到`崔盛希`的github
        🙏x🙏

**（一）===  NSDate 时间和时间戳的相互转化
```objective-c
/**判断时间戳是否为当天,昨天,一周内,年月日
 *  @param  timeInterval  时间戳  --看是-秒/毫秒
 
 */
+ (NSString *)timeStringWithTimeInterval:(NSString *)timeInterval;



/**获取当前的时间
 
 * @param  fomatString  传入时间格式字符串例如： @"yyyMMddHHmmss"
 */


-(NSString*)getCurrentTime:(NSString*)fomatString;


/* 获取当前时间戳
   获取的时间戳是10位，也就是秒
 */
-(NSString*)getCurrentTimestamp;

/*获取当前时间戳
 系统的时间戳  10位的
 */
- (NSString *)getNowTime;

/*//时间戳转化为字符串
 * @param  time   看传入的位数做/1000的处理操作
 */
-(NSString*)stampTimeFomat:(NSString*)time;

/*时间戳转化为时间然后与当前时间减得出剩余时间
 
 */

 -(NSString*)getTimeStringWithSp:(NSString *)sp;






```
