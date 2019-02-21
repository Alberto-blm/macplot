//
//  Ejes.h
//  graficas
//
//  Created by Alberto Blazquez on 11/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Ejes : NSObject{
    
    NSNumber * ejeX1;
    NSNumber * ejeX2;
    NSNumber * ejeY1;
    NSNumber * ejeY2;
    NSColor * color;
    NSBezierPath * bz;
    
}

@property(nonatomic, copy)NSNumber * ejeX1;
@property(nonatomic, copy)NSNumber * ejeX2;
@property(nonatomic, copy)NSNumber * ejeY1;
@property(nonatomic, copy)NSNumber * ejeY2;
@property(nonatomic,copy)NSColor * color;

-(id)initEjeFromWindow:(NSNumber *)aEjeX
                  ejeY:(NSNumber *)aEjeY
                 color:(NSColor *)aColor;

@end


