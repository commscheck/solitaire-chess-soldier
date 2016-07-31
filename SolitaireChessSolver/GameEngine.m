//
//  GameEngine.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "GameEngine.h"

#import "Bishop.h"
#import "Knight.h"
#import "Pawn.h"
#import "Rook.h"

#import "ChessBoard.h"

@interface GameEngine ()

@property (nonatomic, copy) ChessBoard *board;

@end

@implementation GameEngine

- (instancetype)init
{
    self = [super init];

    if (self) {
        _board = [[ChessBoard alloc] initWithWidth:4 height:4];

        [_board setPieces:[GameEngine defaultPieces]];
    }
    return self;
}

+ (NSDictionary<Coordinate *,id<ChessPiece>> *)defaultPieces
{
    return @{
             [Coordinate withX:0 Y:0] : [Pawn new],
             [Coordinate withX:1 Y:0] : [Bishop new],
             [Coordinate withX:1 Y:1] : [Rook new],
             [Coordinate withX:2 Y:1] : [Rook new],
             [Coordinate withX:2 Y:2] : [Knight new],
             [Coordinate withX:3 Y:1] : [Pawn new],
             [Coordinate withX:3 Y:3] : [Knight new],
             };
}

- (void)start
{
    BOOL result = NO;

    for (Coordinate *location in self.board.pieceLocations) {
        result = [self stepWithBoard:self.board
                              origin:location];
        if (result) {
            break;
        }
    }
    [self.board printBoard];
    NSLog(@"%@", result ? @"Found an answer!" : @"Did not find an answer.");
}

- (BOOL)stepWithBoard:(ChessBoard *)board
               origin:(Coordinate *)origin
{
    id<ChessPiece> piece = [board pieceAtCoordinate:origin];

    for (Coordinate *move in piece.validMoves) {
        ChessBoard *nextBoard = [board copy];
        Coordinate *destination = [origin combinedWith:move];

        if ([nextBoard movePieceFrom:origin to:destination]) {

            if (nextBoard.piecesCount <= 1) {
                [nextBoard printBoard];
                return YES;
            }

            for (Coordinate *nextOrigin in [nextBoard pieceLocations]) {
                if ([self stepWithBoard:nextBoard origin:nextOrigin]) {
                    [nextBoard printBoard];
                    return YES;
                }
            }
        }
    }
    for (Coordinate *direction in piece.validDirections) {
        ChessBoard *nextBoard = [board copy];
        Coordinate *destination = [origin combinedWith:direction];

        while ([nextBoard coordinateIsValid:destination]) {
            if ([nextBoard movePieceFrom:origin to:destination]) {
                if (nextBoard.piecesCount <= 1) {
                    [nextBoard printBoard];
                    return YES;
                }
                for (Coordinate *nextOrigin in [nextBoard pieceLocations]) {
                    if ([self stepWithBoard:nextBoard origin:nextOrigin]) {
                        [nextBoard printBoard];
                        return YES;
                    }
                }
            }
            else {
                destination = [destination combinedWith:direction];
            }
        }
    }
    return NO;
}

@end
