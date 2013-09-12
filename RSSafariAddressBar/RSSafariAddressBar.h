//
//  RSSafariAddressBar.h
//  RSSafariAddressBarSample
//
//  Created by R0CKSTAR on 9/12/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RSSafariAddressBarDelegate <NSObject>

@end

@interface RSSafariAddressBar : UIView

@property (nonatomic, assign) id<RSSafariAddressBarDelegate> delegate;

@end
