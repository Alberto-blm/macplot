//
//  Fondo.m
//  graficas
//
//  Created by Alberto Blazquez on 11/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import "Fondo.h"
#import "MainMenuController.h"
#import "Graphics.h"

extern NSString * PreferencesDibujaGrafNotification;
extern NSString * BaseNotification;
NSString * notifOrigen = @"origen";
@implementation Fondo
    
-(id)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if(self){
        NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(handleDibujo:)
                   name:BaseNotification
                 object:nil];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSRect bounds = [self bounds];
    
    [[NSColor whiteColor]set];
    [NSBezierPath fillRect:[self bounds]];
    NSGraphicsContext *ctx = [NSGraphicsContext currentContext];
    // Drawing code here.
    NSInteger origenX = bounds.origin.x;
    NSInteger origenY = bounds.origin.y;
    float origenAlt = bounds.size.height;
    float origenAnch = bounds.size.width;
    
    NSNumber * ox = [[NSNumber alloc] initWithInteger:origenX];
    NSNumber * oy = [[NSNumber alloc] initWithInteger:origenY];
    NSNumber * oalt = [[NSNumber alloc] initWithFloat:origenAlt];
    NSNumber * oanch = [[NSNumber alloc] initWithFloat:origenAnch];
    NSDictionary * datosVista = [NSDictionary dictionaryWithObjectsAndKeys:ox, @"origenX",
                                 oy, @"origenY",
                                 oalt, @"origenAlt",
                                 oanch, @"origenAnch",
                                 ctx, @"contexto",
                                 nil];
    NSNotificationCenter * nv = [NSNotificationCenter defaultCenter];
    
    [nv postNotificationName:notifOrigen object:self userInfo:datosVista];
    
}

-(void)handleDibujo:(NSNotification *)aNotification{

    //[self setNeedsDisplay:YES];
}

@end
