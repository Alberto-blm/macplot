//
//  MainMenuController.m
//  graficas
//
//  Created by Alberto Blazquez on 7/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import "MainMenuController.h"
#import "PreferencesController.h"
#import "Graphics.h"
#import "Fondo.h"
extern NSString * PreferencesDibujaGrafNotification;
NSString * BaseNotification = @"BaseNotification";
extern NSString * notifOrigen;

@implementation MainMenuController

-(id)init{
    self = [super init];
    
    if(!self){
        return nil;
    }
    
    arrayGraficas = [[NSMutableArray alloc] init];
    lienzo = [[Fondo alloc] init];
    
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(handleFondoDibuja:)
               name:PreferencesDibujaGrafNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(handleDibujar:)
               name:notifOrigen
             object:nil];
    
    return self;
}

-(void)handleFondoDibuja:(NSNotification*)aNotificacion{
    NSDictionary * notificationInfo = [aNotificacion userInfo];
    Graphics * g = [notificationInfo objectForKey:@"anadirGraf"];
    NSNumber * indice = [notificationInfo objectForKey:@"eliminarGraf"];
    Graphics * modf = [notificationInfo objectForKey:@"modificarGraf"];
    NSNumber * modIndice = [notificationInfo objectForKey:@"modificarGrafIndex"];
    

    if(g != nil){
        
        [arrayGraficas addObject:g];
        x1 = [notificationInfo objectForKey:@"x1"];
        x2 = [notificationInfo objectForKey:@"x2"];
        y1 = [notificationInfo objectForKey:@"y1"];
        y2 = [notificationInfo objectForKey:@"y2"];
    }
    
    if(indice != nil){
        [arrayGraficas removeObjectAtIndex:[indice integerValue]];
    }
    
    if((modf != nil) && (modIndice != nil)){
        
        [arrayGraficas replaceObjectAtIndex:[modIndice integerValue] withObject:modf];
        x1 = [notificationInfo objectForKey:@"x1"];
        x2 = [notificationInfo objectForKey:@"x2"];
        y1 = [notificationInfo objectForKey:@"y1"];
        y2 = [notificationInfo objectForKey:@"y2"];
    }
    
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:BaseNotification
                      object:self];

    [lienzo setNeedsDisplay:YES];
    
}

-(void)handleDibujar:(NSNotification*)aNotificacion{
    NSDictionary * notificationInfo = [aNotificacion userInfo];
    NSNumber * origenX = [notificationInfo objectForKey:@"origenX"];
    NSNumber * origenY = [notificationInfo objectForKey:@"origenY"];
    NSNumber * origenAlt = [notificationInfo objectForKey:@"origenAlt"];
    NSNumber * origenAnch = [notificationInfo objectForKey:@"origenAnch"];
    NSGraphicsContext * contexto = [notificationInfo objectForKey:@"contexto"];
    NSRect limite;
    NSRect ejes;
    ejes.origin.x = [x1 integerValue];
    ejes.origin.y = [y1 integerValue];
    ejes.size.width = [x2 integerValue];
    ejes.size.height = [y2 integerValue];
    limite.origin.x = [origenX integerValue];
    limite.origin.y = [origenY integerValue];
    limite.size.height = [origenAlt integerValue];
    limite.size.width = [origenAnch integerValue];
    for(Graphics * grafica in arrayGraficas){
        [grafica pintarGraficaWithGraphicContext:contexto limits:limite ejes:ejes];
    }
}

-(IBAction)mostrarPanel:(id)sender{
    
    if(!preferences){
        preferences = [[PreferencesController alloc]initWithArray:arrayGraficas];
    }
    
    [preferences showWindow:self];
}

-(BOOL)windowShouldClose:(id)sender{
    [NSApp terminate:self];
    return YES;
}

@end
