//
//  Ejes.m
//  graficas
//
//  Created by Alberto Blazquez on 11/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import "Ejes.h"

@implementation Ejes

@synthesize ejeX1, ejeX2, ejeY1, ejeY2, color;

-(id)initEjeFromWindow:(NSNumber *)aEjeX1
                  ejeY1:(NSNumber *)aEjeY1
                 ejeX2:(NSNumber *)aEjeX2
                 ejeY2:(NSNumber *)aEjeY2
                 color:(NSColor *)aColor{
    self = [super init];
    if(!self){
        return nil;
    }
    
    bz = [[NSBezierPath alloc]init];
    
    self.ejeX1 = aEjeX1;
    self.ejeX2 = aEjeX2;
    self.ejeY1 = aEjeY1;
    self.ejeY2 = aEjeY2;
    self.color = color;
    
    return self;
}

-(void)dibujarEjesWithGraphicContext:(NSGraphicsContext *)ctx{
    [ctx saveGraphicsState];
    
    //[bz moveToPoint:origen];
    

}

@end
