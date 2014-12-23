//
//  GameHistoryViewController.m
//  stanford1
//
//  Created by Julie Huguet on 13/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "GameHistoryViewController.h"

@interface GameHistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

@implementation GameHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setHistoryToShow:(NSMutableArray *)historyToShow
{
    _historyToShow = historyToShow;
    if (self.view.window)[self updateUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateUI];
}

- (void) updateUI
{
   // NSMutableString *tempHist = [[NSMutableString alloc]init];
    //for(int i = 0;i<self.historyToShow.count;i++){
      // [tempHist stringByAppendingFormat:@"%@",];
   // }
    //NSLog(@"%@", tempHist);
    self.historyTextView.text = [self.historyToShow componentsJoinedByString:@"\n" ];
    //self.historyTextView.text = @"blablablé";

}

/*
- (NSString *) createTextViewString:(NSString *)histo
{
    NSMutableString *tempHisto = [[NSMutableString alloc]init];
    
    
    NSString *toReturn = tempHisto;
    return toReturn;
}
*/
 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
