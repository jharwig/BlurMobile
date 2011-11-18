//
//  EmployeeFactory.h
//  EmployeeManager
//
//  Created by Chris D'Agostino on 9/18/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Employee;

@interface EmployeeFactory : NSObject <UIAlertViewDelegate> {
    
    NSMutableArray *employees;
    
}

+(id)instance;

-(NSMutableArray *)loadAllEmployees;

-(void)printAll;

-(void)addEmployee:(Employee *) employee;

-(void)removeEmployee:(Employee *) employee;

-(NSArray *)findByPredicate:(NSPredicate *) predicate;

@end
