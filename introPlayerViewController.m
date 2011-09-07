//
//  introPlayerViewController.m
//  introPlayer
//
//  Created by Oscar Abraham on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "introPlayerViewController.h"

@implementation introPlayerViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSURL *videoUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"intro" ofType:@"m4v"]];
    [self playMovieAtURL:videoUrl];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //comentario de prueba
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void) playMovieAtURL: (NSURL*) theURL {
    
    MPMoviePlayerController* theMovie =
    [[MPMoviePlayerController alloc] initWithContentURL: theURL];
    
    [theMovie.view setFrame: self.view.bounds];  // player's frame must match parent's
    [self.view addSubview: theMovie.view];
    
    theMovie.scalingMode = MPMovieScalingModeAspectFill;
    theMovie.controlStyle = MPMovieControlStyleNone;
    
    // Register for the playback finished notification
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector: @selector(myMovieFinishedCallback:)
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: theMovie];
    
    // Movie playback is asynchronous, so this method returns immediately.
    [theMovie play];
}

// When the movie is done, release the controller.
-(void) myMovieFinishedCallback: (NSNotification*) aNotification
{
    MPMoviePlayerController* theMovie = [aNotification object];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver: self
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: theMovie];
    NSLog(@"terminé");
    // Release the movie instance created in playMovieAtURL:
    [theMovie release];
}

@end
