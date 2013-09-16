//
//  RSSafariAddressBar.m
//  RSSafariAddressBarSample
//
//  Created by R0CKSTAR on 9/12/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import "RSSafariAddressBar.h"

#import "RSTextField.h"

@interface RSSafariAddressBar () <UITextFieldDelegate>

@property (nonatomic, strong) RSTextField *addressField;

@end

@implementation RSSafariAddressBar

- (UITextField *)addressField
{
    if (!_addressField) {
        _addressField = [[RSTextField alloc] init];
        _addressField.borderStyle = UITextBorderStyleNone;
        _addressField.backgroundColor = [UIColor lightGrayColor];
        _addressField.layer.cornerRadius = 5.0f;
        _addressField.placeholder = @"Place holder";
        _addressField.textAlignment = NSTextAlignmentLeft;
        _addressField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _addressField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _addressField.autocorrectionType = UITextAutocorrectionTypeNo;
        _addressField.spellCheckingType = UITextSpellCheckingTypeNo;
    }
    return _addressField;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.addressField.frame = CGRectMake(5.0f, 5.0f, self.bounds.size.width - 5.0f * 2, self.bounds.size.height - 5.0f * 2);
        self.addressField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.addressField];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.addressField.frame = CGRectMake(5.0f, 5.0f, frame.size.width - 5.0f * 2, frame.size.height - 5.0f * 2);
        self.addressField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.addressField];
    }
    return self;
}

@end
