//
//  NEAnalogView.h
//  SwiftCam
//
//  Created by NEIL on 12/5/15.
//  Copyright (c) 2015 com.NEIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NEAnalogViewDelegate <NSObject>

- (void)analogViewMovedTo:(CGPoint)point;

@end

@interface NEAnalogView : UIView

@property (nonatomic, weak) IBOutlet UIView *joystick;

@property (nonatomic, assign) IBOutlet id<NEAnalogViewDelegate> delegate;

@end
