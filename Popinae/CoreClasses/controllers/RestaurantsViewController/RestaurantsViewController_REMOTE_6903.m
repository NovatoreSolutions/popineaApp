//
//  RestaurantsViewController.m
//  Popinae
//
//  Created by Sohaib Muhammad on 24/01/2015.
//  Copyright (c) 2015 iDevNerds. All rights reserved.
//

#import "RestaurantsViewController.h"
#import "RestaurantFeed.h"
#import "RestaurantTableViewCell/RestaurantTableViewCell.h"
#import "Utility.h"
#import "MapViewController.h"


@interface RestaurantsViewController ()<UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate,UISearchBarDelegate>

@property (strong,nonatomic) RestaurantFeed *restaurantFeed;
@property (strong,nonatomic) RestaurantFeed *restaurantFeedSearched;

@property (weak, nonatomic) IBOutlet UITableView *restaurantTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *restaurantSearchBar;
@property (nonatomic,assign)BOOL isFiltered;

@end

@implementation RestaurantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _restaurantSearchBar.delegate=self;
    
    [self showRightNavigationBarButton];
    
    [self callService];

}

-(void)callService{
    
    
    [self showActivityIndicator];
    
    if (_restaurantFeed == nil) {
        _restaurantFeed = [[RestaurantFeed alloc] init];
        
    }
    
    [_restaurantFeed getRestaurantsWithKeyword:nil storeId:nil sortBy:nil sortOrder:nil pageNo:[NSNumber numberWithInt:1] recordsNo:[NSNumber numberWithInt:10] completionHandler:^(NSError *error){
        
        [self hideActivityIndicator];
        if (!error) {
            
            [_restaurantTableView reloadData];
        
        }else {
            
        }
    }];
    
    
    
}





#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isFiltered) {
        return [_restaurantFeedSearched restaurantsCount];
    }
    else
    return [_restaurantFeed restaurantsCount];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"RestaurantTableViewCell";
    RestaurantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (_isFiltered) {
        [cell populateData:[_restaurantFeedSearched restaurantAtIndex:indexPath.row]];
    }
    else
    {
        [cell populateData:[_restaurantFeed restaurantAtIndex:indexPath.row]];
    }
    
    
    
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = self;
    
    
    return cell;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"MapViewController"]){
        MapViewController *mapViewController=(MapViewController *)segue.destinationViewController;
        mapViewController.meal =(Meal *)sender;
    }

}




- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f]
                                                title:@"Call"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.576f blue:0.204f alpha:1.0f]
                                                title:@"Map"];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.466f green:0.824f blue:0.294 alpha:1.0f]
                                                title:@"Meals"];
    
    return rightUtilityButtons;
}


#pragma mark - SWTableViewDelegate


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            NSLog(@"Call button was pressed");
            NSString *phoneNumber=@"123";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
            
            break;
        }
        case 1:
        {
            NSLog(@"Map Button Pressed");
            
            NSIndexPath *cellIndexPath=[self.restaurantTableView indexPathForCell:cell];
            
            [self performSegueWithIdentifier:@"MapViewController" sender:[_restaurantFeed restaurantAtIndex:cellIndexPath.row]];
        
            [cell hideUtilityButtonsAnimated:YES];
            
            
            break;
        }
        case 2:
        {
            NSLog(@"Meals Button Pressed");
            break;
        }
            
            
        default:
            break;
    }
}

#pragma mark -UISearchBarDelegate Methods

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        _isFiltered = FALSE;
    }
    else
    {
        _isFiltered = true;
        _restaurantFeedSearched = [[RestaurantFeed alloc] init];
        
        
        for (Restaurant* restaurant in _restaurantFeed.restaurantFeed)
        {
            NSRange nameRange = [restaurant.storeName rangeOfString:text options:NSCaseInsensitiveSearch];
            
            if(nameRange.location != NSNotFound)
            {
                [_restaurantFeedSearched.restaurantFeed addObject:restaurant];
            }
        }
    }
    
    [self.restaurantTableView reloadData];
}

@end
