//
//  FirstViewController.h
//  BlurMobile
//
//  Created by Chris D'Agostino on 11/17/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>


@interface FirstViewController : UIViewController <GKSessionDelegate, UIAlertViewDelegate, UITextFieldDelegate> {
        
    GKSession *currentSession;
    NSMutableArray *currentEmployees;
    IBOutlet UITextField *queryString;
    IBOutlet UIButton *startButton;
    IBOutlet UIButton *stopButton;
    IBOutlet UILabel *deviceName;
    IBOutlet UILabel *deviceModel;
    IBOutlet UILabel *systemName;
    IBOutlet UILabel *systemVersion;
    
}
    
@property(nonatomic, retain) GKSession *currentSession;
@property(nonatomic, retain) NSMutableArray *currentEmployees;
@property(nonatomic, retain) UITextField *queryString;
@property(nonatomic, retain) UIButton *startButton;
@property(nonatomic, retain) UIButton *stopButton;
@property(nonatomic, retain) UILabel *deviceName, *deviceModel, *systemName, *systemVersion;
@property (retain, nonatomic) IBOutlet UITextView *logView;


-(IBAction) btnSearch:(id) sender;
-(IBAction) btnShard:(id) sender;
-(IBAction) btnStart:(id) sender;
-(IBAction) btnStop:(id) sender;

@end
