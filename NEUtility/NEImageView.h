//
//  NEImageView.h
//  Dvp
//
//  Created by NEIL on 18/5/15.
//  Copyright (c) 2015 NEIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEImageView : UIImageView

@property (nonatomic, assign) IBInspectable BOOL isFullCircle;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@end
