//
//  Knight.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "Knight.h"

@implementation Knight

- (NSArray<Coordinate *> *)validMoves
{
    return @[
             [Coordinate withX:1 Y:2],
             [Coordinate withX:2 Y:1],
             [Coordinate withX:-1 Y:2],
             [Coordinate withX:-2 Y:1],
             [Coordinate withX:1 Y:-2],
             [Coordinate withX:2 Y:-1],
             [Coordinate withX:-1 Y:-2],
             [Coordinate withX:-2 Y:-1],
             ];
}

- (NSArray<Coordinate *> *)validDirections
{
    return nil;
}

- (NSString *)abbreviation
{
    return @"K";
}

@end
