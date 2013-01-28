//
//  ListScrollView.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/23.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "ListScrollView.h"

#define kSpaceWidth 100
//#define kSpaceWidth 90 //changable
#define kSpaceHeight 9 //changable
#define kItemForRow 3 //changable
#define kNumberOfRow 2 //don't change
#define kNumberOfColumn 3 //not yet used

@interface ListScrollView ()

-(void)displayItems;
-(CGSize)findContentSize:(int)items;
-(void)setupContent:(NSArray *)items;

@end

@implementation ListScrollView

@synthesize theDelegate = _theDelegate;
@synthesize itemCount = _itemCount;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)initWithDelegate:(id<ListScrollViewDelegate>)delegate
{
    _theDelegate = delegate;
    numberOfItem = 0;
    selectedItemIndex = 0;
    
    [self displayItems];
}

-(void)viewDidLoad
{
    self.scrollEnabled = YES;
    self.directionalLockEnabled = YES;
    self.pagingEnabled = NO;
    self.bounces = YES;
    self.alwaysBounceVertical = NO;
    self.alwaysBounceHorizontal = YES;
    self.delegate = self;
}

#pragma mark -  display
-(void)displayItems
{
    if(_theDelegate == nil)
    {
        NSLog(@"can not display scroll view item, delegate is nil");
        return;
    }
    else
    {
        itemViewControlllers = [[NSMutableArray alloc] init];
    }
    
    
    //ask delegate for number of item;
    if([_theDelegate respondsToSelector:@selector(ListScrollViewNumberOfItem:)])
    {
        numberOfItem = [_theDelegate ListScrollViewNumberOfItem:self];
    }
    else
    {
        NSLog(@"delegate did not conform to protocol");
        return;
    }
    
    if(!numberOfItem)
        return;
    

    
    if([_theDelegate respondsToSelector:@selector(ListScrollView:itemForIndex:)])
    {
        //ask delegate for data
        for(int i=0; i<numberOfItem; i++)
        {
            ItemViewController *item = [_theDelegate ListScrollView:self itemForIndex:i];
            
            if(item == nil)
            {
                NSLog(@"delegate provide data with nil");
            }
            
            item.theDelegate = self;
            item.scrollView = self;
            
            [itemViewControlllers addObject:item];
        }
        

    }
    else
    {
        NSLog(@"delegate did not conform to protocol");
        return;
    }
    
    //setup content size
    CGSize contentSize = [self findContentSize:numberOfItem];
    self.contentSize = contentSize;
    
    //display items
    [self setupContent:itemViewControlllers];
}

#pragma mark - content
-(CGSize)findContentSize:(int)numberItems
{
    CGFloat sizeHeight = self.frame.size.height;
    CGFloat sizeWidth = 0;
    CGFloat itemViewWidth = 0;
    //how many page form by items
    int pages =numberItems/(kNumberOfRow*kItemForRow);
    //how many items reamin
    int remains = numberItems%(kNumberOfRow*kItemForRow);
    
    if(remains >= kItemForRow)
    {
        //number of item in row form a page
        pages+=1;
        remains = 0;
    }
    
    ItemViewController *item = [itemViewControlllers objectAtIndex:0];
    itemViewWidth = item.view.frame.size.width;
    
    /**
     calculate content size
     **/
    //calculate first page width
    CGFloat firstPageWidth = (kItemForRow*itemViewWidth) + ((kItemForRow+1)*kSpaceWidth);
    //calculate remain items' width
    CGFloat remainsWidth = (remains*itemViewWidth) + (remains*kSpaceWidth);
    if(pages>1)
    {
        /**more than one page**/
        //calculate rest page width but first one
        CGFloat restPageWidth =(pages-1)*(firstPageWidth-kSpaceWidth);
        
        sizeWidth = firstPageWidth+restPageWidth+remainsWidth;
    }
    else
    {
        /**only one page**/
        
        firstPageWidth = pages*firstPageWidth;
        
        sizeWidth = firstPageWidth+remainsWidth;
    }
    
    return CGSizeMake(sizeWidth, sizeHeight);

}

