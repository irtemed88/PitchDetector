//
//  ListenerViewController.h
//  SafeSound
//
//  Created by Demetri Miller on 10/25/10.
//  Copyright 2010 Demetri Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RIOInterface;

@interface ListenerViewController : UIViewController {
	IBOutlet UILabel *currentPitchLabel;
	IBOutlet UIButton *listenButton;
	
	BOOL isListening;
	RIOInterface *rioRef;
	
	NSMutableString *key;
	float currentFrequency;
	NSString *prevChar;
}

@property(nonatomic, retain) UILabel *currentPitchLabel;
@property(nonatomic, retain) UIButton *listenButton;
@property(nonatomic, retain) NSMutableString *key;
@property(nonatomic, retain) NSString *prevChar;
@property(nonatomic, assign) RIOInterface *rioRef;
@property(nonatomic, assign) float currentFrequency;
@property(assign) BOOL isListening;


#pragma mark Listener Controls
- (IBAction)toggleListening:(id)sender;
- (void)startListener;
- (void)stopListener;

- (void)frequencyChangedWithValue:(float)newFrequency;
- (void)updateFrequencyLabel;

@end
