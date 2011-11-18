//
//  EmployeeFactory.m
//  EmployeeManager
//
//  Created by Chris D'Agostino on 9/18/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import "EmployeeFactory.h"
#import "Employee.h"

static EmployeeFactory *_instance;

@implementation EmployeeFactory

-(void) dealloc {
    // Don't release the _instance variable since it is a singleton and
    // the only way it will get released is if the caller of the factory method
    // releases it. Therefore, don't over-release it here.
    
    [employees release];
    [super dealloc];
    
}

+(id)instance {
    
    if (!_instance) {
        _instance = [[EmployeeFactory alloc] init];
    }
    return _instance;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    NSString *indexStr = [NSString stringWithFormat:@"%d", buttonIndex];
    NSLog(@"AlertView was dismissed with button index = %@", indexStr);
}

-(void)printAll {
    // Override the description method on the Person object
    
    NSSortDescriptor *lname;
    lname = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    
    NSSortDescriptor *fname;  
    fname = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:lname, fname, nil];
       
    NSArray *sortedEmployees = [employees sortedArrayUsingDescriptors:sortDescriptors];
    for (Employee *employee in sortedEmployees) {
        NSLog(@"Employee = %@", employee);
    }
    
    // Release the two sort descriptors since we no longer need them.
    [lname release];
    [fname release];
       
    NSLog(@"Employees = %@   count is %d", sortedEmployees, [sortedEmployees count]);
        
}

-(void)addEmployee:(Employee *)employee {
    
    [employees addObject:employee];
    
}

-(void)removeEmployee:(Employee *)employee {
    [employees removeObject:employee];
}

-(NSArray *)findByPredicate:(NSPredicate *) predicate {
    
    //    NSString *search = @"*a*";
    //    NSPredicate *findByFirstName = [NSPredicate predicateWithFormat:@"firstName like %@", search];
    //    NSArray *results = [pf findByPredicate:findByFirstName];
    //    NSLog(@"results = %@ count is %d", results, [results count]);
    //  
    
   return [employees filteredArrayUsingPredicate:predicate];
}

