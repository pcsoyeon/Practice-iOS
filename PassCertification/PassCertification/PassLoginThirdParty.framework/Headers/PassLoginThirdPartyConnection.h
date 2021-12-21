/*!
    @header PassLoginThirdPartyConnection
    PasLoginThirdPartyConnection은 PASS앱과 연동하여 인증을 제공하는 클래스
    @author Yunju
    @updated 2019-03-18
    @copyright ATON
    @version 1.0.0
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PassLoginThirdPartyCommonHeader.h"
#import "PassLoginThirdPartyError.h"

@protocol PassLoginThirdPartyConnecionDelegate;

/*!
    @class PassLoginThirdPartyConnection
    @discussion PASS앱과 연동하여 인증을 제공하는 클래스
 */
@interface PassLoginThirdPartyConnection : NSObject <UIApplicationDelegate>

/*!
    @abstract PassLoginThirdPartyConnectionDelegate 객체
 */
@property (nonatomic, weak) id<PassLoginThirdPartyConnecionDelegate> delegate;

/*!
 @abstract 제휴사 등록시 발급받은 client id
 */
@property (nonatomic, strong, setter=setClientId:) NSString *clientId;

/*!
 @abstract 제휴사 등록시 발급받은 client secret
 */
@property (nonatomic, strong, setter=setClientSecret:) NSString *clientSecret;

/*!
 @abstract 제휴사 App name
 */
@property (nonatomic, strong, setter=setAppName:) NSString *appName;

/*!
 @abstract redirect Callback Url
 */
@property (nonatomic, strong, setter=setCallbackUrl:) NSString *callbackUrl;

/*!
 @abstract 제휴사 등록시 입력한 제휴 URL scheme
 */
@property (nonatomic, strong, setter=setServiceUrlScheme:) NSString *serviceUrlScheme;

/*!
 @abstract PASS App URL scheme
 */
@property (nonatomic, strong, setter=setPassAppUrlScheme:) NSString *passAppUrlScheme;

/*!
 @abstract PASS App Universal Link
 */
@property (nonatomic, strong, setter=setPassAppUniversalLink:) NSString *passAppUniversalLink;

/*!
 @abstract 통신사 종류 (SKT, KT, LGU+)
 */
@property (nonatomic, strong, setter=setCarrierName:) NSString *carrierName;

/*!
 @abstract PASS App Host name
 */
@property (nonatomic, strong, setter=setPassAppHostName:) NSString *hostName;


/*!
 @abstract 인증 이후에 발급된 access token
 */
@property (nonatomic, strong, getter=getAccessToken) NSString *accessToken;

/*!
 @abstract access token의 만료기간
 */
@property (nonatomic, strong, getter=getAccessTokenExpireDate) NSDate *accessTokenExpireDate;

/*!
 @abstract access token type
 */
@property (nonatomic, strong, getter=getTokenType) NSString *tokenType;


/*!
 @discussion PassLoginThirdPartyConnection Singleton 객체를 얻는 함수
 @result PassLoginThirdPartyConnection Singleton 객체
 */
+ (PassLoginThirdPartyConnection *)getSharedInstance;


/*!
 @discussion PassLogin framework의 버전을 반환하는 함수
 @result Returns NSString version
 */
- (NSString *)getVersion;

/*!
 @discussion 현재 인증 상태를 반환하는 함수
 NEED_INIT(0) : framework initialize 필요, NEED_LOGIN : 인증 필요, OK : 정상
 @result PassLoginThirdPartyState enum 값
 */
- (PassLoginThirdPartyState)getState;


/*!
 @discussion PassLogin 인증 요청
 */
- (void)requestLogin:(NSString *)autoLoginYn prompt:(NSString *)prompt;


- (void)requestLogin;

/*!
 @discussion PassLogin 로그아웃 요청
 */
- (void)requestLogout;                      // logout

/*!
 @discussion PassLogin 인증 해제 요청
 */
- (void)requestDisconnect:(NSString *)plid;                 // disconnect

/*!
 @discussion PassLogin 사용자 정보 요청
 */
- (void)requestUserInfo;                   // get information

/*!
 @discussion PassLogin 사용자 식별 값 요청
 */
- (void)requestLoginId;                         // get plId


// test
- (NSString *)getLog;
- (void)setDomainUrl:(NSString *)domain;
//

@end



/*!
 @protocol PassLoginThirdPartyConnectionDelegate
 @discussion App에서 결과를 전달받을 수 있도록 제공하는 Delegate
 */
@protocol PassLoginThirdPartyConnecionDelegate <NSObject>

/*!
 @discussion 인증 요청에 대한 결과 전달
 @param success 인증 요청에 대한 성공/실패 여부
 @param error 실패시 반환되는 PassLoginThirdPartyError 객체
 */
- (void)connectionDidFinishLogin:(BOOL)success
                           error:(PassLoginThirdPartyError *)error;

/*!
 @discussion 인증 해제 요청에 대한 결과 전달
 @param success 인증 해제 요청에 대한 성공/실패 여부
 @param error 실패시 반환되는 PassLoginThirdPartyError 객체
 */
- (void)connectionDidFinishDisconnect:(BOOL)success
                                 error:(PassLoginThirdPartyError *)error;

/*!
 @discussion 로그인 사용자 정보 요청에 대한 결과 전달
 @param success 사용자 정보 요청에 대한 성공/실패 여부
 @responseData 사용자 정보 NSDictionary데이터
 @param error 실패시 반환되는 PassLoginThirdPartyError 객체
 */
- (void)connectionDidFinishUserInfo:(BOOL)success
                        responseData:(NSDictionary *)responseData
                               error:(PassLoginThirdPartyError *)error;

/*!
 @discussion 로그인 사용자 식별 값 요청에 대한 결과 전달
 @param success 사용자 식별 값 요청에 대한 성공/실패 여부
 @responseData 사용자 식별 정보
 @param error 실패시 반환되는 PassLoginThirdPartyError 객체
 */
- (void)connectionDidFinishLoginId:(BOOL)success
                              plId:(NSString *)plId
                              error:(PassLoginThirdPartyError *)error;

@end
