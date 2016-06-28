//
//  FISStudent.h
//  
//
//  Created by Christopher Webb-Orenstein on 6/28/16.
//
//

#import <Foundation/Foundation.h>

@interface FISStudent : NSObject

@property (strong, nonatomic) NSMutableArray *favoriteThings;
@property (strong, nonatomic) NSString *studentName;

-(instancetype)init;

@end
