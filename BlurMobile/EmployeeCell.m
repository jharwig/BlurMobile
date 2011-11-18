//
//  EmployeeCell.m
//  BlurMobile
//
//  Created by Jason Harwig on 11/18/11.
//  Copyright (c) 2011 Near Infinity Corporation. All rights reserved.
//

#import "EmployeeCell.h"

@implementation EmployeeCell
@synthesize name;
@synthesize number;
@synthesize date;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [name release];
    [number release];
    [date release];
    [super dealloc];
}
@end
