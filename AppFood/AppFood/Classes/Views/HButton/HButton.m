//
//  HButton.m
//  Gito
//
//  Created by hangnguyen on 9/20/16.
//  Copyright © 2016 Horical. All rights reserved.
//

#import "HButton.h"
//#import "CodeBrowseDto.h"
#import "AppDelegate.h"
#import "define.h"
//#import "NSString+Util.h"

@implementation HButton {
    UILabel *_lblNoti;
}

-(void)layoutSubviews {
    [super layoutSubviews];
}


- (void) setStyleName:(NSString *)styleName {
    if ([styleName isEqualToString:@"Blue"]) {
        [self setStyleBlue];
        
    } else if ([styleName isEqualToString:@"White"]) {
        [self setStyleWhite];
        
    } else if ([styleName isEqualToString:@"Clear"]) {
        [self setStyleClear];
        
    } else if ([styleName isEqualToString:@"RoundClear"]) {
        [self setStyleRoundClear:nil];
        
    } else if ([styleName isEqualToString:@"Edit"]) {
        [self setStyleEdit];
        
    } else if ([styleName isEqualToString:@"Delete"]) {
        [self setStyleDeleteRed];
        
    } else if ([styleName isEqualToString:@"Add"]) {
        [self setStyleAddBlue];
        
    } else if ([styleName isEqualToString:@"Square"]) {
        [self setStyleBlueSquare];
        
    } else if ([styleName isEqualToString:@"gray"]) {
        [self setStyleRoundGray:[UIColor blackColor]];
        
    } else if ([styleName isEqualToString:@"blueWhile"]) {
        [self setStyleMenuIsSelected];
        
    } else if ([styleName isEqualToString:@"boder"]) {
        [self setStyleRound];
        
    } else if ([styleName isEqualToString:@"bgray"]) {
        [self setStylebackgroudGray:MAINCOLOR];
        
    }  else if ([styleName isEqualToString:@"textColorBlue"]) {
        [self setStyleRoundGray:MAINCOLOR];

    }  else if ([styleName isEqualToString:@"circle"]) {
        [self setStyleCircle];
        
    }
    
}

- (void) setText:(NSString *)text {
    [self setTitle:text forState:UIControlStateNormal];
}

- (void) setFont:(UIFont*)font {
    self.titleLabel.font = font;
}

- (void) setStyleAvatar {
    
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;

    self.layer.cornerRadius = self.frame.size.height/2;
    self.layer.borderColor = MAINCOLOR.CGColor;
    self.layer.borderWidth = 1.5;
    [self layoutIfNeeded];
}

- (void)setStyleButtonWithCornerRadius:(CGFloat)radius colorTitle:(UIColor*)color
                        colorbacground:(UIColor*)colorBackground {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setBackgroundColor:colorBackground];

}


- (void) setStyleAvatarWithBackgroundColor:(UIColor*)color
                               borderColor:(UIColor*)borderColor
                                 textColor:(UIColor*)textColor {
    self.textColor = textColor;
    self.backgroundColor = color;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 0.0;
    self.layer.cornerRadius = self.bounds.size.height/2;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    [self layoutIfNeeded];
}

- (void) setStyleDefault {
    self.text = nil;
    self.textColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 0;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth = 0;
    [self layoutIfNeeded];
}

- (void) setStyleBlue {
    self.layer.cornerRadius = 5.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:MAINCOLOR];
}

- (void) setStyleOrange {
    self.layer.cornerRadius = 5.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:ORANGE_COLOR];
    
}

- (void) setStyleWhite {
    self.layer.cornerRadius = 5.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor whiteColor]];
}

- (void) setStyleClear {
    [self setTitleColor:MAINCOLOR forState:UIControlStateNormal];
}

