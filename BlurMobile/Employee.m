//
//  Person.m
//  PersonManager
//
//  Created by Chris D'Agostino on 9/18/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize firstName, lastName, dateOfHire, employeeNumber;

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:[self lastName] forKey:@"lastName"];
    [aCoder encodeObject:[self firstName] forKey:@"firstName"];
    [aCoder encodeObject:[self dateOfHire] forKey:@"dateOfHire"];
    [aCoder encodeInt:[self employeeNumber] forKey:@"employeeNumber"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
    self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
    self.dateOfHire = [aDecoder decodeObjectForKey:@"dateOfHire"];
    self.employeeNumber = [aDecoder decodeIntForKey:@"employeeNumber"];
    return self;
}

+(id)personWithFirstName:(NSString *)fname
             andLastName:(NSString *)lname
          andDateOfHire:(NSDate *) hireDate
       andEmployeeNumber:(int)employeeNumber {
    
    return [[[Employee alloc] initWithFirstName:fname andLastName:lname andDateOfHire:hireDate andEmployeeNumber:employeeNumber] autorelease];
    
}

-(id) initWithFirstName:(NSString *)fname 
            andLastName:(NSString *)lname
         andDateOfHire:(NSDate *) hireDate
        andEmployeeNumber:(int)employeeNumber {

    if ((self = [super init])) {
        self.firstName = fname;
        self.lastName = lname;
        self.dateOfHire = hireDate;
    }
    return self;
}

-(NSString *)description {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSString *date = [dateFormatter stringFromDate:dateOfHire];
    
    [dateFormatter release];
    
    return [NSString stringWithFormat:@"%@, %@ employee number = %i, hired on  %@",lastName, firstName, employeeNumber, date];
    
}

-(void) dealloc {
    [firstName release];
    [lastName release];
    [dateOfHire release];
    [super dealloc];    
}


@end
