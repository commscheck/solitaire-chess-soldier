//
//  Bishop.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
