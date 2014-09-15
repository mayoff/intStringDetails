#import "MasterCell.h"
#import "DetailModel.h"

@implementation MasterCell

- (void)setModel:(DetailModel *)model {
    [self disconnectFromModel];
    _model = model;
    [self connectToModel];
    [self update];
}

- (void)update {
    if (self.model != nil) {
        self.textLabel.text = self.model.title;
        self.detailTextLabel.text = [self.model.options[self.model.selectedOptionIndex] description];
    }
}

static char kSelectedOptionIndexContext;

- (void)disconnectFromModel {
    [self.model removeObserver:self forKeyPath:@"selectedOptionIndex" context:&kSelectedOptionIndexContext];
}

- (void)connectToModel {
    [self.model addObserver:self forKeyPath:@"selectedOptionIndex" options:0 context:&kSelectedOptionIndexContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == &kSelectedOptionIndexContext) {
        [self update];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    [self disconnectFromModel];
}

@end
