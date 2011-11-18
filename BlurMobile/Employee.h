//
//  Person.h
//  PersonManager
//
//  Created by Chris D'Agostino on 9/18/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Employee : NSObject <NSCoding> {
   
}

-(id)initWithFirstName:(NSString *)fname
           andLastName:(NSString *)lname
        andDateOfHire:(NSDate *) hireDate
     andEmployeeNumber:(int)employeeNumber;

+(id)personWithFirstName:(NSString *)fname
             andLastName:(NSString *)lname
          andDateOfHire:(NSDate *)hireDate
        andEmployeeNumber:(int)employeeNumber;

@property(nonatomic,retain) NSString *firstName;
@property(nonatomic,retain) NSString *lastName;
@property(nonatomic, retain) NSDate *dateOfHire;
@property (nonatomic, assign) int employeeNumber;

@end
