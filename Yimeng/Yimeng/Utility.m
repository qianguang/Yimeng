//
//  Utility.m
//  QJ
//
//  Created by Qianchuang on 14-7-8.
//  Copyright (c) 2014年 QianChuang. All rights reserved.
//

#import "Utility.h"
#import "LPPopup.h"

@interface Utility ()

@end

@implementation Utility

+ (void)popWithString:(NSString *)string onView:(UIView *)view
{
    if (string == nil) {
        return;
    }
    LPPopup *pop = [LPPopup popupWithText:string];
    [pop showInView:view centerAtPoint:CGPointMake(SCREEN_WIDTH/2.0, 130) duration:1 completion:^{
        
    }];
}

+ (void)setRoundRectWithView:(UIView *)view andCorner:(float)corner
{
    CALayer *layer = view.layer;
    layer.cornerRadius = corner;
    layer.masksToBounds = YES;
}

+ (void)setRoundRectWithView:(UIView *)view andCorner:(float)corner andShadowOpacity:(float)shadowOpacity
{
    CALayer *layer = view.layer;
    layer.cornerRadius = corner;
    layer.masksToBounds = YES;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = shadowOpacity;
}

+ (UIButton *)createBackButton
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"anniu_fanhui"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 40, 40);
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 10);
    return backBtn;
}

+ (BOOL)validPassword:(NSString*)password
{
    NSString *regex = @"(^\\w{6,10}$)";//(^[A-Za-z0-9_]{6,10}$)
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:password];
}

+ (BOOL)validCardNumber:(NSString*)number
{
    NSString *regex = @"(^\\w{1,20}$)";//(^[A-Za-z0-9_]{4,10}$)
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:number];
}

+ (BOOL)validNumber:(NSString*)number
{
    NSString *regex = @"(^[0-9]{4,10}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:number];
}

+ (BOOL)validBankCardNumber:(NSString*)number
{
    NSString *regex = @"(^[0-9]{10,25}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:number];
}

//邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (BOOL)validatePV:(NSString *)pvString
{
    NSString *regex = @"(^\\d+$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:pvString];
}

@end
