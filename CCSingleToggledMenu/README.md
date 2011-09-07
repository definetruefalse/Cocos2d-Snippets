Example of usage:


`CCMenuItem *menuItem1 = [CCMenuItemImage itemFromNormalImage:@"Button1.png" 
                                               selectedImage:@"Button1Sel.png" target:self selector:@selector(button1Tapped:)];`


`CCMenuItem *menuItem2 = [CCMenuItemImage itemFromNormalImage:@"Button2.png" 
                                               selectedImage:@"Button2Sel.png" target:self selector:@selector(button2Tapped:)];`

`CCMenuItem *menuItem3 = [CCMenuItemImage itemFromNormalImage:@"Button3.png" 
                                               selectedImage:@"Button3Sel.png" target:self selector:@selector(button3Tapped:)];`

`CCSingleToggledMenu *menu = [CCSingleToggledMenu menuWithItems:menuItem1, menuItem2, menuItem3, nil];`

`menu.delegate = self;`

`menu.position = ccp(160, 240);`

`[menu alignItemsHorizontally];`

`[menu setSelectedItem:menuItem2];`

`[self addChild:menu];`
