//
//  Graphics.m
//  graficas
//
//  Created by alumno on 7/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import "Graphics.h"
#import <math.h>
#define HOPS (500)
static NSRect funRect = {-10,-10,20,20};
@implementation Graphics

@synthesize name, color, a, b, c, exponente, tipo;

-(id)initFromWindow:(NSString *) name
              color:(NSColor *) color
               parA:(NSNumber *) a
               parB:(NSNumber *) b
               parC:(NSNumber *) c
          exponente:(NSNumber *) exponente
               tipo:(NSNumber *) tipo
{
    
    self = [super init];
    if(!self){
        return nil;
    }
    
    bzEjeX = [[NSBezierPath alloc]init];
    bzEjeY = [[NSBezierPath alloc]init];
    colorEjes = [NSColor blackColor];
    
    self.name = name;
    self.a = a;
    self.b = b;
    self.c = c;
    self.exponente = exponente;
    [self setColor: color];
    self.tipo = tipo;


    
    
    return self;
    
}

-(void)pintarGraficaWithGraphicContext:(NSGraphicsContext *) ctx
                                limits:(NSRect) limite
                                  ejes:(NSRect) eje{
    NSPoint punto;
    float distancia = funRect.size.width/HOPS;
    bz = [[NSBezierPath alloc]init];
    [ctx saveGraphicsState];
    NSAffineTransform * transformada = [NSAffineTransform transform];
    [transformada translateXBy:limite.size.width/2 yBy:limite.size.height/2];
    [transformada scaleXBy:limite.size.width/eje.size.width yBy:limite.size.height/eje.size.height];
    [transformada concat];
    
    [bzEjeX setLineWidth:0.1];
    [colorEjes setStroke];
    punto.x = funRect.origin.x;
    punto.y = 0;
    [bzEjeX moveToPoint:punto];
    while(punto.x <= funRect.size.width+limite.size.width){
        punto.y = 0;
        [bzEjeX lineToPoint:punto];
        punto.x+=distancia;
    }
    [bzEjeX stroke];
    
    [bzEjeY setLineWidth:0.1];
    [colorEjes setStroke];
    punto.x = 0;
    punto.y = funRect.origin.y;
    [bzEjeY moveToPoint:punto];
    while(punto.y <= funRect.size.height+limite.size.height){
        punto.x = 0;
        [bzEjeY lineToPoint:punto];
        punto.y+=distancia;
    }
    [bzEjeY stroke];
    
    
    [bz setLineWidth:0.1];
    [color setStroke];
    punto.x = eje.origin.x;
    punto.y = [self calcularY:punto.x];
    [bz moveToPoint:punto];
    while(punto.x <= eje.size.width){
        punto.y = [self calcularY:punto.x];
        [bz lineToPoint:punto];
        punto.x += distancia;
    }
    
    [bz stroke];
    [ctx restoreGraphicsState];
    
}

-(float)calcularY:(float) x{

    float resultado = 0;
    float a = [[self a] floatValue];
    float b = [[self b] floatValue];
    float c = [[self c] floatValue];
    int tipo = [[self tipo] integerValue];
    float exp = [[self exponente] floatValue];
    
    switch (tipo) {
        case 0:
            return resultado = a * sinf(( b * x));
            break;
        case 1:
            return resultado = a * cosf((b*x));
            break;
        case 2:
            return resultado = a * powf(x, exp);
            break;
        case 3:
            return resultado = (a * x) + b;
            break;
        case 4:
            return resultado = (a * powf(x, 2)) + (b * x) + c;
            break;
        case 5:
            return resultado = a/(b * x);
            break;
            
        default:
            return 0;
            break;
    }
    
}


@end
