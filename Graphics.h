//
//  Graphics.h
//  graficas
//
//  Created by alumno on 7/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Graphics : NSObject
{

    NSString * name;
    NSColor * color;
    NSColor * colorEjes;
    NSNumber * a;
    NSNumber * b;
    NSNumber * c;
    NSNumber * exponente;
    NSNumber * tipo;
    NSBezierPath * bz;
    NSBezierPath * bzEjeX;
    NSBezierPath * bzEjeY;

}

@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSColor * color;
@property(nonatomic, copy) NSNumber * a;
@property(nonatomic, copy) NSNumber * b;
@property(nonatomic, copy) NSNumber * c;
@property(nonatomic, copy) NSNumber * exponente;
@property(nonatomic, copy) NSNumber * tipo;


-(id)initFromWindow:(NSString *) name
              color:(NSColor *) color
               parA:(NSNumber *) a
               parB:(NSNumber *) b
               parC:(NSNumber *) c
          exponente:(NSNumber *) exponente
               tipo:(NSNumber *) tipo;

-(void)pintarGraficaWithGraphicContext:(NSGraphicsContext *) ctx
                                limits:(NSRect) limite
                                  ejes:(NSRect) eje;
-(float)calcularY:(float) x;

@end
