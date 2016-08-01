//
//  Coordinate.m
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

#import "Coordinate.h"

@implementation Coordinate

+ (Coordinate *)withX:(NSInteger)x Y:(NSInteger)y
{
    Coordinate *c = [Coordinate new];
    c.x = x;
    c.y = y;

    return c;
}

- (Coordinate *)combinedWith:(Coordinate *)coordinate
{
    return [Coordinate withX:(self.x + coordinate.x)
                           Y:(self.y + coordinate.y)];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [Coordinate withX:self.x Y:self.y];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"(%ld, %ld)", (long)self.x, (long)self.y];
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[self class]] == NO) {
        return NO;
    }
    Coordinate *o = object;

    return (self.x == o.x && self.y == o.y);
}

- (NSUInteger)hash
{
    return self.x ^ self.y;
}

@end
