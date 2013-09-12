//
//  RSSafariAddressBar.m
//  RSSafariAddressBarSample
//
//  Created by R0CKSTAR on 9/12/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import "RSSafariAddressBar.h"

@interface RSSafariAddressBar ()

@property (nonatomic, strong) UIButton *menuButton;

@property (nonatomic, strong) UIButton *titleButton;

@property (nonatomic, strong) UIButton *refreshButton;

@end

@implementation RSSafariAddressBar

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.titleButton.frame = CGRectMake(5.0f, 5.0f, self.bounds.size.width - 5.0f * 2, self.bounds.size.height - 5.0f * 2);
        self.titleButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.titleButton];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleButton.frame = CGRectMake(5.0f, 5.0f, frame.size.width - 5.0f * 2, frame.size.height - 5.0f * 2);
        self.titleButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.titleButton];
    }
    return self;
}

- (UIButton *)titleButton
{
    if (!_titleButton) {
        _titleButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _titleButton.layer.cornerRadius = 5.0f;
        _titleButton.backgroundColor = [UIColor lightGrayColor];
        _titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleButton;
}

- (UIButton *)menuButton
{
    if (!_menuButton) {
        _menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _menuButton;
}

- (UIButton *)refreshButton
{
    if (!_refreshButton) {
        _refreshButton = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _refreshButton;
}

@end
