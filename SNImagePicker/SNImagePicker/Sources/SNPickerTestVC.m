//
//  SNPickerTestVC.m
//  SNImagePicker
//
//  Created by Narek Safaryan on 2/23/14.
//  Copyright (c) 2014 X-TECH creative studio. All rights reserved.
//

#import "SNPickerTestVC.h"
#import "SNImagePickerNC.h"
#import "SNAppDelegate.h"

@interface SNPickerTestVC () <SNImagePickerDelegate>

@property (strong, nonatomic) SNImagePickerNC *imagePickerNavigationController;

@end

@implementation SNPickerTestVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)openSNImagePickerWithPickerType:(SNPickerType)pickerType
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SNPicker" bundle:nil];
    self.imagePickerNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"ImagePickerNC"];
    [self.imagePickerNavigationController setModalPresentationStyle:UIModalPresentationFullScreen];
    self.imagePickerNavigationController.imagePickerDelegate = self;
    self.imagePickerNavigationController.pickerType = pickerType;
    [self presentViewController:self.imagePickerNavigationController animated:YES completion:^{ }];
}

#pragma mark - Actions

- (IBAction)didClickPickPhoto:(id)sender {
    [self openSNImagePickerWithPickerType:kPickerTypePhoto];
}

- (IBAction)didClickPickVideo:(id)sender {
    [self openSNImagePickerWithPickerType:kPickerTypeMovie];
}

#pragma mark - SNImagePickerDelegate

- (void)imagePicker:(SNImagePickerNC *)imagePicker didFinishPickingWithMediaInfo:(NSMutableArray *)info
{
    /*
     If you Pick a photos you can get images like this
    for (int i = 0; i < info.count; i++) {
        ALAssetsLibrary *assetLibrary=[[ALAssetsLibrary alloc] init];
        [assetLibrary assetForURL:info[i] resultBlock:^(ALAsset *asset) {
            UIImage *image = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]];
        } failureBlock:^(NSError *error) {     }];
    }
     
    If you Pick a movie you can get an asset url like this and do something with asset
     NSURL *url = [asset valueForProperty:ALAssetPropertyAssetURL];
     */
}

- (void)imagePickerDidCancel:(SNImagePickerNC *)imagePicker
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
