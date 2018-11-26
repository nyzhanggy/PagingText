

#import "PagingTextView.h"
#import "PagingEngine.h"

@interface PagingTextView() {
    NSArray *_textArray;
}
@property (nonatomic,strong)  UITextView *textView;
@end

@implementation PagingTextView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)handleTap:(UIGestureRecognizer*)tap {
    CGPoint point = [tap locationInView:self];
    if (point.x > CGRectGetWidth(self.frame) * 0.6) {
        [self nextPage];
    } else if(point.x < CGRectGetWidth(self.frame) * 0.3) {
        [self lastPage];
    }

}
- (void)startPanging {
    _textArray = [PagingEngine pagingwithContentString:_contentString contentSize:self.textView.textContainer.size textAttribute:_attributeDict];
}

#pragma mark - --change attribute
- (void)updateAttributeDict:(NSDictionary *)attributeDict {
    _attributeDict = attributeDict;
    NSInteger startCharacterIndex = [self characterIndexWithPageNumber:_currentPage];
    [self startPanging];
    _currentPage = [self pageNumberWithCharacterIndex:startCharacterIndex];
    _textView.attributedText = _textArray[_currentPage];
}

- (NSInteger)characterIndexWithPageNumber:(NSInteger)pageNumber {
    NSInteger startCharacterIndex = 0;
    for (NSInteger index = 0; index < pageNumber; index ++) {
        NSAttributedString *attStr = _textArray[index];
        startCharacterIndex = startCharacterIndex + attStr.string.length;
    }
    return startCharacterIndex;
}
- (NSInteger)pageNumberWithCharacterIndex:(NSInteger)characterIndex {
    
    NSInteger totalCharacternNunmer = 0;
    if (characterIndex == 0) {
        return 0;
    }
    for (NSInteger index = 0; index < _textArray.count; index ++) {
        NSAttributedString *attStr = _textArray[index];
        totalCharacternNunmer = totalCharacternNunmer + attStr.string.length;
        
        if (totalCharacternNunmer - characterIndex > 0 ) {
            return index ;
        }
    }
    return 0;
    
}

#pragma mark - --change page
- (void)setCurrentPage:(NSInteger)currentPage {
    if (_currentPage == currentPage) {
        return;
    }
    _currentPage = currentPage;
    if (_currentPage >= 0 && _currentPage < _textArray.count) {
        _textView.text = _textArray[_currentPage];
    }
}

- (BOOL)nextPage{
    _currentPage ++;
    if (_currentPage < _textArray.count && _currentPage >= 0) {
        _textView.attributedText = _textArray[_currentPage];
        return YES;
    }
    _currentPage = _textArray.count - 1;
    return NO;
}

- (BOOL)lastPage {
    _currentPage --;
    if (_currentPage >= 0 && _currentPage < _textArray.count) {
         _textView.attributedText = _textArray[_currentPage];
        return YES;
    }
    _currentPage = 0;
    return NO;
}

#pragma mark - --settet && getter
- (void)setContentString:(NSString *)contentString {
    _contentString = [contentString copy];
    [self startPanging];
    _textView.attributedText = _textArray[0];
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:self.bounds];
        _textView.editable = NO;
        _textView.selectable = NO;
        _textView.scrollEnabled = NO;
        _textView.textContainerInset = UIEdgeInsetsZero;
        _textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _textView;
}


@end
