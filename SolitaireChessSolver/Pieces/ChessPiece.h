//
//  ChessPieceProtocol.h
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "Coordinate.h"

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ChessPiece <NSObject>

@property (nonatomic, readonly, nullable) NSArray<Coordinate *> *validMoves;

@property (nonatomic, readonly, nullable) NSArray<Coordinate *> *validDirections;

@property (nonatomic, readonly) NSString *abbreviation;

@end

NS_ASSUME_NONNULL_END
