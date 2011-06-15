//
//  MyLinkedNode.m
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 15/06/11.
//

#import "MyLinkedNode.h"


@implementation MyLinkedNode

@synthesize value;

#pragma mark - NSObject

- (id)init
{
   self = [super init];
   if (self) 
   {
      self.value = @"";
   }
   
   return self;
}

- (void)dealloc
{
   [value release];
   value = nil;
   
   [super dealloc];
}

#pragma mark - Node

- (id)initWithString:(NSString *)string
{
   self = [super init];
   if (self)
   {
      self.value = (string != nil) ? string : @"";
   }
   
   return self;
}

+ (id)nodeWithString:(NSString *)value
{
   MyLinkedNode *node = [[MyLinkedNode alloc] initWithString:value];
   return [node autorelease];
}

@end
