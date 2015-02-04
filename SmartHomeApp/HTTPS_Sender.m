//
//  HTTPS_Sender.m
//  HTTPS_Request_3
//
//  Created by Kay E on 28.01.15.
//  Copyright (c) 2015 Kay.E. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end



@interface HTTPS_Sender : NSObject


@end


@implementation HTTPS_Sender

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
    // [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
