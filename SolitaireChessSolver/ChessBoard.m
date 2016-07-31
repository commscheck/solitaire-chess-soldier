//
//  ChessBoard.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "ChessBoard.h"

@interface ChessBoard ()

@property (nonatomic, assign, readwrite) NSUInteger width;
@property (nonatomic, assign, readwrite) NSUInteger height;

@property (nonatomic, strong) NSMutableDictionary<Coordinate *, id<ChessPiece>> *board;

@end

@implementation ChessBoard

- (instancetype)initWithWidth:(NSUInteger)width height:(NSUInteger)height
{
    self = [super init];

    if (self) {
        _width = width;
        _height = height;
        _board = [[NSMutableDictionary alloc] initWithCapacity:(width * height)];
    }
    return self;
}

- (NSUInteger)piecesCount
{
    return self.board.count;
}

- (id<ChessPiece>)pieceAtCoordinate:(Coordinate *)coordinate
{
    return [self.board objectForKey:coordinate];
}

- (void)setPiece:(id<ChessPiece>)piece atCoordinate:(Coordinate *)coordinate
{
    [self.board setObject:piece forKey:coordinate];
}

- (void)setPieces:(NSDictionary<Coordinate *,id<ChessPiece>> *)pieces
{
    self.board = [pieces mutableCopy];
}

- (BOOL)movePieceFrom:(Coordinate *)origin to:(Coordinate *)destination
{
    if ([self.board objectForKey:origin] == nil) {
        return NO;
    }
    if ([self.board objectForKey:destination] == nil) {
        return NO;
    }
    if ([self coordinateIsValid:origin] == NO) {
        return NO;
    }
    if ([self coordinateIsValid:destination] == NO) {
        return NO;
    }

    id<ChessPiece> piece = [self.board objectForKey:origin];
    [self.board setObject:piece forKey:destination];
    [self.board removeObjectForKey:origin];

    return YES;
}

- (NSArray<Coordinate *> *)pieceLocations
{
    return [self.board allKeys];
}

- (BOOL)coordinateIsValid:(Coordinate *)coordinate
{
    return (((NSUInteger)coordinate.x) < self.width && ((NSUInteger)coordinate.y) < self.height);
}

- (void)printBoard
{
    for (NSInteger y = (self.height - 1); y >= 0; y--) {
        NSMutableString *line = [NSMutableString stringWithCapacity:self.width];
        for (NSInteger x = 0; x < self.width; x++) {
            Coordinate *coordinate = [Coordinate withX:x Y:y];
            id<ChessPiece> piece = [self pieceAtCoordinate:coordinate];

            [line appendFormat:@"%@ ", (piece.abbreviation ?: @".")];
        }
        NSLog(@"%@", line);
    }
    NSLog(@"--------");
}

- (id)copyWithZone:(NSZone *)zone
{
    ChessBoard *copy = [[ChessBoard alloc] initWithWidth:self.width
                                                  height:self.height];
    copy.board = [self.board mutableCopy];

    return copy;
}

@end
