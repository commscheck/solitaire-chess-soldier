//
//  main.m
//  SolitaireChessSolver
//
//  Created by Benjamin Lea on 30/07/2016.
//  Copyright © 2016 Benjamin Lea. All rights reserved.
//

#import "GameEngine.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        GameEngine *engine = [[GameEngine alloc] init];

        [engine start];
    }
    return 0;
}
