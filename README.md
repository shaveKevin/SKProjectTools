# SKProjectTools
封装一些小工具,方便开发 
新增了底部弹出视图的操作
使用方法：
引入
 
 #import "BottomActionPopview.h"
 #import "BottomActionItem.h"
 然后触发方法中定义需要显示的文字说明
 例如：
 NSMutableArray *arrItems = [[NSMutableArray alloc] initWithCapacity:0];
 
 BottomActionItem *editItem = [[BottomActionItem alloc] init];
 [editItem setTitleColor:[UIColor redColor]];
 [editItem setTitleFont:[UIFont systemFontOfSize:15]];
 [editItem setStringTitle:@"编辑"];
 [arrItems addObject:editItem];
 
 BottomActionItem *rePublishItem = [[BottomActionItem alloc]init];
 [rePublishItem setTitleColor:[UIColor lightGrayColor]];
 [rePublishItem setTitleFont:[UIFont systemFontOfSize:15]];
 [rePublishItem setStringTitle:@"重新发送"];
 [arrItems addObject:rePublishItem];
 // popView即为弹层
 if(_popView)
 {
 _popView = nil;
 }
 if(!_popView) {
 _popView = [[BottomActionPopview alloc] initWithActions:arrItems topHint:nil];
 [_popView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
 }
  [_popView setDelegate:self];
 [_popView show];
 
 然后执行代理方法：
 此处可以用到info 用来传值
 代理方法 此处可以用来执行跳转或者其他操作
 - (void)bottomPopviewDidClicked:(NSInteger)index bottomActionPopview:(BottomActionPopview *)bottomActionPopview {
 NSLog(@"---点击了---%ld",(long)index);
 
 }
 
 


