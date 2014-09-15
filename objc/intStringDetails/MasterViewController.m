#import "MasterViewController.h"
#import "MasterModel.h"
#import "MasterCell.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];

    _model = [[MasterModel alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _model.details.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MasterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detail" forIndexPath:indexPath];
    cell.model = _model.details[indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        [self prepareForShowDetailSegue:segue sender:sender];
    }
}

- (void)prepareForShowDetailSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *destination = segue.destinationViewController;
    MasterCell *cell = sender;
    destination.model = cell.model;
}

@end
