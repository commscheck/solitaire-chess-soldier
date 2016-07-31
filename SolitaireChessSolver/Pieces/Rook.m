//
//  Rook.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "Rook.h"

@implementation Rook

- (NSArray<Coordinate *> *)validMoves
{
    return nil;
}

- (NSArray<Coordinate *> *)validDirections
{
    return @[
             [Coordinate withX:0 Y:1],
             [Coordinate withX:1 Y:0],
             [Coordinate withX:0 Y:-1],
             [Coordinate withX:-1 Y:0],
             ];
}

- (NSString *)abbreviation
{
    return @"R";
}

@end
