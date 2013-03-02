//
//  StarField.m
//  ProjectEuler
//
//  Created by Ben Gordon on 3/1/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "StarField.h"

@implementation StarField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithStars:(int)num {
    self = [super init];
    if (self) {
        // Add stars to self
        for (int xx = 0; xx < num + 1; xx++) {
            int randX = arc4random() % [[NSNumber numberWithFloat:self.frame.size.width] intValue];
            UIView *star = [self createStar];
            star.center = CGPointMake(randX, star.center.y);
            [self addSubview:star];
        }
    }
    return self;
}


#pragma mark - Prepopulate with Stars
-(void)addStars:(int)num {
    // Add stars to self
    for (int xx = 0; xx < num + 1; xx++) {
        int randX = arc4random() % [[NSNumber numberWithFloat:self.frame.size.width] intValue];
        UIView *star = [self createStar];
        star.center = CGPointMake(randX, star.center.y);
        [self addSubview:star];
    }
}

#pragma mark - Start & Stop Star Field
-(void)startStarField {
    self.isCreatingStars = YES;
    self.isMovingStars = YES;
    [self createRepeatingStars];
    [self moveStars];
}

-(void)stopStarField {
    self.isCreatingStars = NO;
    self.isMovingStars = NO;
}

#pragma mark - Make a Star
-(UIView *)createStar {
    int randY = arc4random() % [[NSNumber numberWithFloat:self.frame.size.height] intValue];
    int randA = arc4random() % 100;
    
    UIView *star = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width, randY, 1, 1)];
    star.backgroundColor = [UIColor whiteColor];
    star.alpha = randA/100.0f;
    
    return star;
}


#pragma mark - Recursive Functions
-(void)createRepeatingStars {
    if (self.isCreatingStars) {
        [self addSubview:[self createStar]];
        [self performSelector:@selector(createRepeatingStars) withObject:nil afterDelay:0.15];
    }
}

-(void)moveStars {
    if (self.isMovingStars) {
        for (UIView *s in self.subviews) {
            if (s.center.x < 0) {
                [s removeFromSuperview];
            }
            else {
                s.center = CGPointMake(s.center.x - 1, s.center.y);
            }
        }
        
        [self performSelector:@selector(moveStars) withObject:nil afterDelay:0.06];
    }
}


@end
