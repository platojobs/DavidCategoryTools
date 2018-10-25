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


/*从这个日期加上N年
* @param  years  多少年
*/
- (NSDate *)dateByAddingYears:(NSInteger)years;
/* 从这个日期加上N月
* @param  years  多少月
*/
- (NSDate *)dateByAddingMonths:(NSInteger)months;
/*从这个日期加上N日
* @param  years  多少月
*/
- (NSDate *)dateByAddingWeeks:(NSInteger)weeks;
/*从这个日期加上N天
* @param  years  多少天
*/
- (NSDate *)dateByAddingDays:(NSInteger)days;
/*从这个日期加上N小时
* @param  years  多少小时
*/
- (NSDate *)dateByAddingHours:(NSInteger)hours;
/*从这个日期加上N分钟
* @param  years  多少分钟
*/
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;
/*从这个日期加上N秒
* @param  years  多少秒
*/
- (NSDate *)dateByAddingSeconds:(NSInteger)seconds; 

/****

iOS比较日期大小默认会比较到秒

****/
+(NSComparisonResult)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;






```
