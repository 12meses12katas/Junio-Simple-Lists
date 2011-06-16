//
//  SingleLinkedNode.m
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 12/06/11.
//

#import "SingleLinkedNode.h"


@implementation SingleLinkedNode

@synthesize value;
@synthesize nextNode;

- (id)init
{
   self = [super init];
   if (self) 
   {
      self.value = @"";
      self.nextNode = nil;
   }
   return self;
}

- (id)initWithString:(NSString *)aValue
{
   self = [super init];
   if (self) 
   {
      self.value = aValue ? aValue : @"";
      self.nextNode = nil;
   }
   return self;
}

- (void)dealloc
{
   [value release];
   value = nil;
   [nextNode release];
   nextNode = nil;
   
   [super dealloc];
}

+ (id)nodeWithString:(NSString *)value
{
   SingleLinkedNode *node = [[SingleLinkedNode alloc] initWithString:value];
   return [node autorelease];
}

@end