- (void) setStyleClearWithTitleBlue {
    [self setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setStyleButtonCircle{
    self.layer.cornerRadius = self.frame.size.height/2;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    [self setBackgroundColor:[UIColor whiteColor]];
    [self layoutIfNeeded];
}

- (void)setStyleCircleBlue {
    self.layer.cornerRadius = self.frame.size.width/2;
    self.clipsToBounds = YES;
    self.alpha = 1;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:MAINCOLOR];
}

- (void)setStyleCircleGray {
    self.layer.cornerRadius = self.frame.size.width/2;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setBackgroundColor:GRAY_HEADER_COLOR];
}
- (void)setStyleWeightScore {
    self.layer.cornerRadius = self.frame.size.width/2;
    self.clipsToBounds = YES;
    self.layer.borderColor = MAINCOLOR.CGColor;
    self.layer.borderWidth = 1.0;
    [self setBackgroundColor:[UIColor whiteColor]];
}
- (void)setStyleCircleOrange {
    self.layer.cornerRadius = self.frame.size.width/2;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:ORANGE_COLOR];
}

- (void)setStyleCircle {
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.borderWidth = 0;
    self.layer.masksToBounds = YES;
}

- (void)setCorneradius:(CGFloat)corneradius {
    self.layer.cornerRadius = corneradius;
    self.clipsToBounds = YES;
}

- (void) setStyleBlueSquare {
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:MAINCOLOR];
}

- (void) setStyleBlueSquare:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:MAINCOLOR];
    
}

- (void) setStyleBlueSquareWithTitle:(NSString*)title {
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setBackgroundColor:MAINCOLOR];
    
}

- (void) setStyleCheckButton {
    [self setImage:[UIImage imageNamed:@"ic-ovalChecked"] forState:UIControlStateNormal];
    
}

- (void) setStyleNoneCheckButton {
    [self setImage:[UIImage imageNamed:@"ic-ovalNonCheck"] forState:UIControlStateNormal];
    
}

- (void)setStyleMenuIsSelected {
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    self.textColor = [UIColor whiteColor];
    [self setBackgroundColor:MAINCOLOR];
}

- (void)setStyleMenuNonSelect {
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    self.textColor = MAINCOLOR ;
    [self setBackgroundColor:[UIColor whiteColor]];
}

- (void) setStyleClearSquare{
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void) setStyleClearSquareBlu {
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor clearColor]];
    
}
- (void) setStyleGraySquare {
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    [self setBackgroundColor:RGBA(0xF2F2F2, 1)];
    
}

- (void) setStyleGraySquareWithTitle:(NSString*)title {
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
    [self setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setBackgroundColor:RGBA(0xF2F2F2, 1)];
    
}

- (void) setStyleRoundClear:(UIColor *)color {
    UIColor *cl = color ? color : MAINCOLOR;
    self.layer.cornerRadius = 10;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [cl CGColor];
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    self.textColor = cl;
}

- (void)setStyleButtonCircle:(UIColor *)color{
    UIColor *cl = color ? color : MAINCOLOR;
    self.layer.cornerRadius = self.frame.size.height/2;
    self.clipsToBounds = YES;
    self.layer.borderWidth = 0;
    self.layer.masksToBounds = YES;
    self.backgroundColor = cl;
    [self layoutIfNeeded];
}

- (void) setStyleCircalClear:(UIColor *)color {
    UIColor *cl = color ? color : MAINCOLOR;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.clipsToBounds = YES;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [cl CGColor];
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    self.textColor = cl;
}


- (void)setStyleRoundGray:(UIColor *)color {
    UIColor *cl = color ? color : MAINCOLOR;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.clipsToBounds = YES;
    self.backgroundColor = GRAY_HEADER_COLOR;
    self.textColor = cl;
}
- (void)setStylebackgroudGray:(UIColor *)color {
    UIColor *cl = color ? color : MAINCOLOR;
    self.backgroundColor = GRAY_HEADER_COLOR;
    self.textColor = cl;
}
- (void) setStyleRound {
    self.layer.cornerRadius = 5.0;
    self.layer.borderWidth = 0;
    self.clipsToBounds = YES;
}

- (void)setImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)image {
    return self.imageView.image;
}

#pragma mark - Color
- (UIColor *)textColor {
    return self.currentTitleColor;
}

- (void)setTextColor:(UIColor *)textColor {
    [self setTitleColor:textColor forState:UIControlStateNormal];
}

- (UIColor *)bgColor {
    return self.backgroundColor;
}

