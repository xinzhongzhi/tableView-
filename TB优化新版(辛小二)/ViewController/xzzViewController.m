//
//  xzzViewController.m
//  TB优化新版(辛小二)
//
//  Created by 辛忠志 on 2017/9/11.
//  Copyright © 2017年 TB优化新版(辛小二). All rights reserved.
//
#pragma mark - ------------------- XIB --------------------
#define HRXIB(Class) [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([Class class]) owner:nil options:nil] firstObject];

#import "xzzViewController.h"
#pragma mark ----------------------- 框架 -----------------------
#import "UITableView+FDTemplateLayoutCell.h"
#pragma mark ----------------------- Model类型 -----------------------
#import "xzzModel.h"
#pragma mark ----------------------- View类型 -----------------------
//#import "xxeTableViewCell.h"
#import "xzzTableViewCell.h"
@interface xzzViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, copy) NSArray *prototypeEntitiesFromJSON;//
@property (nonatomic, strong) NSMutableArray *feedEntitySections; // 2级数组
@end

@implementation xzzViewController
#pragma mark - ---------- Lazy Loading（懒加载） ----------

#pragma mark - ----------   Lifecycle（生命周期） ----------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 在表格视图中注册表格单元并设置可复用标识
    [self.mainTableView registerNib:[UINib nibWithNibName:@"xzzTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"xzzTableViewCell"]; // 从xib文件中加载
    self.mainTableView.fd_debugLogEnabled = YES;
    
    [self buildTestDataThen:^{
        self.feedEntitySections = @[].mutableCopy;
        NSLog(@"%@",self.feedEntitySections);
        [self.feedEntitySections addObject:self.prototypeEntitiesFromJSON.mutableCopy];
        NSLog(@"%@",self.feedEntitySections);
        [self.mainTableView reloadData];
    }];
}
- (void)buildTestDataThen:(void (^)(void))then {
    // Simulate an async request
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // Data from `data.json`
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSLog(@"%@",dataFilePath);
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSLog(@"%@",data);
        /*json转model*/
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",rootDict);
        NSArray *feedDicts = rootDict[@"feed"];
        NSLog(@"%@",feedDicts);
        // Convert to `FDFeedEntity`
        NSMutableArray *entities = @[].mutableCopy;
        
        [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [entities addObject:[[xzzModel alloc] initWithDictionary:obj]];
        }];
        self.prototypeEntitiesFromJSON = entities;
        NSLog(@"%@",self.prototypeEntitiesFromJSON);
        
        // Callback
        dispatch_async(dispatch_get_main_queue(), ^{
            !then ?: then();
        });
    });
}

#pragma mark - ---------- Private Methods（私有方法） ----------

#pragma mark initliaze data(初始化数据)

#pragma mark config control（布局控件）

#pragma mark networkRequest (网络请求)

#pragma mark actions （点击事件）

#pragma mark IBActions （点击事件xib）

#pragma mark - ---------- Public Methods（公有方法） ----------

#pragma mark self declare （本类声明）

#pragma mark override super （重写父类）

#pragma mark setter （重写set方法）

#pragma mark - ---------- Protocol Methods（代理方法） ----------
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%ld",self.feedEntitySections.count);
    return self.feedEntitySections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feedEntitySections[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    xzzTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xzzTableViewCell"];
    /* 去掉cell点击阴影**/
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(xzzTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = YES; // Enable to use "-sizeThatFits:"
//    if (indexPath.row % 2 == 0) {
//        //cell的右边有一个小箭头，距离右边有十几像素；
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    } else {
//        //cell右边的形状是对号；
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
    /*赋值*/
    cell.entity = self.feedEntitySections[indexPath.section][indexPath.row];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:@"xzzTableViewCell" cacheByIndexPath:indexPath configuration:^(xzzTableViewCell *cell) {
        [self configureCell:cell atIndexPath:indexPath];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
