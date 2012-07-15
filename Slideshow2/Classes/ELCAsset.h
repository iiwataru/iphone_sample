//
//  Asset.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface ELCAsset : UIView {
	ALAsset *asset;
	UIImageView *overlayView;
	BOOL selected;
	id __unsafe_unretained parent;
}

@property (nonatomic) ALAsset *asset;
@property (nonatomic, unsafe_unretained) id parent;

-(id)initWithAsset:(ALAsset*)_asset;
-(BOOL)selected;

@end