- (void)setBgColor:(UIColor *)bgColor {
    [self setBackgroundColor:bgColor];
}

#pragma mark - Edit
- (void) setStyleEdit {
    self.image = [UIImage imageNamed:@"iconEditBlue"];
}

#pragma mark - Delete
- (void) setStyleDelete {
    self.image = [UIImage imageNamed:@"iconDelete"];
}

- (void) setStyleDeleteRed {
    self.image = [UIImage imageNamed:@"iconDeleteRed"];
}

#pragma mark - Add

- (void) setStyleAddBlue {
    self.image = [UIImage imageNamed:@"ic-AddItemBlue"];
}

#pragma mark - Check
- (void)setIsChecked:(BOOL)isChecked {
    _isChecked = isChecked;
    UIImage *img = (_isChecked)?([UIImage imageNamed:@"Setting_Check"]) :([UIImage imageNamed:@"Setting_UnCheck"]);
    [self setImage:img];
}

#pragma mark - Selection Style
- (void)setStyleTickSquare{
    [self setImage:[UIImage imageNamed:@"ic-squareCheck"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"ic-squareChecked"] forState:UIControlStateSelected];
}

- (void)setStyleTickOval{
    [self setImage:[UIImage imageNamed:@"ic-ovalNonCheck"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"ic-ovalChecked"] forState:UIControlStateSelected];
}

- (void)setStyleTickArrow{
    [self setImage:[UIImage imageNamed:@"ic-arrowDownBlue"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"ic-arrowUpBlue"] forState:UIControlStateSelected];
}


