#import <UIKit/UIKit.h>

@class MasterModel;

@interface MasterViewController : UITableViewController

@property (nonatomic, strong, readonly) MasterModel *model;

@end
