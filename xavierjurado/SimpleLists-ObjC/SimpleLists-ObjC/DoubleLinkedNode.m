//
//  DoubleLinkedNode.m
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 12/06/11.
//

#import "DoubleLinkedNode.h"


@implementation DoubleLinkedNode

@synthesize value;
@synthesize nextNode;
@synthesize prevNode;

#pragma mark - NSObject

- (void)dealloc
{
   [value release];
   value = nil;
   [nextNode release];
   nextNode = nil;
   
   [super dealloc];
}

#pragma mark - Node

- (id)init
{
   self = [super init];
   if (self)
   {
      self.value = @"";
      self.nextNode = nil;
      self.prevNode = nil;
   }
   return self;
}

- (id)initWithString:(NSString *)string
{
   self = [super init];
   if (self)
   {
      self.value = (string != nil) ? string : @"";
      self.prevNode = nil;
      self.nextNode = nil;
   }
   return self;
}

+ (id)nodeWithString:(NSString *)value
{
   DoubleLinkedNode *node = [[DoubleLinkedNode alloc] initWithString:value];
   return [node autorelease];
}

@end
