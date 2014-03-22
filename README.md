## ALAnimationView

*ALAnimationView* is a custom *UIView* subclass that lets you create animations out of a sequence of *UIImages*. It extends the default functionality of the *UIImageView* class' default image animation support in the sense that it allows you to start, stop and rewind your animation, at any point. It gives you access to the current animation frame and lets you define if the animation should repeat (loop) or not. 

You can also react to animation events (such as hitting a certain frame, rewinding, starting to play, etc) through a series of delegate methods. Finally, the class includes a convenience method to make it easier to populate the list of *UIImages* it takes as frames.

Find out how to use the class in the documentation below:

#### Installation:

To use this class in your project, all you need to do is copy the files ALAnimationView.h and ALAnimationView.m. If you are using *Cocoapods* t is recommended that you add the 'ALAnimationView' pod into your Podfile. 


#### Using the class:

Using the ALAnimationView class is very simple:

*Initializing*



In the example below, imagine that *animationImages* is a NSArray that contains a sequence of *UIImages*:

```objective-c
ALAnimationView *animationView = [[ALAnimationView alloc] initWithFrame:CGRectMake(0.0, 0.0, 60.0, 60.0)
                                                        animationImages:animationImages
                                                      animationDuration:1.0
                                                                repeats:YES];
```

*Convenience method*

The ALAnimationView includes convenience methods for easily populating the array of *UIImages* you will use in your animations, assuming you are using standard name conventions. To use the method, keep these elements in mind - *image name* is the prefix of the images. *Number of frames* indicates how many images are there in your animation - name your files starting with the number 1. Finaly, *number of zeroes* indicates the suffix number format - for example, the image for the first frame of a sequence that has 3 zeroes would end "001".

Below is an example of how the method works:
    
```objective-c
//- The method:
NSArray *animationImages = [ALAnimationView animationImagesArrayWithName:@"Bird" numberOfFrames:10 numberOfZeroes:3];

//- is equivalent to:
NSArray *animationImages = @[
                             [UIImage imageNamed:@"Bird001"],
                             [UIImage imageNamed:@"Bird002"],
                             [UIImage imageNamed:@"Bird003"],
                             [UIImage imageNamed:@"Bird004"],
                             [UIImage imageNamed:@"Bird005"],
                             [UIImage imageNamed:@"Bird006"],
                             [UIImage imageNamed:@"Bird007"],
                             [UIImage imageNamed:@"Bird008"],
                             [UIImage imageNamed:@"Bird009"],
                             [UIImage imageNamed:@"Bird010"]
                            ];
```


*Controlling the animation*

Controlling the animation is pretty straight forward: 
    
```objective-c
[animationView play];   //<- starts the animation;
[animationView stop];   //<- stops (pauses) the animation;
[animationView rewind]; //<- rewinds the animation;
```
    
To check current frame, simply use:
    
    animationView.currentFrame;
    
*Deletage methods*

Finally, if you want your application to react to *UIAnimatioView*'s events, all you have to do is set a delegate that conforms to the *ALAnimationViewDelegate* protocol. The protocol has the following optional methods:

```objective-c
-(void)animationViewDidStartPlaying:(ALAnimationView *)animationView;
-(void)animationViewDidStopPlaying:(ALAnimationView *)animationView;
-(void)animationViewDidRewind:(ALAnimationView *)animationView;
-(void)animationView:(ALAnimationView *)animationView didGoToFrame:(NSInteger)frameNumber;
```
    
To see the class in action, download this project. It includes an application you can run on the iPhone simulator or a device that has sample code.

Hope you find this helpful!

####License

This component is available under MIT license.