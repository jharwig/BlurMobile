//
//  EmployeeCell.h
//  BlurMobile
//
//  Created by Jason Harwig on 11/18/11.
//  Copyright (c) 2011 Near Infinity Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *number;
@property (retain, nonatomic) IBOutlet UILabel *date;
@end
