#import <Foundation/Foundation.h>

@interface MasterModel : NSObject

/** An array of `DetailModel`. */
@property (nonatomic, strong, readonly) NSArray *details;

@end
