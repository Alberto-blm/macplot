//
//  PreferencesController.m
//  graficas
//
//  Created by Alberto Blazquez on 11/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import "PreferencesController.h"
#import "Graphics.h"
#import "Ejes.h"

NSString * PreferencesDibujaGrafNotification = @"PreferencesDibujaGrafNotification";
extern NSString * BaseNotification;

@interface PreferencesController ()

@end

@implementation PreferencesController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)awakeFromNib{
    
    [pGrafica selectItemAtIndex:0];
}

-(id)initWithArray:(NSMutableArray  *)aArrayGraficas{
    
    if(![super initWithWindowNibName:@"PreferencesController"])
        return nil;
    
    arrayGraficas = aArrayGraficas;
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(disableParameters:)
               name:@"ComboBoxDidChangeNotification"
             object:nil];
    
    [nc addObserver:self
           selector:@selector(handleUpdateTable:)
               name:BaseNotification
             object:nil];
    return self;
}

-(IBAction)disableParameters:(id)sender{
    
    NSInteger tipo = [pGrafica indexOfSelectedItem];

    switch (tipo) {
        case 0:
            [pA setEnabled:YES];
            [pB setEnabled:YES];
            [pC setEnabled:NO];
            [pExponente setEnabled:NO];
            break;
        case 1:
            [pA setEnabled:YES];
            [pB setEnabled:YES];
            [pC setEnabled:NO];
            [pExponente setEnabled:NO];
            break;
        case 2:
            [pA setEnabled:YES];
            [pB setEnabled:NO];
            [pC setEnabled:NO];
            [pExponente setEnabled:YES];
            break;
        case 3:
            [pA setEnabled:YES];
            [pB setEnabled:YES];
            [pC setEnabled:NO];
            [pExponente setEnabled:NO];
            break;
        case 4:
            [pA setEnabled:YES];
            [pB setEnabled:YES];
            [pC setEnabled:YES];
            [pExponente setEnabled:NO];
            break;
        case 5:
            [pA setEnabled:YES];
            [pB setEnabled:YES];
            [pC setEnabled:NO];
            [pExponente setEnabled:NO];
            break;
        default:
            [pA setEnabled:YES];
            [pB setEnabled:YES];
            [pC setEnabled:NO];
            [pExponente setEnabled:NO];
            break;
    }
    
    /*NSNotificationCenter * comboBoxNotification = [NSNotificationCenter defaultCenter];
    [comboBoxNotification postNotificationName:@"ComboBoxDidChangeNotification"
                                        object:self];*/
}

/*-(NSInteger)numberOfItemsInComboBox:(NSComboBox *) comboBox{
    [pGrafica setNumberOfVisibleItems:6];
    return 6;
}*/

-(id)comboBox:(NSComboBox *)comboBox objectValueForItemAtIndex:(NSInteger)index{
    
    return [comboBox itemObjectValueAtIndex:index];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView{
    
    return [arrayGraficas count];
    
}

-(id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
           row:(NSInteger)rowIndex{
    Graphics * g = [arrayGraficas objectAtIndex:rowIndex];
    
    if([[aTableColumn identifier] isEqualToString:@"Name"]){
        return [g name];
    }
    else{
        return nil;
    }
}

-(void)handleUpdateTable:(NSNotification *)aNotificacion{
    
    [pTableR reloadData];
}

-(IBAction)buttonAnniadirPushed:(id)sender{
   
    
    //Cogemos los datos de los campos
    NSString * name = [pName stringValue];
    NSNumber * a = @([[pA stringValue] floatValue]);
    NSNumber * b = @([[pB stringValue] floatValue]);
    NSNumber * c = @([[pC stringValue] floatValue]);
    NSNumber * exponente = @([[pExponente stringValue]floatValue]);
    NSColor * color = [pColor color];
    NSNumber * tipo = @([pGrafica indexOfSelectedItem]);
    NSNumber * x1 = @([[ejeX1 stringValue] floatValue]);
    NSNumber * x2 = @([[ejeX2 stringValue] floatValue]);
    NSNumber * y1 = @([[ejeY1 stringValue] floatValue]);
    NSNumber * y2 = @([[ejeY2 stringValue] floatValue]);
    
    
    
    Graphics * g = [[Graphics alloc] initFromWindow:name
                                             color:color
                                              parA:a
                                              parB:b
                                              parC:c
                                         exponente:exponente
                                               tipo:tipo];
    
    NSDictionary * notificationInfo = [NSDictionary dictionaryWithObjectsAndKeys:g, @"anadirGraf", x1, @"x1", x2, @"x2", y1, @"y1", y2, @"y2", nil];
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    
    [nc postNotificationName:PreferencesDibujaGrafNotification
                      object:self
                    userInfo:notificationInfo];
    
    
}

-(IBAction)parametersSelectedRowView:(id)sender{
    NSInteger indice = [pTableR selectedRow];
    
    if(indice> -1){
        Graphics * graf = [arrayGraficas objectAtIndex:indice];
        
        [pName setStringValue:[graf name]];
        [pExponente setStringValue:[[graf exponente] stringValue]];
        [pA setStringValue:[[graf a] stringValue]];
        [pB setStringValue:[[graf b] stringValue]];
        [pC setStringValue:[[graf c] stringValue]];
        [pColor setColor:[graf color]];
        [pGrafica selectItemAtIndex:[[graf tipo]integerValue]];
    }
}

-(IBAction)buttonBorrarPushed:(id)sender{
    NSInteger indice = [pTableR selectedRow];
    
    if(indice>-1){
        NSDictionary * notificationInfo = [NSDictionary dictionaryWithObject:@(indice)
                                                                      forKey:@"eliminarGraf"];
        NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:PreferencesDibujaGrafNotification
                          object:self
                        userInfo:notificationInfo];
    }
}

-(IBAction)buttonModificarPushed:(id)sender{
    NSInteger indice = [pTableR selectedRow];
    
    
    
    NSString * name = [pName stringValue];
    NSNumber * a = @([[pA stringValue] floatValue]);
    NSNumber * b = @([[pB stringValue] floatValue]);
    NSNumber * c = @([[pC stringValue] floatValue]);
    NSNumber * exponente = @([[pExponente stringValue]floatValue]);
    NSColor * color = [pColor color];
    NSNumber * tipo = @([pGrafica indexOfSelectedItem]);
    NSNumber * x1 = @([[ejeX1 stringValue] floatValue]);
    NSNumber * x2 = @([[ejeX2 stringValue] floatValue]);
    NSNumber * y1 = @([[ejeY1 stringValue] floatValue]);
    NSNumber * y2 = @([[ejeY2 stringValue] floatValue]);
    
    Graphics * g = [[Graphics alloc] initFromWindow:name
                                             color:color
                                              parA:a
                                              parB:b
                                              parC:c
                                         exponente:exponente
                                              tipo:tipo];
    
    NSDictionary * notificationInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(indice),@"modificarGrafIndex",g,@"modificarGraf", x1, @"x1", x2, @"x2", y1, @"y1", y2, @"y2", nil];
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:PreferencesDibujaGrafNotification
                      object:self
                    userInfo:notificationInfo];
    
}

@end
