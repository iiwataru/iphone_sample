//
//  ViewController.m
//  MyImageEdit
//
//  Created by 飯田 亘 on 12/07/01.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize image;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 元画像を保持
    originalImage = self.image.image;
}

- (void)viewDidUnload
{
    [self setImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

/**
 * ボタンアクション
 */
- (IBAction)invertHorizontalButton:(id)sender {
    self.image.transform = CGAffineTransformScale(self.image.transform, -1, 1);
}

- (IBAction)invertVerticalButton:(id)sender {
    self.image.transform = CGAffineTransformScale(self.image.transform, 1, -1);
}

- (IBAction)leftButton:(id)sender {
    self.image.transform = CGAffineTransformRotate(self.image.transform, -90.0f * M_PI / 180.0f);
}

- (IBAction)rightButton:(id)sender {
    self.image.transform = CGAffineTransformRotate(self.image.transform, 90.0f * M_PI / 180.0f);
}

- (IBAction)originalButtln:(id)sender {
    self.image.image = originalImage;
    self.image.transform = CGAffineTransformIdentity;
}

- (IBAction)monotoneButton:(id)sender {
    self.image.image = [self grayscale:self.image.image type:1];
}

- (IBAction)sepiaButton:(id)sender {
    self.image.image = [self grayscale:self.image.image type:2];
}

- (IBAction)invertColorButton:(id)sender {
    self.image.image = [self grayscale:self.image.image type:3];
}

/**
 * 色調変換
 * http://blog.livedoor.jp/techblog/archives/65454070.html
 */
- (UIImage*) grayscale:(UIImage*)anImage type:(char)type {
    CGImageRef  imageRef;
    imageRef = anImage.CGImage;

    size_t width  = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);

    // ピクセルを構成するRGB各要素が何ビットで構成されている
    size_t                  bitsPerComponent;
    bitsPerComponent = CGImageGetBitsPerComponent(imageRef);

    // ピクセル全体は何ビットで構成されているか
    size_t                  bitsPerPixel;
    bitsPerPixel = CGImageGetBitsPerPixel(imageRef);

    // 画像の横1ライン分のデータが、何バイトで構成されているか
    size_t                  bytesPerRow;
    bytesPerRow = CGImageGetBytesPerRow(imageRef);

    // 画像の色空間
    CGColorSpaceRef         colorSpace;
    colorSpace = CGImageGetColorSpace(imageRef);

    // 画像のBitmap情報
    CGBitmapInfo            bitmapInfo;
    bitmapInfo = CGImageGetBitmapInfo(imageRef);

    // 画像がピクセル間の補完をしているか
    bool                    shouldInterpolate;
    shouldInterpolate = CGImageGetShouldInterpolate(imageRef);

    // 表示装置によって補正をしているか
    CGColorRenderingIntent  intent;
    intent = CGImageGetRenderingIntent(imageRef);

    // 画像のデータプロバイダを取得する
    CGDataProviderRef   dataProvider;
    dataProvider = CGImageGetDataProvider(imageRef);

    // データプロバイダから画像のbitmap生データ取得
    CFDataRef   data;
    UInt8*      buffer;
    data = CGDataProviderCopyData(dataProvider);
    buffer = (UInt8*)CFDataGetBytePtr(data);

    // 1ピクセルずつ画像を処理
    NSUInteger  x, y;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8*  tmp;
            tmp = buffer + y * bytesPerRow + x * 4; // RGBAの4つ値をもっているので、1ピクセルごとに*4してずらす
        
            // RGB値を取得
            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            
            UInt8 brightness;
            
            switch (type) {
                case 1://モノクロ
                    // 輝度計算
                    brightness = (77 * red + 28 * green + 151 * blue) / 256;
                    
                    *(tmp + 0) = brightness;
                    *(tmp + 1) = brightness;
                    *(tmp + 2) = brightness;
                    break;
                    
                case 2://セピア
                    *(tmp + 0) = red;
                    *(tmp + 1) = green * 0.7;
                    *(tmp + 2) = blue * 0.4;
                    break;
                    
                case 3://色反転
                    *(tmp + 0) = 255 - red;
                    *(tmp + 1) = 255 - green;
                    *(tmp + 2) = 255 - blue;
                    break;
                    
                default:
                    *(tmp + 0) = red;
                    *(tmp + 1) = green;
                    *(tmp + 2) = blue;
                    break;
            }
        
        }
    }

    // 効果を与えたデータ生成
    CFDataRef   effectedData;
    effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(data));

    // 効果を与えたデータプロバイダを生成
    CGDataProviderRef   effectedDataProvider;
    effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);

    // 画像を生成
    CGImageRef  effectedCgImage;
    UIImage*    effectedImage;
    effectedCgImage = CGImageCreate(
                                width, height,
                                bitsPerComponent, bitsPerPixel, bytesPerRow,
                                colorSpace, bitmapInfo, effectedDataProvider,
                                NULL, shouldInterpolate, intent);
    effectedImage = [[UIImage alloc] initWithCGImage:effectedCgImage];

    // データの解放
    CGImageRelease(effectedCgImage);
    CFRelease(effectedDataProvider);
    CFRelease(effectedData);
    CFRelease(data);

    return effectedImage;
}

@end
