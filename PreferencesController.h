//
//  PreferencesController.h
//  graficas
//
//  Created by Alberto Blazquez on 11/11/18.
//  Copyright © 2018 alumno. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Graphics;



@interface PreferencesController : NSWindowController <NSTableViewDelegate, NSTableViewDataSource>{
    
    NSMutableArray * arrayGraficas;
    IBOutlet NSTextField * pName;
    IBOutlet NSTextField * pA;
    IBOutlet NSTextField * pB;
    IBOutlet NSTextField * pC;
    IBOutlet NSTextField * pExponente;
    IBOutlet NSColorWell * pColor;
    IBOutlet NSComboBox * pGrafica;
    IBOutlet NSTableView * pTableR;
    IBOutlet NSButton * pAnniadir;
    IBOutlet NSButton * pAdd;
    IBOutlet NSButton * pDelete;
    IBOutlet NSButton * pModify;
    IBOutlet NSTextField * ejeX1;
    IBOutlet NSTextField * ejeX2;
    IBOutlet NSTextField * ejeY1;
    IBOutlet NSTextField * ejeY2;
    
}

-(void)windowDidLoad;

-(void)awakeFromNib;

-(void)handleUpdateTable:(NSNotification *)aNotificacion;

-(void)parametersSelectedRowView:(NSNotification* )aNotification;

-(void)disableParameters:(id)sender;

//-(NSInteger)numberOfItemsInComboBox:(NSComboBox *) comboBox;

-(id)comboBox:(NSComboBox *)comboBox
objectValueForItemAtIndex:(NSInteger)index;

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;

- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex;

-(id)initWithArray:(NSMutableArray *) arrayGraficas;

-(IBAction)buttonAnniadirPushed:(id)sender;

-(IBAction)buttonBorrarPushed:(id)sender;

-(IBAction)buttonModificarPushed:(id)sender;


@end


