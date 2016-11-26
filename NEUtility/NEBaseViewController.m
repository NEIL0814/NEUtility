//
//  NEBaseViewController.m
//  SwiftCam
//
//  Created by billylee on 16/4/2015.
//  Copyright (c) 2015年 com.NEIL. All rights reserved.
//

#import "NEBaseViewController.h"
#import "MBProgressHUD.h"
#import "NEUtility.h"

@interface NEBaseViewController ()

@property (nonatomic, strong) MBProgressHUD *loadingHUD;
@property (nonatomic, strong) MBProgressHUD *progressHUD;

@property (nonatomic, strong) NSData *binaryData;

@end

@implementation NEBaseViewController

+ (id)getDefaultController {
    return [[self alloc] initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.navLeftView != nil) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.navLeftView];
    }
    if (self.navRightView != nil) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.navRightView];
    }
    if (self.titleView != nil) {
        self.navigationItem.titleView = self.titleView;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)showLoadingDialog:(BOOL)animated {
    [self showLoadingDialog:NEString(@"Loading") animated:animated];
}

- (void)showLoadingDialogWithTitle:(NSString*)title {
    [self showLoadingDialog:title animated:NO];
}

- (void)showLoadingDialog:(NSString*)title animated:(BOOL)animated {
    [self showLoadingDialog:title message:nil animated:animated];
}

- (void)showLoadingDialog:(NSString*)title message:(NSString*)message {
    [self showLoadingDialog:title message:message animated:NO];
}

- (void)showLoadingDialog:(NSString*)title message:(NSString*)message animated:(BOOL)animated {
    if (self.loadingHUD != nil) {
        [self.loadingHUD hideAnimated:NO];
        self.loadingHUD = nil;
    }
    
    self.loadingHUD = [MBProgressHUD showHUDAddedTo:self.navigationController ? self.navigationController.view : self.view animated:animated];
    self.loadingHUD.mode = MBProgressHUDModeIndeterminate;
    self.loadingHUD.bezelView.color = UIColorWithARGB(0.8f, 0.2f, 0.2f, 0.2f);
    
    self.loadingHUD.label.text = title;
    if (message.length > 0) {
        self.loadingHUD.detailsLabel.text = message;
    }
}

- (void)dismissLoadingDialog:(BOOL)animated {
    [self.loadingHUD hideAnimated:animated];
}

- (void)showProgressDialog:(NSString*)title message:(NSString*)message progress:(float)progress {
    if (self.progressHUD == nil) {
        self.progressHUD = [MBProgressHUD showHUDAddedTo:self.navigationController ? self.navigationController.view : self.view animated:YES];
        self.progressHUD.mode = MBProgressHUDModeAnnularDeterminate;
        self.progressHUD.bezelView.color = UIColorWithARGB(0.8f, 0.2f, 0.2f, 0.2f);
    }
    
    self.progressHUD.label.text = title;
    if (message.length > 0) {
        self.progressHUD.detailsLabel.text = message;
    }
    self.progressHUD.progress = progress;
}

- (void)dismissProgressDialog:(BOOL)animated {
    [self.progressHUD hideAnimated:animated];
}

- (void)dismissAllHUD:(BOOL)animated {
    [MBProgressHUD hideHUDForView:self.navigationController ? self.navigationController.view : self.view animated:animated];
}

- (void)showAlertOK:(NSString*)title message:(NSString*)message {
    [self showAlert:title message:message buttons:@[[AlertButton initWithText:@"OK" handler:nil]]];
}

- (void)showAlertOK:(NSString*)title message:(NSString*)message handler:(AlertButtonHandler)handler {
    [self showAlert:title message:message buttons:@[[AlertButton initWithText:@"OK" handler:handler]]];
}

- (void)showAlertOK:(NSString*)title message:(NSString*)message buttonText:(NSString*)button handler:(AlertButtonHandler)handler {
    [self showAlert:title message:message buttons:@[[AlertButton initWithText:button handler:handler]]];
}

- (void)showAlert:(NSString*)title
          message:(NSString*)message
       buttonText:(NSString*)buttonText
    buttonHandler:(AlertButtonHandler)handler
       cancelText:(NSString*)cancelText
    cancelHandler:(AlertButtonHandler)cancelHandler {
    
    UIAlertController *vc = [NEBaseViewController alertViewControllerWithTitle:title message:message buttonText:buttonText buttonHandler:handler cancelText:cancelText cancelHandler:cancelHandler];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)showAlert:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons {
    UIAlertController *alert = [NEBaseViewController alertViewControllerWithTitle:title message:message buttons:buttons];
    [self presentViewController:alert animated:YES completion:nil];
}

+ (UIAlertController*)alertViewControllerWithTitle:(NSString*)title
                                           message:(NSString*)message
                                        buttonText:(NSString*)buttonText
                                     buttonHandler:(AlertButtonHandler)handler
                                        cancelText:(NSString*)cancelText
                                     cancelHandler:(AlertButtonHandler)cancelHandler {
    
    AlertButton *ok = [AlertButton initWithText:buttonText style:UIAlertActionStyleDefault handler:handler];
    AlertButton *cancel = [AlertButton initWithText:cancelText style:UIAlertActionStyleCancel handler:cancelHandler];
    
    return [NEBaseViewController alertViewControllerWithTitle:title message:message buttons:@[ok, cancel]];
}

+ (UIAlertController*)alertViewControllerWithTitle:(NSString*)title message:(NSString*)message buttons:(NSArray*)buttons {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (AlertButton *button in buttons) {
        [alert addAction:[UIAlertAction actionWithTitle:button.buttonString style:button.style handler:button.handler]];
    }
    return alert;
}

@end

@interface AlertButton()


@end

@implementation AlertButton

+ (id)initWithText:(NSString *)title handler:(AlertButtonHandler)handler {
    return [AlertButton initWithText:title style:UIAlertActionStyleDefault handler:handler];
}

+ (id)initWithText:(NSString*)title style:(UIAlertActionStyle)style handler:(AlertButtonHandler)handler {
    AlertButton *button = [[AlertButton alloc] init];
    button.buttonString = title;
    button.style = style;
    button.handler = handler;
    return button;
}

@end
