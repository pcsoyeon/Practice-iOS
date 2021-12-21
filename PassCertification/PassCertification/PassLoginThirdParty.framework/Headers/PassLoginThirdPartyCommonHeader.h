/*!
 @header PassLoginThirdPartyCommonHeader
 Public Header
 @author Yunju
 @updated 2019-03-18
 @copyright ATON
 @version 1.0.0
 */

#ifndef PassLoginThirdPartyCommonHeader_h
#define PassLoginThirdPartyCommonHeader_h

/*
    @typedef PassLoginThirdPartyState
    @abstract Pass Login 로그인 상태
    @constant NEED_INIT 초기화 필요
    @constant NEED_LOGIN 인증 필요
    @constant OK 인증 완료
 */
typedef NS_ENUM(int, PassLoginThirdPartyState) {
    NEED_INIT = 0,
    NEED_LOGIN,
    OK
};

#endif /* PassLoginThirdPartyCommonHeader_h */
