//
//  ChessBoard.h
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "Coordinate.h"
#import "ChessPiece.h"

#import <Foundation/Foundation.h>

@interface ChessBoard : NSObject <NSCopying>

@property (nonatomic, readonly) NSUInteger width;
@property (nonatomic, readonly) NSUInteger height;

@property (nonatomic, readonly) NSUInteger piecesCount;

- (instancetype)initWithWidth:(NSUInteger)width height:(NSUInteger)height;

- (id<ChessPiece>)pieceAtCoordinate:(Coordinate *)coordinate;

- (void)setPieces:(NSDictionary<Coordinate *, id<ChessPiece>> *)pieces;

- (BOOL)movePieceFrom:(Coordinate *)origin to:(Coordinate *)destination;

- (NSArray<Coordinate *> *)pieceLocations;

- (BOOL)coordinateIsValid:(Coordinate *)coordinate;

- (void)printBoard;

@end
