//
//  FirstViewController.m
//  BlurMobile
//
//  Created by Chris D'Agostino on 11/17/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import "FirstViewController.h"
#import "Employee.h"

@implementation FirstViewController
@synthesize logView;

#define SERVERNAME @"Chris D'Agostino's iPad2"

@synthesize currentSession, currentEmployees, queryString, startButton, stopButton;
@synthesize deviceName, deviceModel, systemName, systemVersion;

#pragma mark -- UITextFieldDelegate Methods
// Delegate method for UITextField when return is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)tf
{
    [self btnSearch:tf];
    return YES;
}


#pragma mark -- GKSession/Device Helper Methods

-(NSString *) peerNameForPeerID: (NSString *) peerID {
    
    return [currentSession displayNameForPeer:peerID];
}

-(NSString *) currentDeviceName {
    
    return [[UIDevice currentDevice] name];
}

#pragma mark -- GKSession Delegate

- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID{
    
    Log(@"Recieved Connection Request from peerName = %@ with peerID = %@", [self peerNameForPeerID:peerID], peerID);
    
    /**
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Request" message:[NSString stringWithFormat:@"The Client %@ is trying to connect.", peerName] delegate:self cancelButtonTitle:@"Decline" otherButtonTitles:@"Accept", nil];
     [alert show];
     [alert release];
     **/
    [session acceptConnectionFromPeer:peerID error:nil];
    
}

-(void)session:(GKSession *) session
          peer:(NSString *)peerID 
            didChangeState:(GKPeerConnectionState)state {
    
    switch (state) {
            
        case GKPeerStateUnavailable:
            Log(@"Unavailable");
            break;
        case GKPeerStateAvailable: 
            Log(@"Available");
            
            /**
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Server Available!" message:[NSString stringWithFormat:@"The Server %@ is Available, Would you like to Connect?", peerName] 
             delegate:self 
             cancelButtonTitle:@"Decline" 
             otherButtonTitles:@"Accept", nil];
             
             [alert show];
             [alert release];
             **/
            [session connectToPeer:peerID withTimeout:15];
            // session.available = NO;
            break;
            
        case GKPeerStateConnecting:
            Log(@"Connecting");
            break;
            
        case GKPeerStateConnected:
            Log(@"Connected");
            break;
            
        case GKPeerStateDisconnected:
            Log(@"Disconnected");
            [self.currentSession release];
            currentSession = nil;
            [startButton setHidden:NO];
            [stopButton setHidden:YES];
            break;
    }
    
}

#pragma mark -- Data Transfer

-(void) shardEmployeesToDevices:(NSData *) data {
    
    if (currentSession)
        [self.currentSession sendDataToAllPeers:data
                                   withDataMode:GKSendDataReliable 
                                          error:nil];
    
    
}

-(void) mySendDataToPeers:(NSData *) data {
    
    if (currentSession) 
        [self.currentSession sendDataToAllPeers:data
                                   withDataMode:GKSendDataReliable 
                                          error:nil];
}

-(void) receiveData:(NSData *) data
           fromPeer:(NSString *)peer
          inSession:(GKSession *) session
            context:(void *) context {
    
    /**
     Since this method is called on a peer for all data transfers, we need to
     determine what type of NSData is being sent. If it is a search query, then we
     can hydrate the NSData into an NSString. Otherwise, we hydrate the NSData into
     an NSArray of Person objects. Use Exception handling to determine NSData type
     **/
    
    BOOL success = FALSE;
    
    
    
    @try {
        
        NSArray *e = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        for (Employee *employee in e) {
            Log(@"Employee = %@", employee);
        }
        
        success = TRUE;
        
    }
    @catch (NSException *exception) {
        Log(@"main: Caught %@: %@", [exception name], [exception reason]);
    }
    
    if(!success) {
        
        // Convert NSData to NSString
        NSString *str;
        str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Received" message:str delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [str release];
        [alert release];
        
        
    }
    
}

#pragma mark -- Buttons
-(IBAction) btnSearch:(id)sender {
    
    Log(@"Sending Query");
    [queryString resignFirstResponder];
    NSData *data;
    NSString *str = [NSString stringWithString:queryString.text];
    data = [str dataUsingEncoding: NSASCIIStringEncoding];
    [self mySendDataToPeers:data];
    
}

-(IBAction) btnShard:(id) sender {
    
    Log(@"Sharding Employees");
    
    Log(@"There are %d employees to shard", [currentEmployees count]);
    
    
    NSData *employeeData = [NSKeyedArchiver archivedDataWithRootObject:currentEmployees];
    [self shardEmployeesToDevices:employeeData];
    
    
}
-(IBAction) btnStart:(id) sender {
    
    // Determine if the device is eligible to be the server. If not, start as client
    
    if ([[UIDevice currentDevice] name] == SERVERNAME) {
        
        self.currentSession = [[GKSession alloc] initWithSessionID:@"BT" 
                                                       displayName:nil
                                                       sessionMode:GKSessionModeServer];
        
        currentSession.available = YES;
        Log(@"Starting Server");
        
    }else {
        self.currentSession= [[GKSession alloc] initWithSessionID:@"BT" 
                                                      displayName:nil 
                                                      sessionMode:GKSessionModeClient];
        currentSession.available = YES;
        Log(@"Starting Client");
    }
    currentSession.delegate = self;
    currentSession.disconnectTimeout = 20;
    [currentSession setDataReceiveHandler:self withContext:nil];
    [startButton setHidden:YES];
    [stopButton setHidden:NO];       
}

-(IBAction) btnStop:(id) sender {
    
    [self.currentSession disconnectFromAllPeers];
    [self.currentSession release];
    currentSession = nil;
    [startButton setHidden:NO];
    [stopButton setHidden:YES];
    
}

#pragma mark - Memory Management
- (void)dealloc
{
    [queryString release];
    [currentSession release];
    [logView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [deviceModel setText:[[UIDevice currentDevice] model]];
    [deviceName setText:[[UIDevice currentDevice] name]];
    [systemName setText:[[UIDevice currentDevice] systemName]];
    [systemVersion setText:[[UIDevice currentDevice] systemVersion]];
    
    [startButton setHidden:NO];
    [stopButton setHidden:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(log:) name:LOGGER object:nil];
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LOGGER object:nil];
    [self setLogView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)log:(NSNotification *)n {   
    NSLog(@">>> %@", [[n userInfo] objectForKey:@"message"]);
    self.logView.text = [NSString stringWithFormat:@"%@\n%@", self.logView.text, [[n userInfo] objectForKey:@"message"]];
}

@end
