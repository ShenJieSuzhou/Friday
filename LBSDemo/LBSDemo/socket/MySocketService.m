//
//  MySocketService.m
//  LBSDemo
//
//  Created by silicon on 17/5/16.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "MySocketService.h"

@interface MySocketService ()<GCDAsyncSocketDelegate>{
    GCDAsyncSocket *_socket;
}

@end


@implementation MySocketService

+ (MySocketService *)getInstance{
    static MySocketService *_service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _service = [[MySocketService alloc] init];
        
    });
    
    return _service;
}

- (instancetype)init{
    self = [super init];
    if ( self ){
        _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}

- (void)connetToServer:(NSString *)address onPort:(uint16_t)port{
    NSError *error = nil;
    [_socket connectToHost:address onPort:port error:&error];

    if(error){
        NSLog(@"error:%@", error);
    }
    
}


#pragma mark -socket的代理
#pragma mark 连接成功
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    //连接成功
    NSLog(@"%s",__func__);
}

#pragma mark 断开连接
-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    if (err) {
        NSLog(@"连接失败");
    }else{
        NSLog(@"正常断开");
    }
}

#pragma mark 数据发送成功
-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"%s",__func__);
    //发送完数据手动读取
    [sock readDataWithTimeout:-1 tag:tag];
}

#pragma mark 读取数据
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    //代理是在主/子线程调用
    NSLog(@"%@",[NSThread currentThread]);
    NSString *receiverStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    if (tag == 200) {
        //登录指令
    }else if(tag == 201){
        //聊天数据
    }
    NSLog(@"%s %@",__func__,receiverStr);
}



@end
