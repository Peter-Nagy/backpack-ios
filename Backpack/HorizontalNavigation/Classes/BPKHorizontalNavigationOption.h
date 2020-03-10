/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018-2020 Skyscanner Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>

#import <Backpack/Icon.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * A single option within a horizontal navigation.
 *
 * Can be configured to show an optional icon, always includes a name.
 */
@interface BPKHorizontalNavigationOption : NSObject

/**
 * Name of the optional icon used in the option.
 */
@property(nonatomic, readonly, strong, nullable) BPKIconName iconName;

/**
 * A tag representing the option, can be used to distinguish options from
 * eachother.
 */
@property(nonatomic, readonly) NSInteger tag;

/**
 * Name of the option displayed in the horizontal nav.
 */
@property(nonatomic, readonly, copy) NSString *name;

/**
 * Whether the option has an icon. True if `iconName` is non-nil.
 */
@property(nonatomic, readonly) BOOL hasIcon;

/**
 * Displays an indicator on the badge with optional number/text inside.
 * If the string is nil, the indicator will not be shown.
 */
@property(nonatomic, nullable) NSString *indicatorText;

/**
 * Intialize an option with a given name.
 *
 * @param name The name of the option.
 * @return A named option.
 */
- (instancetype)initWithName:(NSString *)name;

/**
* Intialize an option with a given name and tag.
*
* @param name The name of the option.
* @param tag The tag of the option.
* @return A named option with a tag.
*/
- (instancetype)initWithName:(NSString *)name tag:(NSInteger)tag;

/**
* Intialize an option with a given name and tag.
*
* @param name The name of the option.
* @param tag The tag of the option.
* @param indicatorText The text to show in the indicator.
* @return A named option with a tag.
*/
- (instancetype)initWithName:(NSString *)name tag:(NSInteger)tag indicatorText:(NSString *_Nullable)indicatorText;

/**
* Intialize an option with a given name and icon.
*
* @param name The name of the option.
* @param iconName The name of the icon to display.
* @return A named option with an icon.
*/
- (instancetype)initWithName:(NSString *)name iconName:(BPKIconName)iconName;

/**
* Intialize an option with a given name, tag, and icon.
*
* @param name The name of the option.
* @param iconName The name of the icon to display.
* @param tag The tag of the option.
* @return A named option with an icon and a tag.
*/
- (instancetype)initWithName:(NSString *)name iconName:(BPKIconName)iconName tag:(NSInteger)tag;

@end
NS_ASSUME_NONNULL_END
