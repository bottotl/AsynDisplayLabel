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
    for (int i = 0 ; i < 3 ; i ++ ) {
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
    return [[NSAttributedString alloc] initWithString:@"“停经。从十五岁开始的女性特征已经结束了。我没想到这一天会来得这么快，我的身体已经不是女性了吗？你是什么呢？只是吃饱睡、睡饱吃的丑陋怪物吗?\n我终于可以走路了，所以就去便利商店。我买了很多便当和三明治，带回家后在一天之内吃光光，这才知道大快朵颐真是快乐。\n每天睡觉前我还是要依耐酒精，也就是威士忌。人的心情越是不好就越觉得时间过得很快。晚上在杯子里倒满威士忌一饮而下后，我就倒在被窝里，下一次清醒时又是晚上了，然后我又准备要在杯子里倒威士忌。以为现在才十一月，但不知什么时候已经是圣诞节了。等我发现时，昭和时期也已结束，樱花也开了。才刚觉得梅雨季节湿答\n:-D“第二天，当我正打算出去买一瓶新的威士忌时，一只猫从我的前方横越过去，我停下脚步，无法动弹。为什么我会怕猫呢？我自己也无法理解。不只是猫，只要乌鸦一叫，我就会抱着头蹲下来。身后只要有声音，我就会发出尖叫，立刻回到我的房间，将窗帘拉上，在全黑的房间里抱膝坐着。不知不觉间数着自己的心跳，结果心跳越来越快，头发也竖立起来。我觉得心脏要停下来了，我真的是这样认为。我拼命祷告，让心脏继续跳动，如果我没有感觉到心跳，就会担心得要疯掉似的，怎么样也静不下来，然后突然大发雷霆。\n田所，为什么你想非礼我？为什么你要把我赶出学校？\n佐伯，为什么你不保护我？\n 彻也，为什么你不带[…]\n\n停经。从十五岁开始的女性特征已经结束了。我没想到这一天会来得这么快，我的身体已经不是女性了吗？你是什么呢？只是吃饱睡、睡饱吃的丑陋怪物吗?\n我终于可以走路了，所以就去便利商店。我买了很多便当和三明治，带回家后在一天之内吃光光，这才知道大快朵颐真是快乐。\n每天睡觉前我还是要依耐酒精，也就是威士忌。人的心情越是不好就越觉得时间过得很快。晚上在杯子里倒满威士忌一饮而下后，我就倒在被窝里，下一次清醒时又是晚上了，然后我又准备要在杯子里倒威士忌。以为现在才十一月，但不知什么时候已经是圣诞节了。等我发现时，昭和时期也已结束，樱花也开了。才刚觉得梅雨季节湿答\n:-D“" attributes:dic];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 1000;
}

@end
