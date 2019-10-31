
#ifndef CONSTANTS_HEADER
#define CONSTANTS_HEADER

#define ApplicationDelegate                            ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define SCREEN_HEIGHT                                  UIScreen.mainScreen.bounds.size.height
#define SCREEN_WIDTH                                   UIScreen.mainScreen.bounds.size.width

#define kIsiPad                                        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kIsiPhone                                      (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)

#endif
