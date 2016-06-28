//
//  FISStudent.m
//  
//
//  Created by Christopher Webb-Orenstein on 6/28/16.
//
//

#import "FISStudent.h"

@implementation FISStudent


-(instancetype)init {
    self = [super init];
    
    if (self) {
        _favoriteThings = [[NSMutableArray alloc]init];
        _studentName = @"";
    }
    
    return self;
}


@end
