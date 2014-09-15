#import "DetailModel.h"

@implementation DetailModel

- (instancetype)initWithTitle:(NSString *)title options:(NSArray *)options {
    if (self = [super init]) {
        _title = [title copy];
        _options = [options copy];
    }
    return self;
}

@end