-(void)setupContent:(NSArray *)items
{
    
    int pages =[items count]/(kNumberOfRow*kItemForRow);
    int remains = [items count]%(kNumberOfRow*kItemForRow);
    
    if(remains != 0)
    {
        //number of item in row form a page
        pages+=1;
        remains = 0;
        NSLog(@"remains:%i", remains);
    }
    
    //the height of item
    ItemViewController *item = [itemViewControlllers objectAtIndex:0];
    CGFloat itemViewHeight = item.view.frame.size.height;
    
    //to track index
    int currentIndex = 0;
    //track x position, value is depend on kItemForRow
    //e.g kItemForRow=3, xPosTracker will be 0,1,2 repeatly
    //xPosTracker reset to 0 once it reach kItemForRow
    int xPosTracker = 0;
    //track y position, value is depend on kNumberOfRow, use 0 or 1 to distinct row number
    //e.g kNumberOfRow=2, yPosTracker will be 0,1 repeatly
    //xPosTracker reverse every it reach kNumberOfRow
    //note current support two row only
    int yPosTracker = 0;
    
    CGFloat totalOffset = 0;
    CGFloat heightOffset = 0;
    
    /**
     find out offset for height
     **/
    //find out the total offset
    totalOffset = self.frame.size.height - ((kNumberOfRow*itemViewHeight)+((kNumberOfRow+1)*kSpaceHeight));
    
    if(totalOffset<0)
    {
        //offset is negative
        NSLog(@"scroll view height offset is negative value");
        return;
    }
    
    if(kNumberOfRow<=1)
    {
        //check if number of row is 0 or 1
        if(kNumberOfRow == 0)
        {
            NSLog(@"scroll view kNumberOfRow is 0, must not be 0");
            return;
        }
        else
        {
            //no offset for only one row
            heightOffset = 0;
        }
    }
    else
    {
        heightOffset = totalOffset/kNumberOfRow;
    }
    
        
    /**
     start to arrange items
     **/
    for(int page=0; page<pages; page++)
    {
        for(int i=currentIndex; i<[items count]; i++)
        {
            ItemViewController *item = [itemViewControlllers objectAtIndex:i];
            
            //width of previous pages
            CGFloat previousTotalWidth = 0;
            //page's width
            CGFloat pageWidth = (kItemForRow*item.view.frame.size.width) + (kItemForRow*kSpaceWidth);
            //first page is different from page width, a space added to the end of page
            CGFloat firstPageWidth = (kItemForRow*item.view.frame.size.width) + ((kItemForRow+1)*kSpaceWidth);
            
            //if there is at least one page
            if(page>0)
            {
                previousTotalWidth = firstPageWidth + ((page-1)*pageWidth);
            }

            //calculate x position base on x postion tracker
            //note +1 due to first page will leave a space for the beginning of the item
            CGFloat xPos = previousTotalWidth+((xPosTracker*item.view.frame.size.width)+((xPosTracker+1)*kSpaceWidth));
            
            //calculate y position base on y position tracker
            CGFloat yPos = (yPosTracker*item.view.frame.size.height)+((yPosTracker+1)*kSpaceHeight);
            
            //if item place in any pages but first page, recalculate x position
            if((i+1)>(kItemForRow*kNumberOfRow))
            {
                //calculate x position base on x postion tracker
                //note no +1 due to none first page will not leave a space for the beginning of the item; there is a space at end of page
                xPos = previousTotalWidth+((xPosTracker*item.view.frame.size.width)+(xPosTracker*kSpaceWidth));
            }
            
            //see if y position tracker is in first or second row, 0 or 1
            if(yPosTracker)
            {
                //if second row add offset
                yPos+=heightOffset;
            }
            
            //NSLog(@"yPostion:%f", yPos);
            
            CGRect newItemRect = CGRectMake(xPos, yPos, item.view.frame.size.width, item.view.frame.size.height);
            
            item.view.frame = newItemRect;
            
            //add view to scroll view
            [self addSubview:item.view];
            
            /**
             update info for next item
             **/
            //if item index reach the kItemForRow or not
            if(((i+1)%kItemForRow) == 0)
            {
                //reverse y position tracker to change row number
                yPosTracker = !yPosTracker;
            }
            
            //if the item is at beginning of page or not
            if(((i+1)%kItemForRow) == 0)
            {
                //reset to 0 if it is at beginning of page
                xPosTracker = 0;
            }
            else
            {
                //advance x position tracker by 1
                xPosTracker++;
            }
            
            //track item index
            currentIndex = i;
            
            //page is full and going to next one?
            if(((i+1)%(kItemForRow*kNumberOfRow)) == 0)
            {
                //advance item index tracker by 1
                currentIndex++;
                break;
            }
        }
    }

}

-(void)reloadData
{
    numberOfItem = 0;
    selectedItemIndex = 0;
    
    for(ItemViewController *item in itemViewControlllers)
    {
        [item.view removeFromSuperview];
    }
    
    [itemViewControlllers removeAllObjects];
    
    self.contentSize = CGSizeZero;
    
    [self displayItems];
    
}

-(ItemViewController *)itemViewControllerByIndex:(NSUInteger)index
{
    return [itemViewControlllers objectAtIndex:index];
}

#pragma mark - getter setter
-(int)itemCount
{
    return numberOfItem;
}

#pragma mark - ItemViewController delegate
-(void)ItemViewControllerDidSelected:(ItemViewController *)item
{
   if([_theDelegate respondsToSelector:@selector(ListScrollView:didSelectItemAtIndex:)])
   {
       int index = [itemViewControlllers indexOfObject:item];
       [_theDelegate ListScrollView:self didSelectItemAtIndex:index];
   }
}

-(void)ItemViewControllerDidDropdown:(ItemViewController *)item
{
    if([_theDelegate respondsToSelector:@selector(ListScrollView:didDropdownItemWithItem:)])
    {
        
        [_theDelegate ListScrollView:self didDropdownItemWithItem:item];
    }
}

@end
