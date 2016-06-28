//
//  FISTableViewController.m
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISTableViewController.h"

@interface FISTableViewController ()

@property (strong, nonatomic) NSMutableArray *students;

@end

@implementation FISTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.students = [NSMutableArray new];
    
    FISStudent *chris = [[FISStudent alloc]init];
    chris.favoriteThings = [@[@"cheese", @"pizzas", @"monsters"] mutableCopy];
    chris.studentName = @"Chris";
    
    FISStudent *salmaan = [[FISStudent alloc] init];
    salmaan.favoriteThings = [@[@"movies", @"cheesepizza", @"yogurt", @"games"] mutableCopy];
    salmaan.studentName = @"Salmaan";
    
    FISStudent *zain = [[FISStudent alloc]init];
    zain.favoriteThings = [@[@"cheese", @"pizzas"] mutableCopy];
    zain.studentName = @"Zain";
    
    [self.students addObject:chris];
    [self.students addObject:salmaan];
    [self.students addObject:zain];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return (NSInteger)self.students.count ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    FISStudent *sectionStudent = self.students[(NSUInteger)section];
    NSInteger favoriteCount = (NSInteger)sectionStudent.favoriteThings.count;
    return favoriteCount;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    FISStudent *studentAtSection = self.students[(NSUInteger)section];
    return studentAtSection.studentName;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
    
    self.cellStudent = self.students[(NSUInteger)indexPath.section];
    cell.textLabel.text = self.cellStudent.favoriteThings[(NSUInteger)indexPath.row];
//    NSString *detailString = @"";
//    for (NSString *thing in student.favoriteThings) {
//        [detailString stringByAppendingString:thing];
//        [detailString stringByAppendingString:@"\n"];
//    }
//    cell.detailTextLabel.text = detailString;
//    
    // Configure the cell...
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FISStudentDetailsTableViewController *studentDetailsVC = segue.destinationViewController;
    studentDetailsVC.favoriteThings = self.cellStudent.favoriteThings;
    
    NSLog(@"%@", studentDetailsVC.favoriteThings);
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