-(NSMutableArray *)loadAllEmployees {
    
    if(!employees) {
        
        employees =  [[NSMutableArray alloc] init];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"YYYY-MM-DD";
        
    [employees addObject:[Employee personWithFirstName:@"Chris"
                                           andLastName:@"D'Agostino"
                                         andDateOfHire:[df dateFromString:@"2002-08-01"]
                                     andEmployeeNumber:1]];
    [employees addObject:[Employee personWithFirstName:@"Dina"
                                           andLastName:@"D'Agostino"
                                         andDateOfHire:[df dateFromString:@"2002-09-01"]
                                     andEmployeeNumber:2]];
    [employees addObject:[Employee personWithFirstName:@"Scott"
                                           andLastName:@"Leberknight"
                                         andDateOfHire:[df dateFromString:@"2002-11-12"]
                                     andEmployeeNumber:3]];
    [employees addObject:[Employee personWithFirstName:@"Matt"
                                           andLastName:@"Wizeman"
                                         andDateOfHire:[df dateFromString:@"2003-04-07"]
                                     andEmployeeNumber:4]];
    [employees addObject:[Employee personWithFirstName:@"Jeff"
                                           andLastName:@"Kunkle"
                                         andDateOfHire:[df dateFromString:@"2003-04-07"]
                                     andEmployeeNumber:5]];
    [employees addObject:[Employee personWithFirstName:@"David"
                                           andLastName:@"Singley"
                                         andDateOfHire:[df dateFromString:@"2004-02-11"]
                                     andEmployeeNumber:8]];
    [employees addObject:[Employee personWithFirstName:@"Karen"
                                           andLastName:@"Upton"
                                         andDateOfHire:[df dateFromString:@"2004-08-24"]
                                     andEmployeeNumber:10]];
    [employees addObject:[Employee personWithFirstName:@"Jason"
                                           andLastName:@"Harwig"
                                         andDateOfHire:[df dateFromString:@"2004-11-29"]
                                     andEmployeeNumber:11]];
    [employees addObject:[Employee personWithFirstName:@"Joe"
                                           andLastName:@"Ferner"
                                         andDateOfHire:[df dateFromString:@"2004-12-14"]
                                     andEmployeeNumber:12]];
    [employees addObject:[Employee personWithFirstName:@"Andrew"
                                           andLastName:@"Avenoso"
                                         andDateOfHire:[df dateFromString:@"2005-01-17"]
                                     andEmployeeNumber:13]];
    [employees addObject:[Employee personWithFirstName:@"Al"
                                           andLastName:@"Baptiste"
                                         andDateOfHire:[df dateFromString:@"2005-02-28"]
                                     andEmployeeNumber:14]];
    [employees addObject:[Employee personWithFirstName:@"Mark"
                                           andLastName:@"Lynde"
                                         andDateOfHire:[df dateFromString:@"2005-03-28"]
                                     andEmployeeNumber:15]];
    [employees addObject:[Employee personWithFirstName:@"Paul"
                                           andLastName:@"Beck"
                                         andDateOfHire:[df dateFromString:@"2005-03-28"]
                                     andEmployeeNumber:16]];
    [employees addObject:[Employee personWithFirstName:@"Jim"
                                           andLastName:@"Clark"
                                         andDateOfHire:[df dateFromString:@"2005-07-05"]
                                     andEmployeeNumber:17]];
    [employees addObject:[Employee personWithFirstName:@"Joey"
                                           andLastName:@"Hanzel"
                                         andDateOfHire:[df dateFromString:@"2005-07-11"]
                                     andEmployeeNumber:18]];
    [employees addObject:[Employee personWithFirstName:@"Aaron"
                                           andLastName:@"McCurry"
                                         andDateOfHire:[df dateFromString:@"2005-12-05"]
                                     andEmployeeNumber:21]];
    [employees addObject:[Employee personWithFirstName:@"Jay"
                                           andLastName:@"Garala"
                                         andDateOfHire:[df dateFromString:@"2006-01-17"]
                                     andEmployeeNumber:23]];
    [employees addObject:[Employee personWithFirstName:@"Jeff"
                                           andLastName:@"Borst"
                                         andDateOfHire:[df dateFromString:@"2006-02-06"]
                                     andEmployeeNumber:25]];
    [employees addObject:[Employee personWithFirstName:@"Chris"
                                           andLastName:@"Rohr"
                                         andDateOfHire:[df dateFromString:@"2006-02-06"]
                                     andEmployeeNumber:26]];
    [employees addObject:[Employee personWithFirstName:@"Nancy"
                                           andLastName:@"Bond"
                                         andDateOfHire:[df dateFromString:@"2006-02-13"]
                                     andEmployeeNumber:27]];
    [employees addObject:[Employee personWithFirstName:@"Chris"
                                           andLastName:@"Lee"
                                         andDateOfHire:[df dateFromString:@"2006-11-06"]
                                     andEmployeeNumber:29]];
    [employees addObject:[Employee personWithFirstName:@"Caroline"
                                           andLastName:@"Wizeman"
                                         andDateOfHire:[df dateFromString:@"2006-11-13"]
                                     andEmployeeNumber:31]];
    [employees addObject:[Employee personWithFirstName:@"Gary"
                                           andLastName:@"Kedda"
                                         andDateOfHire:[df dateFromString:@"2006-11-29"]
                                     andEmployeeNumber:32]];
    [employees addObject:[Employee personWithFirstName:@"Seth"
                                           andLastName:@"Schroeder"
                                         andDateOfHire:[df dateFromString:@"2007-02-20"]
                                     andEmployeeNumber:34]];
    [employees addObject:[Employee personWithFirstName:@"Lee"
                                           andLastName:@"Richardson"
                                         andDateOfHire:[df dateFromString:@"2007-03-12"]
                                     andEmployeeNumber:35]];
    [employees addObject:[Employee personWithFirstName:@"Rob"
                                           andLastName:@"Avery"
                                         andDateOfHire:[df dateFromString:@"2007-04-30"]
                                     andEmployeeNumber:36]];
    [employees addObject:[Employee personWithFirstName:@"Bryan"
                                           andLastName:@"Weber"
                                         andDateOfHire:[df dateFromString:@"2007-05-31"]
                                     andEmployeeNumber:37]];
    [employees addObject:[Employee personWithFirstName:@"John"
                                           andLastName:@"Santoro"
                                         andDateOfHire:[df dateFromString:@"2007-06-18"]
                                     andEmployeeNumber:38]];
    [employees addObject:[Employee personWithFirstName:@"Steven"
                                           andLastName:@"Farley"
                                         andDateOfHire:[df dateFromString:@"2007-07-16"]
                                     andEmployeeNumber:39]];
    [employees addObject:[Employee personWithFirstName:@"Mike"
                                           andLastName:@"Bevels"
                                         andDateOfHire:[df dateFromString:@"2007-10-29"]
                                     andEmployeeNumber:40]];
    [employees addObject:[Employee personWithFirstName:@"John"
                                           andLastName:@"Cato"
                                         andDateOfHire:[df dateFromString:@"2007-12-17"]
                                     andEmployeeNumber:41]];
    [employees addObject:[Employee personWithFirstName:@"Fatimah"
                                           andLastName:@"Hoque"
                                         andDateOfHire:[df dateFromString:@"2009-01-05"]
                                     andEmployeeNumber:42]];
    [employees addObject:[Employee personWithFirstName:@"Stephen"
                                           andLastName:@"Mouring"
                                         andDateOfHire:[df dateFromString:@"2008-10-06"]
                                     andEmployeeNumber:43]];
    [employees addObject:[Employee personWithFirstName:@"Rod"
                                           andLastName:@"Balot"
                                         andDateOfHire:[df dateFromString:@"2008-01-07"]
                                     andEmployeeNumber:45]];
    [employees addObject:[Employee personWithFirstName:@"Dan"
                                           andLastName:@"Carnevali"
                                         andDateOfHire:[df dateFromString:@"2008-01-09"]
                                     andEmployeeNumber:46]];
    [employees addObject:[Employee personWithFirstName:@"Curtis"
                                           andLastName:@"Berry"
                                         andDateOfHire:[df dateFromString:@"2008-11-03"]
                                     andEmployeeNumber:51]];
    [employees addObject:[Employee personWithFirstName:@"Chris"
                                           andLastName:@"Miller"
                                         andDateOfHire:[df dateFromString:@"2008-11-03"]
                                     andEmployeeNumber:52]];
    [employees addObject:[Employee personWithFirstName:@"Tina"
                                           andLastName:@"Valdov"
                                         andDateOfHire:[df dateFromString:@"2009-05-11"]
                                     andEmployeeNumber:54]];
    [employees addObject:[Employee personWithFirstName:@"Sean"
                                           andLastName:@"Howell"
                                         andDateOfHire:[df dateFromString:@"2009-06-01"]
                                     andEmployeeNumber:55]];
    [employees addObject:[Employee personWithFirstName:@"Steve"
                                           andLastName:@"Burrows"
                                         andDateOfHire:[df dateFromString:@"2009-06-08"]
                                     andEmployeeNumber:57]];
    [employees addObject:[Employee personWithFirstName:@"Michael"
                                           andLastName:@"Blumberg"
                                         andDateOfHire:[df dateFromString:@"2009-06-19"]
                                     andEmployeeNumber:58]];
    [employees addObject:[Employee personWithFirstName:@"Rick"
                                           andLastName:@"Witter"
                                         andDateOfHire:[df dateFromString:@"2009-10-30"]
                                     andEmployeeNumber:61]];
    [employees addObject:[Employee personWithFirstName:@"Jesse"
                                           andLastName:@"Lentz"
                                         andDateOfHire:[df dateFromString:@"2009-12-07"]
                                     andEmployeeNumber:62]];
    [employees addObject:[Employee personWithFirstName:@"Jennifer"
                                           andLastName:@"Newman"
                                         andDateOfHire:[df dateFromString:@"2010-06-01"]
                                     andEmployeeNumber:64]];
    [employees addObject:[Employee personWithFirstName:@"Jim"
                                           andLastName:@"Clingenpeel"
                                         andDateOfHire:[df dateFromString:@"2010-01-29"]
                                     andEmployeeNumber:65]];
    [employees addObject:[Employee personWithFirstName:@"Andrew"
                                           andLastName:@"Wagner"
                                         andDateOfHire:[df dateFromString:@"2010-01-29"]
                                     andEmployeeNumber:67]];
    [employees addObject:[Employee personWithFirstName:@"Ed"
                                           andLastName:@"MacDonald"
                                         andDateOfHire:[df dateFromString:@"2010-02-16"]
                                     andEmployeeNumber:68]];
    [employees addObject:[Employee personWithFirstName:@"Gray"
                                           andLastName:@"Herter"
                                         andDateOfHire:[df dateFromString:@"2010-03-08"]
                                     andEmployeeNumber:69]];
    [employees addObject:[Employee personWithFirstName:@"Marisa"
                                           andLastName:@"Beard"
                                         andDateOfHire:[df dateFromString:@"2010-04-05"]
                                     andEmployeeNumber:70]];
    [employees addObject:[Employee personWithFirstName:@"Frank"
                                           andLastName:@"Showalter"
                                         andDateOfHire:[df dateFromString:@"2010-05-13"]
                                     andEmployeeNumber:71]];
    [employees addObject:[Employee personWithFirstName:@"Will"
                                           andLastName:@"Brady"
                                         andDateOfHire:[df dateFromString:@"2010-05-18"]
                                     andEmployeeNumber:72]];
    [employees addObject:[Employee personWithFirstName:@"Matt"
                                           andLastName:@"Rohr"
                                         andDateOfHire:[df dateFromString:@"2010-05-18"]
                                     andEmployeeNumber:73]];
    [employees addObject:[Employee personWithFirstName:@"Ryan"
                                           andLastName:@"Gimmy"
                                         andDateOfHire:[df dateFromString:@"2010-07-19"]
                                     andEmployeeNumber:76]];
    [employees addObject:[Employee personWithFirstName:@"Allison"
                                           andLastName:@"Dyck"
                                         andDateOfHire:[df dateFromString:@"2011-06-01"]
                                     andEmployeeNumber:78]];
    [employees addObject:[Employee personWithFirstName:@"Aaron"
                                           andLastName:@"Schwager"
                                         andDateOfHire:[df dateFromString:@"2010-10-25"]
                                     andEmployeeNumber:79]];
    [employees addObject:[Employee personWithFirstName:@"Justyne"
                                           andLastName:@"Zosa"
                                         andDateOfHire:[df dateFromString:@"2010-11-01"]
                                     andEmployeeNumber:80]];
    [employees addObject:[Employee personWithFirstName:@"Sean"
                                           andLastName:@"Pilkenton"
                                         andDateOfHire:[df dateFromString:@"2011-06-01"]
                                     andEmployeeNumber:81]];
    [employees addObject:[Employee personWithFirstName:@"David"
                                           andLastName:@"Sletten"
                                         andDateOfHire:[df dateFromString:@"2010-11-29"]
                                     andEmployeeNumber:82]];
    [employees addObject:[Employee personWithFirstName:@"Sara"
                                           andLastName:@"Bevels"
                                         andDateOfHire:[df dateFromString:@"2011-01-03"]
                                     andEmployeeNumber:83]];
    [employees addObject:[Employee personWithFirstName:@"Ferda"
                                           andLastName:@"Taylor"
                                         andDateOfHire:[df dateFromString:@"2011-02-22"]
                                     andEmployeeNumber:84]];
    [employees addObject:[Employee personWithFirstName:@"Simi"
                                           andLastName:@"Sitaram"
                                         andDateOfHire:[df dateFromString:@"2011-02-28"]
                                     andEmployeeNumber:85]];
    [employees addObject:[Employee personWithFirstName:@"Deizune"
                                           andLastName:@"Mosby"
                                         andDateOfHire:[df dateFromString:@"2011-03-07"]
                                     andEmployeeNumber:86]];
    [employees addObject:[Employee personWithFirstName:@"Kristi"
                                           andLastName:@"Blumenberg"
                                         andDateOfHire:[df dateFromString:@"2011-04-14"]
                                     andEmployeeNumber:88]];
    [employees addObject:[Employee personWithFirstName:@"Andrew"
                                           andLastName:@"Crute"
                                         andDateOfHire:[df dateFromString:@"2011-06-02"]
                                     andEmployeeNumber:91]];
    [employees addObject:[Employee personWithFirstName:@"Brandon"
                                           andLastName:@"Marc-Aurele"
                                         andDateOfHire:[df dateFromString:@"2011-06-02"]
                                     andEmployeeNumber:92]];
    [employees addObject:[Employee personWithFirstName:@"Tom"
                                           andLastName:@"Neumark"
                                         andDateOfHire:[df dateFromString:@"2011-06-02"]
                                     andEmployeeNumber:93]];
    [employees addObject:[Employee personWithFirstName:@"Maciej"
                                           andLastName:@"Koroscik"
                                         andDateOfHire:[df dateFromString:@"2011-06-20"]
                                     andEmployeeNumber:95]];
    [employees addObject:[Employee personWithFirstName:@"Johnny"
                                           andLastName:@"Austin"
                                         andDateOfHire:[df dateFromString:@"2011-08-29"]
                                     andEmployeeNumber:96]];
    [employees addObject:[Employee personWithFirstName:@"Benjamin"
                                           andLastName:@"Kelly"
                                         andDateOfHire:[df dateFromString:@"2011-10-24"]
                                     andEmployeeNumber:97]];
        [df release];
    NSLog(@"Just added %d people to the array", [employees count]);
        
    }
    return employees;
}

@end
