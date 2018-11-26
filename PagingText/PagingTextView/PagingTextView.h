

#import <UIKit/UIKit.h>

@interface PagingTextView : UIView
@property (nonatomic,strong) NSDictionary *attributeDict;
@property (nonatomic,copy) NSString *contentString;
@property (nonatomic,assign) NSInteger currentPage;
- (void)updateAttributeDict:(NSDictionary *)attributeDict;
- (BOOL)nextPage;
- (BOOL)lastPage;
@end
