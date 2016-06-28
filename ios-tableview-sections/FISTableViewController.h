//
//  FISTableViewController.h
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISStudent.h"
#import "FISStudentDetailsTableViewController.h"



@interface FISTableViewController : UITableViewController

@property (strong, nonatomic) FISStudent *cellStudent;


@end
