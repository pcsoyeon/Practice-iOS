/*!
 @header PassLoginThridPartyError
 custom Error type Class
 @author Yunju
 @updated 2019-03-18
 @copyright ATON
 @version 1.0.0
 */

#import <Foundation/Foundation.h>

/*!
 @class PassLoginThirdPartyError
 @discussion custom Error type Class
 */
@interface PassLoginThirdPartyError : NSObject

/*!
    @abstract Error Code
 */
@property (nonatomic, strong) NSString *code;

/*!
    @abstract Error Message
 */
@property (nonatomic, strong) NSString *message;

/*!
    @discussion URLScheme으로 PassLoginThirdPartyError객체를 생성히여 반환
    @param scheme URLScheme 데이터
    @result id PassLoginThirdPartyError객체
 */
+ (id)initWithScheme:(NSDictionary *)scheme;                        // url scheme

/*!
 @discussion Client Error Code로 PassLoginThirdPartyError객체를 생성하여 반환
 @param code Client Error Code
 @result id PassLoginThirdPartyError객체
 */
+ (id)initWithCode:(NSString *)code;                                // code

/*!
 @discussion NSError로 PassLoginThirdPartyError객체를 생성하여 반환
 @param error NSError 데이터
 @result id PassLoginThirdPartyError객체
 */
+ (id)initWithError:(NSError *)error;                               // NSError

/*!
 @discussion NSDictionary로 PassLoginThirdPartyError객체를 생성하여 반환
 @param errDic NSDictionary
 @result id PassLoginThirdPartyError객체
 */
+ (id)initWithErrorDictionary:(NSDictionary *)errDic;                // NSDictionary

@end
