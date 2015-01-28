//
//  HTTPS_Request.m
//  SmartHomeApp
//
//  Created by MacMini-02 on 28/01/15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//


#import "HTTPS_Request.h"

@interface ViewController ()

@end

@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *mPostData = @"{\"method\":\"Info.Get_JSON_HTTPS_Server_Info\",\"params\"{\"IP\":\"??\"}}";
    NSString *mReplyData =[self SendHTTPS_POST:mPostData];
    NSLog(@"mReplyData: %@", mReplyData);
}


- (NSString*)SendHTTPS_POST:(NSString*)mPostData{
    
    NSString *url = @"https://134.155.51.156:85/";  // IP+Port of Pi
    NSURL *mURL = [NSURL URLWithString:url];
    
    //creating POST's body (ergo. what we'd like to send) as an NSString, and converting it to NSData.
    NSData *postData = [mPostData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //read the postData's length, so we can pass it along in the request.
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    //create an NSMutableURLRequest, and include our postData.
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:mURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSLog(@"mPostData: %@", mPostData);
    
    //send our request, and read the reply
    NSURLResponse *requestResponse;
    //disbale ssl-check
    [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[mURL host]];
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    NSLog(@"requestReply: %@", requestReply);
    return requestReply;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
