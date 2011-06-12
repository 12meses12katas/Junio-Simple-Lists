//
//  SimpleLists_UnitTest.m
//  SimpleLists-UnitTest
//
//  Created by Xavier Jurado on 11/06/11.
//

#import "SimpleLists_UnitTest.h"
#import "SingleLinkedList.h"
#import "SingleLinkedNode.h"
#import "DoubleLinkedList.h"
#import "DoubleLinkedNode.h"


@implementation SimpleLists_UnitTest

/*
 list = List.new
 assert_nil(list.find("fred"))
 list.add("fred")
 assert_equal("fred", list.find("fred").value())
 assert_nil(list.find("wilma"))
 list.add("wilma")
 assert_equal("fred",  list.find("fred").value())
 assert_equal("wilma", list.find("wilma").value())
 assert_equal(["fred", "wilma"], list.values())
 
 list = List.new
 list.add("fred")
 list.add("wilma")
 list.add("betty")
 list.add("barney")
 assert_equal(["fred", "wilma", "betty", "barney"], list.values())
 list.delete(list.find("wilma"))
 assert_equal(["fred", "betty", "barney"], list.values())
 list.delete(list.find("barney"))
 assert_equal(["fred", "betty"], list.values())
 list.delete(list.find("fred"))
 assert_equal(["betty"], list.values())
 list.delete(list.find("betty"))
 assert_equal([], list.values())
 */

- (void)testSingleLinkedList
{   
   SingleLinkedList *list;
   NSArray *array;
   
   list = [[SingleLinkedList alloc] init];
   STAssertNil([list nodeWithString:@"fred"], nil);
   [list add:[SingleLinkedNode nodeWithString:@"fred"]];
   STAssertEqualObjects(@"fred", [list nodeWithString:@"fred"].value, nil);
   STAssertNil([list nodeWithString:@"wilma"], nil);
   [list add:[SingleLinkedNode nodeWithString:@"wilma"]];
   STAssertEqualObjects(@"fred", [list nodeWithString:@"fred"].value, nil);
   STAssertEqualObjects(@"wilma", [list nodeWithString:@"wilma"].value, nil);
   array = [NSArray arrayWithObjects:@"fred", @"wilma", nil];
   STAssertEqualObjects(array, [list values], nil);
   
   [list release];
   
   list = [[SingleLinkedList alloc] init];
   [list add:[SingleLinkedNode nodeWithString:@"fred"]];
   [list add:[SingleLinkedNode nodeWithString:@"wilma"]];
   [list add:[SingleLinkedNode nodeWithString:@"betty"]];
   [list add:[SingleLinkedNode nodeWithString:@"barney"]];
   array = [NSArray arrayWithObjects:@"fred", @"wilma", @"betty", @"barney", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"wilma"]];
   array = [NSArray arrayWithObjects:@"fred", @"betty", @"barney", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"barney"]];
   array = [NSArray arrayWithObjects:@"fred", @"betty", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"fred"]];
   array = [NSArray arrayWithObjects:@"betty", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"betty"]];
   array = [NSArray array];
   STAssertEqualObjects(array, [list values], nil);
   
   [list release];
}

- (void)testDoubleLinkedList
{
   DoubleLinkedList *list;
   NSArray *array;
   
   list = [[DoubleLinkedList alloc] init];
   STAssertNil([list nodeWithString:@"fred"], nil);
   [list add:[DoubleLinkedNode nodeWithString:@"fred"]];
   STAssertEqualObjects(@"fred", [list nodeWithString:@"fred"].value, nil);
   STAssertNil([list nodeWithString:@"wilma"], nil);
   [list add:[DoubleLinkedNode nodeWithString:@"wilma"]];
   STAssertEqualObjects(@"fred", [list nodeWithString:@"fred"].value, nil);
   STAssertEqualObjects(@"wilma", [list nodeWithString:@"wilma"].value, nil);
   array = [NSArray arrayWithObjects:@"fred", @"wilma", nil];
   STAssertEqualObjects(array, [list values], nil);
   
   [list release];
   
   list = [[DoubleLinkedList alloc] init];
   [list add:[DoubleLinkedNode nodeWithString:@"fred"]];
   [list add:[DoubleLinkedNode nodeWithString:@"wilma"]];
   [list add:[DoubleLinkedNode nodeWithString:@"betty"]];
   [list add:[DoubleLinkedNode nodeWithString:@"barney"]];
   array = [NSArray arrayWithObjects:@"fred", @"wilma", @"betty", @"barney", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"wilma"]];
   array = [NSArray arrayWithObjects:@"fred", @"betty", @"barney", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"barney"]];
   array = [NSArray arrayWithObjects:@"fred", @"betty", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"fred"]];
   array = [NSArray arrayWithObjects:@"betty", nil];
   STAssertEqualObjects(array, [list values], nil);
   [list remove:[list nodeWithString:@"betty"]];
   array = [NSArray array];
   STAssertEqualObjects(array, [list values], nil);
   
   [list release];
}

@end
