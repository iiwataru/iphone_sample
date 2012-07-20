//
//  AssetTablePicker.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ELCAssetTablePicker : UITableViewController
{
	ALAssetsGroup *__weak assetGroup;
	
	NSMutableArray *elcAssets;
	int selectedAssets;
	
	id __unsafe_unretained parent;
	
	NSOperationQueue *queue;
}

@property (nonatomic, unsafe_unretained) id parent;
@property (nonatomic, weak) ALAssetsGroup *assetGroup;
@property (nonatomic) NSMutableArray *elcAssets;
@property (nonatomic) IBOutlet UILabel *selectedAssetsLabel;

-(int)totalSelectedAssets;
-(void)preparePhotos;

-(void)doneAction:(id)sender;

@end