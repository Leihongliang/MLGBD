//
//  AwkardTableViewCell.m
//  
//
//  Created by qianfeng007 on 15/12/1.
//
//

#import "AwkardTableViewCell.h"
#import <UIImageView+WebCache.h>
@implementation AwkardTableViewCell {
    
    UIImageView *_userImageView;
    UILabel *_userName;
    UILabel *_contentLabel;
    UIButton *_zanView;
    UIImageView *_zanImage;
    UILabel *_zanLabel;
    UIButton *_caiView;
    UIImageView *_caiImage;
    UILabel *_caiLabel;
    UIButton *_talkView;
    UIImageView *_talkImage;
    UILabel *_talkLabel;
    UIButton *_iconMark;
    UIImageView *_backgroundCenter;
    UIImageView *_backgroundFoot;
    NSURL *_url;
    NSURL *_url1;
    CGSize imageSize;
    UIImageView *_imageView;
    ItemsModel *_itemsModel;
}

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self customViews];
        
    }
    
    return self;
}
- (NSURL *)iconIMGFromMode:(ItemsModel *)mode {
    
#define PICURL  @"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@"//用户头像
    
    //mode.user.id   这里是user对应字典中的id
    NSInteger a = [mode.userID intValue];
    
    NSString *idAll = [NSString stringWithFormat:@"%ld", a];
    
    NSString *picId = [idAll substringToIndex:4];
    
    NSString *iconUrl = [NSString stringWithFormat:PICURL, picId, idAll, mode.userIcon];
    
    return [NSURL URLWithString:iconUrl];
}
- (NSURL *)bigIMGFromMode:(ItemsModel *)mode {
    
#define BIGPIC  @"http://pic.qiushibaike.com/system/pictures/%@/%@/medium/%@"
    
    //mode.id    这里是items里边数组元素中的外层id
    NSInteger a = [mode.itemID intValue];
    
    NSString *idAll = [NSString stringWithFormat:@"%ld", a];
    
    NSString *picId = [idAll substringToIndex:5];
    
    NSString *bigUrl = [NSString stringWithFormat:BIGPIC, picId, idAll, mode.image];
    
    return [NSURL URLWithString:bigUrl];
}
- (void)customViews {
    
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
//    _userImageView = [[UIImageView alloc] init];
    _userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumb_avatar"]];
       
    _imageView =[[UIImageView alloc] init];
    _userName = [[UILabel alloc] init];
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.numberOfLines = 0;
    _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    _iconMark = [[UIButton alloc] init];
    [_iconMark setImage:[UIImage imageNamed:@"icon_tag"] forState:UIControlStateNormal];
    //赞
    _zanView = [[UIButton alloc] init];
    [_zanView setImage:[[UIImage imageNamed:@"button_vote"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [_zanView setImage:[UIImage imageNamed:@"button_vote_active"] forState:UIControlStateHighlighted];
    _zanImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_for_good"]];
    _zanLabel = [[UILabel alloc] init];
    //踩
    _caiView = [[UIButton alloc] init];
    [_caiView setImage:[[UIImage imageNamed:@"button_vote"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [_caiView setImage:[UIImage imageNamed:@"button_vote_active"] forState:UIControlStateHighlighted];
    _caiImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_for_bad"]];
    _caiLabel = [[UILabel alloc] init];
    //评论
    _talkView = [[UIButton alloc] init];
    [_talkView setImage:[[UIImage imageNamed:@"button_vote"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [_talkView setImage:[UIImage imageNamed:@"button_vote_active"] forState:UIControlStateHighlighted];
    _talkImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_for_comment"]];
    _caiLabel = [[UILabel alloc] init];
    _talkLabel = [[UILabel alloc] init];
    
    _backgroundCenter = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"block_center_background"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]];
    _backgroundCenter.userInteractionEnabled = YES;
    _backgroundCenter.alpha = 0.8;
    _backgroundFoot = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"block_background"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]];
    _backgroundFoot.alpha = 0.8;
    
    
    [_backgroundCenter addSubview:_imageView];
    [_backgroundCenter addSubview:_userImageView];
    [_backgroundCenter addSubview:_userName];
    [_backgroundCenter addSubview:_contentLabel];
    [_backgroundCenter addSubview:_iconMark];
    [_zanView addSubview:_zanLabel];
    [_zanView addSubview:_zanImage];
    [_backgroundCenter addSubview:_zanView];
    [_caiView addSubview:_caiLabel];
    [_caiView addSubview:_caiImage];
    [_backgroundCenter addSubview:_caiView];
    [_talkView addSubview:_talkLabel];
    [_talkView addSubview:_talkImage];
    [_backgroundCenter addSubview:_talkView];
    [self.contentView addSubview:_backgroundCenter];
    [self.contentView addSubview:_backgroundFoot];
}



- (void)layoutSubviews {
    
   
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    
  
    _backgroundCenter.frame = CGRectMake(5, 0, width-10, 100);
    _userImageView.frame = CGRectMake(10, 10, width/10, width/10);
    if (_itemsModel.userIcon) {
        _url = [self iconIMGFromMode:_itemsModel];
        [_userImageView sd_setImageWithURL:_url placeholderImage:nil];
    }
   
    _userName.frame = CGRectMake(CGRectGetMaxX(_userImageView.frame)+10, 10, width/2, CGRectGetHeight(_userImageView.frame));
    _contentLabel.frame = CGRectMake(10, CGRectGetMaxY(_userImageView.frame)+20, width - 20, 100);
    
    CGSize size = [_contentLabel sizeThatFits:CGSizeMake(_contentLabel.frame.size.width, MAXFLOAT)];
    _contentLabel.frame = CGRectMake(10, CGRectGetMaxY(_userImageView.frame)+20, width - 20, size.height);
   
        if (_itemsModel.image_size) {
            _url1 = [self bigIMGFromMode:_itemsModel];
            CGFloat imageWidth = [_itemsModel.image_size.s[0] floatValue];
            CGFloat imageHeight = [_itemsModel.image_size.s[1] floatValue];
            [_imageView sd_setImageWithURL:_url1 placeholderImage:nil];
            imageSize = CGSizeMake(imageWidth, imageHeight);
        } else {
            imageSize = CGSizeZero;
        }

    _imageView.frame = CGRectMake(20, CGRectGetMaxY(_contentLabel.frame)+10, imageSize.width , imageSize.height);
    
    _iconMark.frame = CGRectMake(10, CGRectGetMaxY(_imageView.frame) + 10, 24, 24);
    _zanView.frame = CGRectMake(10, CGRectGetMaxY(_iconMark.frame)+10, width/5, 30);
    _zanImage.frame = CGRectMake(0, 0, CGRectGetHeight(_zanView.frame), CGRectGetHeight(_zanView.frame));
    _zanLabel.frame = CGRectMake(CGRectGetWidth(_zanView.frame)-30, 0, CGRectGetHeight(_zanView.frame),  30);
    
    _caiView.frame = CGRectMake(CGRectGetMaxX(_zanView.frame) + 20, CGRectGetMaxY(_iconMark.frame)+10, width/5, 30);
    _caiImage.frame = CGRectMake(0, 0, CGRectGetHeight(_zanView.frame), CGRectGetHeight(_zanView.frame));
    _caiLabel.frame = CGRectMake(CGRectGetWidth(_zanView.frame)-30, 0, CGRectGetHeight(_zanView.frame),  30);
    
    _talkView.frame = CGRectMake(CGRectGetMaxX(_caiView.frame) + 20, CGRectGetMaxY(_iconMark.frame)+10, width/5, 30);
    _talkImage.frame = CGRectMake(0, 0, CGRectGetHeight(_zanView.frame), CGRectGetHeight(_zanView.frame));
    _talkLabel.frame = CGRectMake(CGRectGetWidth(_zanView.frame)-30, 0, CGRectGetHeight(_zanView.frame),  30);
    _backgroundCenter.frame = CGRectMake(5, 0, width-10, CGRectGetMaxY(_zanView.frame));
    _backgroundFoot.frame = CGRectMake(5, CGRectGetMaxY(_backgroundCenter.frame)-10, width - 10, 30);
    
    _cellHeight = CGRectGetMaxY(_backgroundFoot.frame);
    
}
- (void)initWithDataWith:(ItemsModel *)model {
    

    _userName.text = model.userLogin;
    _contentLabel.text = model.content;
    _zanLabel.text = model.votesUp;
    _caiLabel.text = model.votesDown;
    _talkLabel.text = model.comments_count;
    _itemsModel = model;
    
    [self layoutSubviews];

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
