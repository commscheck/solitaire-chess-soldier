//
//  Coordinate.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

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
