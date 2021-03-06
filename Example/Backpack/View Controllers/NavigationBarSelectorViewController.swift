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

import UIKit
import Backpack

enum NavigationBarSegueIdentifier: String {
    case `default` = "Default"
    case buttons = "Buttons"
}

class NavigationBarSelectorViewController: UITableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let target = segue.destination as? NavigationBarViewController else {
            fatalError("Expected destination to be of type NavigationBarViewController.")
        }

        if let identifier = segue.identifier,
            let navigationBarSegueIdentifier = NavigationBarSegueIdentifier(rawValue: identifier) {
            switch navigationBarSegueIdentifier {
            case .default:
                return
            case .buttons:
                target.showButtons = true
            }
        } else {
            fatalError("Unknown segue identifer \(segue.identifier.debugDescription)")
        }
    }
}
