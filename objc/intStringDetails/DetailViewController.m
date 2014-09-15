#import "DetailViewController.h"
#import "DetailModel.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)setModel:(DetailModel *)model {
    _model = model;
    self.navigationItem.title = [@"Select " stringByAppendingString:_model.title];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _model.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"option" forIndexPath:indexPath];
    cell.textLabel.text = [_model.options[indexPath.row] description];
    if (_model.selectedOptionIndex == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *priorSelectedCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_model.selectedOptionIndex inSection:0]];
    priorSelectedCell.accessoryType = UITableViewCellAccessoryNone;
    _model.selectedOptionIndex = indexPath.row;
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
}

@end
