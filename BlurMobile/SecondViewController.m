//
//  SecondViewController.m
//  BlurMobile
//
//  Created by Chris D'Agostino on 11/17/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import "SecondViewController.h"
#import "Employee.h"
#import "EmployeeCell.h"

@implementation SecondViewController
@synthesize tableView, currentEmployees;

- (void)viewDidLoad {
    self.tableView.rowHeight = 68;
    [super viewDidLoad];
}

- (void)setCurrentEmployees:(NSMutableArray *)c {
    if (currentEmployees != c) {
        [currentEmployees release];
        currentEmployees = [c retain];
        
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [currentEmployees count];
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"employeesCell";
    EmployeeCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        UIViewController *vc = [[[UIViewController alloc] initWithNibName:@"EmployeeCell" bundle:nil] autorelease];
        cell = (EmployeeCell *)vc.view;
    }
    
    Employee *e = [currentEmployees objectAtIndex:indexPath.row];
    
    cell.name.text = [NSString stringWithFormat:@"%@ %@", e.firstName, e.lastName];
    cell.number.text = [NSString stringWithFormat:@"%i", e.employeeNumber];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    cell.date.text = [df stringFromDate:e.dateOfHire];
    [df release];
    
    return cell;
}


- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [tableView release];
    [super dealloc];
}

@end
