#import "MasterModel.h"
#import "DetailModel.h"

@implementation MasterModel

- (instancetype)init {
    if (self = [super init]) {
        _details = @[ [self newStringDetailModel], [self newIntDetailModel] ];
    }
    return self;
}

- (DetailModel *)newStringDetailModel {
    NSArray *options = @[ @"Yellow", @"Green", @"Blue", @"Red" ];
    return [[DetailModel alloc] initWithTitle:@"My String" options:options];
}

- (DetailModel *)newIntDetailModel {
    NSArray *options = @[ @8, @16, @32, @64 ];
    return [[DetailModel alloc] initWithTitle:@"My Int" options:options];
}

@end
