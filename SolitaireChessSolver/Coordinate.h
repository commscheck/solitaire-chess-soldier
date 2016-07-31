//
//  Coordinate.h
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coordinate : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

+ (Coordinate *)withX:(NSInteger)x Y:(NSInteger)y;

- (Coordinate *)combinedWith:(Coordinate *)coordinate;

@end
