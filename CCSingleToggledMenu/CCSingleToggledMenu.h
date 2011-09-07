//
//  CCSingleToggledMenu.h
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

#import "cocos2d.h"

@interface CCSingleToggledMenu : CCMenu {
    CCMenuItem *_curHighlighted;
    CCMenuItem *_prevHighlighted;
    
    id delegate;
    
    BOOL toggledOff;
}
// CCSingleToggledMenu will notify delegate that last radio-toggled item is toggled off
@property(nonatomic, retain) id delegate;

// Initially selected && toggled item
- (void)setSelectedItem:(CCMenuItem *)item;

// Handy getters
-(CCMenuItem*) getCurrentSelectedItem;
-(CCMenuItem*) getPreviousSelectedItem;

@end
