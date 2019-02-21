//
//  MainMenuController.h
//  graficas
//
//  Created by Alberto Blazquez on 7/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@class PreferencesController;
@class Fondo;
@class Graphics;

@interface MainMenuController : NSObject <NSWindowDelegate>{
    
    PreferencesController * preferences;
    NSMutableArray * arrayGraficas;
    IBOutlet Fondo * lienzo;
    Graphics * grafica;
    NSNumber * x1;
    NSNumber * x2;
    NSNumber * y1;
    NSNumber * y2;
}

-(id)init;
-(IBAction)mostrarPanel:(id)sender;
-(void)handleFondoDibuja:(NSNotification *)aNotificacion;
-(void)handleDibujar:(NSNotification *)aNotificacion;
-(BOOL)windowShouldClose:(id)sender;
@end
