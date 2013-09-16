//
//  RSTextField.m
//  RSSafariAddressBarSample
//
//  Created by R0CKSTAR on 9/13/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import "RSTextField.h"

@interface UIView (LayoutHelper)

- (void)dockLeft;

- (void)centerIn;

@end

@implementation UIView (LayoutHelper)

- (void)dockLeft
{
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.origin.y = roundf((self.superview.bounds.size.height - frame.size.height) / 2.0f);
    self.frame = frame;
}

- (void)centerIn
{
    CGRect frame = self.frame;
    frame.origin.x = roundf((self.superview.bounds.size.width - frame.size.width) / 2.0f);
    frame.origin.y = roundf((self.superview.bounds.size.height - frame.size.height) / 2.0f);
    self.frame = frame;
}

@end

@interface RSTextField ()

@property (nonatomic, assign) BOOL isEditingChanged;

@property (nonatomic, assign) BOOL isDeletingEnded;

@end

@implementation RSTextField

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        self.isEditingChanged = NO;
        self.isDeletingEnded  = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aaa) name:UITextFieldTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bbb) name:UITextFieldTextDidEndEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ccc:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)aaa
{
    self.isEditingChanged = YES;
    [self setNeedsLayout];
}

- (void)bbb
{
    self.isEditingChanged = YES;
    [self setNeedsLayout];
}

- (void)ccc:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    if (textField.text.length == 0) {
        self.isDeletingEnded = YES;
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITextFieldLabel")]) {
            UILabel *label = (UILabel *)subview;
            [label sizeToFit];
            
            if (self.isEditingChanged) {
                if (self.isEditing) {
                    if (self.isDeletingEnded) {
                        [label dockLeft];
                        self.isDeletingEnded = NO;
                    } else {
                        [label centerIn];
                    }
                    [UIView animateWithDuration:0.3 animations:^{
                        [label dockLeft];
                    }];
                } else {
                    [label dockLeft];
                    [UIView animateWithDuration:0.3 animations:^{
                        [label centerIn];
                    }];
                }
                self.isEditingChanged = NO;
            } else {
                if (self.isEditing) {
                    [label dockLeft];
                } else {
                    [label centerIn];
                }
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
