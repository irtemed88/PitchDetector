//
//  KeyHelper.m
//  SafeSound
//
//  Created by Demetri Miller on 10/22/2010.
//  Copyright 2010 Demetri Miller. All rights reserved.
//

#import "KeyHelper.h"

@implementation KeyHelper

@synthesize keyMapping;
@synthesize frequencyMapping;

- (void)buildKeyMapping {
	self.keyMapping = [[NSMutableDictionary alloc] initWithCapacity:9];
	[keyMapping setObject:[NSNumber numberWithFloat:466.7] forKey:@"c"];
	[keyMapping setObject:[NSNumber numberWithFloat:494.4] forKey:@"d"];
	[keyMapping setObject:[NSNumber numberWithFloat:523.8] forKey:@"e"];
	[keyMapping setObject:[NSNumber numberWithFloat:415.8] forKey:@"a"];
	[keyMapping setObject:[NSNumber numberWithFloat:440.5] forKey:@"b"];
	
	self.frequencyMapping = [[NSMutableDictionary alloc] initWithCapacity:9];
	[frequencyMapping setObject:@"c" forKey:[NSNumber numberWithFloat:466.7]];
	[frequencyMapping setObject:@"d" forKey:[NSNumber numberWithFloat:494.4]];
	[frequencyMapping setObject:@"e" forKey:[NSNumber numberWithFloat:523.8]];
	[frequencyMapping setObject:@"a" forKey:[NSNumber numberWithFloat:415.8]];
	[frequencyMapping setObject:@"b" forKey:[NSNumber numberWithFloat:440.5]];
}

// Gets the character closest to the frequency passed in. 
- (NSString *)closestCharForFrequency:(float)frequency {
	NSString *closestKey = nil;
	float closestFloat = MAXFLOAT;	// Init to largest float value so all ranges closer.
	
	// Check each values distance to the actual frequency.
	for(NSNumber *num in [keyMapping allValues]) {
		float mappedFreq = [num floatValue];
		float tempVal = fabsf(mappedFreq-frequency);
		if (tempVal < closestFloat) {
			closestFloat = tempVal;
			closestKey = [frequencyMapping objectForKey:num];
		}
	}
	
	return closestKey;
}


static KeyHelper *sharedInstance = nil;

#pragma mark -
#pragma mark Singleton Methods
+ (KeyHelper *)sharedInstance
{
	if (sharedInstance == nil) {
		sharedInstance = [[KeyHelper alloc] init];
		[sharedInstance buildKeyMapping];
	}
	
	return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  // denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

@end
