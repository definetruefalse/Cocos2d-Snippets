//
//  CCSingleToggledMenu.m
//  CCSingleToggledMenu
//
//  Created by Dmitry Seredinov on 9/7/11.
// 
//  Credits:
//  http://www.raywenderlich.com/414/how-to-create-buttons-in-cocos2d-simple-radio-and-toggle
//

/*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

#import "CCSingleToggledMenu.h"


@implementation CCSingleToggledMenu

@synthesize delegate;

-(void) menuToggledOnWithItem:(CCMenuItem*)item
{
    if (delegate && [delegate respondsToSelector:@selector(menuToggledOn:withItem:)]) {
        [delegate performSelector:@selector(menuToggledOn:withItem:) withObject:self withObject:item];
    }
}

- (void)setSelectedItem:(CCMenuItem *)item {
    [selectedItem_ unselected];
    selectedItem_ = item;   
    [item selected];
    [self menuToggledOnWithItem:selectedItem_];
}

-(CCMenuItem*) getCurrentSelectedItem
{
    return _curHighlighted;
}

-(CCMenuItem*) getPreviousSelectedItem
{
    return _prevHighlighted;
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event 
{
    
    if ( state_ != kCCMenuStateWaiting ) return NO;
    
    CCMenuItem *curSelection = [self itemForTouch:touch];
    [curSelection selected];
    _curHighlighted = curSelection;
        
    if (_curHighlighted) {
        if (selectedItem_ != curSelection) {
            [selectedItem_ unselected];
        }
        state_ = kCCMenuStateTrackingTouch;
        return YES;
    }
    return NO;
    
}

- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event 
{
    
    NSAssert(state_ == kCCMenuStateTrackingTouch, @"[Menu ccTouchEnded] -- invalid state");
    
    CCMenuItem *curSelection = [self itemForTouch:touch];

    _prevHighlighted = selectedItem_;
    
    if (curSelection != _curHighlighted && curSelection != nil) {
        [selectedItem_ selected];
        [_curHighlighted unselected];
        _curHighlighted = nil;
        state_ = kCCMenuStateWaiting;
        return;
    }
   
    selectedItem_ = _curHighlighted;
    [_curHighlighted activate];
    _curHighlighted = nil;
    state_ = kCCMenuStateWaiting;    

    if (_prevHighlighted == selectedItem_ && !toggledOff) {
        [selectedItem_ unselected];

        if (delegate && [delegate respondsToSelector:@selector(menuToggledOff:withItem:)]) {
            [delegate performSelector:@selector(menuToggledOff:withItem:) withObject:self withObject:_prevHighlighted];
        }
        _prevHighlighted = nil;
        toggledOff = YES;
        return;
    }
    [self menuToggledOnWithItem:selectedItem_];
    toggledOff = NO;
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event 
{
    
    NSAssert(state_ == kCCMenuStateTrackingTouch, @"[Menu ccTouchCancelled] -- invalid state");
	[selectedItem_ selected];
    [_curHighlighted unselected];
    _curHighlighted = nil;
	
	state_ = kCCMenuStateWaiting;
    
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	NSAssert(state_ == kCCMenuStateTrackingTouch, @"[Menu ccTouchMoved] -- invalid state");
	CCMenuItem *curSelection = [self itemForTouch:touch];
    if (curSelection != _curHighlighted && curSelection != nil) {    
        [_curHighlighted unselected];
        [curSelection selected];
        _curHighlighted = curSelection;        
        return;
    }
    
}

@end