//#pragma mark - Other
//- (void)setImageSD:(NSString *)strURL placeHolder:(NSString *)placeHolderImage name:(NSString *)name {
//    if(!isEmpty(strURL)) {
//
//        [self downloadInmageURlString:strURL placeHolderName:placeHolderImage];;
//
//    } else {
//        self.text = E([Utilities getTwoFirstLetter:name]);
//        [self setImage:nil forState:UIControlStateSelected];
//        [self setImage:nil forState:UIControlStateNormal];
//    }
//}
//
//- (void)setImage:(NSString *)strURL placeHolder:(NSString *)placeHolderImage name:(NSString *)name {
//    if(!isEmpty(strURL)) {
//        [self downloadInmageURlString:strURL placeHolderName:placeHolderImage];
//    } else {
//        self.text = E([Utilities getTwoFirstLetter:name]);
//        [self setImage:nil forState:UIControlStateSelected];
//        [self setImage:nil forState:UIControlStateNormal];
//    }
//
//     [self setStyleAvatarWithBackgroundColor:GRAY_HEADER_COLOR borderColor:GRAY_HEADER_COLOR textColor:GRAY_TEXT_COLOR];
//}
//
//- (void)setImage:(NSString *)strURL placeHolder:(NSString *)placeHolderImage name:(NSString *)name textColor:(UIColor*)textColor backGroundColor:(UIColor*)bgColor{
//    if(!isEmpty(strURL)) {
//
//        [self downloadInmageURlString:strURL placeHolderName:placeHolderImage];
//
//    } else {
//        self.text = [Utilities getOneFirstLetter:name];
//        [self setStyleAvatarWithBackgroundColor:bgColor borderColor:bgColor textColor:textColor];
//        [self setImage:nil forState:UIControlStateSelected];
//        [self setImage:nil forState:UIControlStateNormal];
//    }
//    [self setStyleAvatarWithBackgroundColor:bgColor borderColor:GRAY_HEADER_COLOR textColor:textColor];
//}
//
//- (void)downloadInmageURlString:(NSString*)strURL placeHolderName:(NSString*)placeHolderImage{
//
//    NSString *token = Config.user.token;
//    [[SDWebImageManager sharedManager].imageDownloader setValue:token forHTTPHeaderField:@"token"];
//
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:strURL]
//                      placeholderImage:[UIImage imageNamed:placeHolderImage]
//                               options:(SDWebImageRetryFailed|SDWebImageProgressiveDownload|SDWebImageContinueInBackground)
//                             completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//
//                                 if (image) {
//                                     CGSize newSize = image.size;
//                                     CGFloat radio = newSize.width/newSize.height;
//                                     CGFloat newHeight = 200/radio;
//                                     newSize.width = 200;
//                                     newSize.height = newHeight;
//
//                                     UIImage *scaleImg = [UIImage imageWithImage:image scaledToSize:newSize];
//                                     [self setImage:scaleImg forState:(UIControlStateNormal)];
//                                     [self setImage:scaleImg forState:(UIControlStateSelected)];
//
//                                 } else {
//                                     image = [UIImage imageNamed:placeHolderImage];
//                                     [self setImage:image forState:(UIControlStateNormal)];
//                                     [self setImage:image forState:(UIControlStateSelected)];
//                                 }
//
//                                 [App hideLoading];
//                             }];
//}
//
//- (void)setName:(NSString *)name textColor:(UIColor*)textColor backGroundColor:(UIColor*)bgColor borderCoor:(UIColor*)border {
//    self.text = [Utilities getTwoFirstLetter:name];
//    [self setStyleAvatarWithBackgroundColor:bgColor borderColor:bgColor textColor:textColor];
//    [self setImage:nil forState:UIControlStateSelected];
//    [self setImage:nil forState:UIControlStateNormal];
//    [self setStyleAvatarWithBackgroundColor:bgColor borderColor:border textColor:textColor];
//}
//
//
//- (void) setCircleAvatar:(UIImage*)img {
//    [self setStyleAvatarWithBackgroundColor:GRAY_HEADER_COLOR borderColor:GRAY_HEADER_COLOR textColor:GRAY_TEXT_COLOR];
//    [self setImage:img];
//    self.layer.cornerRadius = self.bounds.size.height/2;
//    self.layer.masksToBounds = YES;
//    self.clipsToBounds = YES;
//    [self layoutIfNeeded];
//}
//
//- (void) setImageWithType:(NSInteger)type {
//     [self setImage:[UIImage imageNamed:VALCond(type == 0, @"ic-ovalNonCheck", @"ic-squareCheck")]];
//}
//
//- (void)setImageForFile:(CodeBrowseDto*)file {
//    NSString *icon =  [file setIconForFile];
//
//    if (file.linkFileImg) {
//        [self sd_setImageWithURL:[NSURL URLWithString:file.linkFileImg] forState:UIControlStateNormal];
//
//    } else {
//        [self setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
//
//    }
//}
//
//#pragma mark - add label noti
//- (void)setLabelNumber:(NSInteger)number{
//
//    if (number == 0) {
//        if (_lblNoti) {
//            [_lblNoti removeFromSuperview];
//            _lblNoti = nil;
//        }
//        return;
//    }
//
//    NSString *str = SF(@"%ld", number);
//    CGFloat width = [NSString widthOfString:str withFont:FONT(10)];
//    CGFloat height = FONT(12).lineHeight;
//    if (width < height) {
//        width = height;
//    }else{
//        height = width;
//    }
//    CGRect frame = CGRectMake(0, 0, width, height);
//    CGPoint point = CGPointMake(CGRectGetWidth(self.bounds)-width/4.0, height/4.0);
//    point = [self convertPoint:point toView:self.superview];
//
//    if (!_lblNoti) {
//        _lblNoti = [[UILabel alloc] initWithFrame:frame];
//        _lblNoti.adjustsFontSizeToFitWidth = YES;
//        _lblNoti.minimumScaleFactor = 0.5;
//        _lblNoti.layer.masksToBounds = YES;
//        _lblNoti.clipsToBounds = YES;
//        _lblNoti.textAlignment = NSTextAlignmentCenter;
//
//        [_lblNoti setBackgroundColor:RED_COLOR_SUMMARY];
//        [_lblNoti setTextColor:[UIColor whiteColor]];
//        [_lblNoti setFont:FONT(12)];
//
//        [self.superview insertSubview:_lblNoti aboveSubview:self];
//    }
//
//    [_lblNoti.layer setCornerRadius:height/4.0];
//    _lblNoti.center = point;
//    [_lblNoti setText:str];
//}

@end