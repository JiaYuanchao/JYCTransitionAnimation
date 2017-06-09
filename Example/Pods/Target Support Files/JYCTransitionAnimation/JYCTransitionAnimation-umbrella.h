#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "JYCBasicAnimation.h"
#import "JYCMagicAnimation.h"
#import "JYCModalAnimation.h"
#import "JYCSpressAnimation.h"
#import "JYCTransitionAnimationManager.h"

FOUNDATION_EXPORT double JYCTransitionAnimationVersionNumber;
FOUNDATION_EXPORT const unsigned char JYCTransitionAnimationVersionString[];

