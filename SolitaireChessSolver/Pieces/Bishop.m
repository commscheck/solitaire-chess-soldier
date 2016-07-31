//
//  Bishop.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "Bishop.h"

@implementation Bishop

- (NSArray<Coordinate *> *)validMoves
{
    return nil;
}

- (NSArray<Coordinate *> *)validDirections
{
    return @[
             [Coordinate withX:1 Y:1],
             [Coordinate withX:-1 Y:1],
             [Coordinate withX:1 Y:-1],
             [Coordinate withX:-1 Y:-1],
             ];
}

- (NSString *)abbreviation
{
    return @"B";
}

@end
