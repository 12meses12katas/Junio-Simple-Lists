//
//  SimpleLists_UnitTest.m
//  SimpleLists-UnitTest
//
//  Created by Xavier Jurado on 11/06/11.
//

#import "SimpleLists_UnitTest.h"
#import "SingleLinkedList.h"
#import "SingleLinkedNode.h"


@implementation SimpleLists_UnitTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSingleLinkedList
{
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
   
   SingleLinkedList *list;
   NSArray *array;
   
   list = [[SingleLinkedList alloc] init];
   STAssertNil([list nodeWithString:@"fred"], nil);
   [list add:[SingleLinkedNode nodeWithValue:@"fred"]];
   STAssertEqualObjects(@"fred", [list nodeWithString:@"fred"].value, nil);
   STAssertNil([list nodeWithString:@"wilma"], nil);
   [list add:[SingleLinkedNode nodeWithValue:@"wilma"]];
   STAssertEqualObjects(@"fred", [list nodeWithString:@"fred"].value, nil);
   STAssertEqualObjects(@"wilma", [list nodeWithString:@"wilma"].value, nil);
   array = [NSArray arrayWithObjects:@"fred", @"wilma", nil];
   STAssertEqualObjects(array, [list values], nil);
   
   [list release];
   
   list = [[SingleLinkedList alloc] init];
   [list add:[SingleLinkedNode nodeWithValue:@"fred"]];
   [list add:[SingleLinkedNode nodeWithValue:@"wilma"]];
   [list add:[SingleLinkedNode nodeWithValue:@"betty"]];
   [list add:[SingleLinkedNode nodeWithValue:@"barney"]];
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
}

@end
