#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSArray *options;
@property (nonatomic) NSUInteger selectedOptionIndex;

- (instancetype)initWithTitle:(NSString *)title options:(NSArray *)options;

@end
