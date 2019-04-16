//
//  AppDelegate.m
//  test
//
//  A quick hacked together test to confirm an answer for Stack Overflow question:
//		https://stackoverflow.com/questions/53064744/how-to-get-all-possible-screen-resolutions-in-cocoa/53161200
//
//

#import "AppDelegate.h"
#import <CoreFoundation/CoreFoundation.h>
@import CoreGraphics;
//#import <CoreGraphics/CGDirectDisplay.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application

	CGDirectDisplayID activeDisplays[10];
	uint32_t displayCount = 0;

	CGError err = CGGetActiveDisplayList( 10, activeDisplays, &displayCount );
	if ( err != 0 ) {
		NSLog(@"error from CGGetActiveDisplayList!: %d", err );
		return;
	}

	for ( int displayIdx = 0; displayIdx < displayCount; displayIdx++ ) {

		CGDirectDisplayID displayID = activeDisplays[displayIdx];
		bool builtin = CGDisplayIsBuiltin( displayID );
		bool ismain = CGDisplayIsMain( displayID );
		uint32_t unitnumber = CGDisplayUnitNumber( displayID );

		NSLog(@"\nDisplay %u: %@, %@", unitnumber, builtin ? @"builtin" : @"external", ismain ? @"main" : @"" );

		CFStringRef keys[1] = { kCGDisplayShowDuplicateLowResolutionModes };
		CFBooleanRef values[1] = { kCFBooleanTrue };

		CFDictionaryRef options = CFDictionaryCreate(kCFAllocatorDefault, (const void**) keys, (const void**) values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks );

		CFArrayRef modesArray = CGDisplayCopyAllDisplayModes( displayID, NULL );

		// NSLog( @"Modes:  %@", modesArray );

		for ( int i = 0; i < CFArrayGetCount( modesArray ); i++ ) {
			size_t width = 0;
			size_t height = 0;
			bool okForDesktopGUI = false;
			int32_t theIOModeID = 0;

			CGDisplayModeRef displayMode = (CGDisplayModeRef) CFArrayGetValueAtIndex( modesArray, i );
			if ( CFGetTypeID( displayMode ) == CGDisplayModeGetTypeID() ) {
				width = CGDisplayModeGetWidth( displayMode );
				height = CGDisplayModeGetHeight( displayMode );
				okForDesktopGUI = CGDisplayModeIsUsableForDesktopGUI( displayMode );
				theIOModeID = CGDisplayModeGetIODisplayModeID( displayMode );
				size_t pixelWidth = CGDisplayModeGetPixelWidth( displayMode );
				size_t pixelHeight = CGDisplayModeGetPixelHeight( displayMode );

	//			NSLog(@"Display mode id: %d, DesktopGUIok: %@, width: %ld, height: %ld", theIOModeID, okForDesktopGUI ? @"YES" : @"NO", width, height );
				if ( okForDesktopGUI )
					NSLog(@"points: (%ld x %ld), pixels: (%ld, %ld)", width, height, pixelWidth, pixelHeight );
			}
			else {
				NSLog( @"Array contents don't seem to be CGDisplayModeRefs…  aborting.  ");
				break;
			}
		}
		CFRelease( options );
		CFRelease( modesArray );
	}
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}


@end
