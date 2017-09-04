//
//  JFTTableViewController.m
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/8/24.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import "JFTTableViewController.h"
#import "JFTAsyncTextLabel.h"

@interface JFTCell : UITableViewCell
@property (nonatomic, strong) JFTAsyncTextLabel *ayncLabel;
@end

@implementation JFTCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _ayncLabel = [JFTAsyncTextLabel new];
        [self.contentView addSubview:_ayncLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.ayncLabel.frame = self.contentView.bounds;
}
@end

@interface JFTTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation JFTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = @[].mutableCopy;
    for (int i = 0 ; i < 2 ; i ++ ) {
        [self.dataSource addObject:[self creaAttributeString]];
    }
    [self.tableView registerClass:[JFTCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JFTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.ayncLabel.attributeString = self.dataSource[indexPath.row];
    
    return cell;
}

- (NSAttributedString *)creaAttributeString {
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:16.f]};
    return [[NSAttributedString alloc] initWithString:@"可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看可劲儿获得快乐健身房空间里还打算安防监控拉哈拉快好了反馈会埃里克凤凰卡两句话唠嗑会看" attributes:dic];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 1000;
}

@end
