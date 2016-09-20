### SZAdvertiseView

App广告页，带有倒计时效果，默认倒计时效果是3s，可以在源文件中修改。

<img href="https://github.com/SZ8023/SZAdvertiseView/blob/master/screenshot/advertiseView.png" width=275px height=400px>

### 使用方式

需要给广告图片和广告logo赋值，可以设置跳转到的页面标识符。

```objc	
SZAdvertiseView *szAdvView = [[SZAdvertiseView alloc] initWithFrame:self.view.bounds];
  
szAdvView.delegate = self;

szAdvView.advertiseImage = [UIImage imageNamed:@"shiyu_advertise"];

szAdvView.logoImage = [UIImage imageNamed:@"shiyu_logo"];

szAdvView.advertiseType = @"http://baike.baidu.com/link?url=3p-5kcHcjuvsMtl1vdTvbpra76FkATeJsmvh5s1n4mUMEuG31UcbDK3ivF1QfFuvQSh0-S8QKHcxhYENDS3FZq";

szAdvView.logoType = @"https://www.baidu.com/link?url=rNf4tFHVJREsx6jH7_jNLo41xmy618rnB3Lwl9D7IAAZqSZW-KzivL2ACZnOc77hu2N-7Hy_No7plO3M66LaPK&wd=&eqid=96c8c0cd00011fe60000000557e0b181";

[self.view addSubview:szAdvView];    
   ```
    
实现对应的代理方法，在代理方法中添加后续操作。

```objc
@protocol SZAdvertiseViewDelegate <NSObject>

- (void)advertiseClick:(NSString *)advType;

- (void)logoClick:(NSString *)logoType;

- (void)countDownClick;

@end	
```
	
### 说明

当倒计时完成和点击倒计时按钮所触发的事件是同一个事件。可以在代理方法`- (void)countDownClick`中实现。
	

