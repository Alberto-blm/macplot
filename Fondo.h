//
//  Fondo.h
//  graficas
//
//  Created by Alberto Blazquez on 11/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MainMenuController;


@interface Fondo : NSView{
    IBOutlet MainMenuController * mmc;
    
}

-(id)initWithCoder:(NSCoder *)coder;
-(void)drawRect:(NSRect)dirtyRect;
-(void)handleDibujo:(NSNotification *)aNotification;

@end

