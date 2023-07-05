//
//  Constants.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import UIKit
import SwiftUI

enum Constants{
    enum Colors{
        static var white: Color?{
            Color("White")
        }
        static var background: Color?{
            Color("Background")
        }
        static var black: Color?{
            Color("Black")
        }
        static var black40: Color?{
            Color("Black40")
        }
        static var black50: Color?{
            Color("Black50")
        }
        static var black65: Color?{
            Color("Black65")
        }
        static var accent: Color?{
            Color("Accent")
        }
        static var tab: Color?{
            Color("GrayTabBar")
        }
        static var stepper: Color?{
            Color("Stepper")
        }
    }
    enum Fonts{
        static var headline: Font?{
            Font.custom("SFProDisplay-Medium", size: 20)
        }
        static var headline1: Font?{
            Font.custom("SFProDisplay-Medium", size: 18)
        }
        static var headline2: Font?{
            Font.custom("SFProDisplay-Medium", size: 16)
        }
        static var tab: Font?{
            Font.custom("SFProDisplay-Medium", size: 10)
        }
        static var mainBody: Font?{
            Font.custom("SFProDisplay-Regular", size: 14)
        }
        static var stepperValue: Font?{
            Font.custom("SFProDisplay-Medium", size: 14)
        }
    }
    enum Image {
        static let locationIcon = "LocationIcon"
        static let heartIcon = "HeartIcon"
        static let cancelIcon = "CancelIcon"
        static let mainTabIcon = "MainTabIcon"
        static let searchTabIcon = "SearchTabIcon"
        static let basketTabIcon = "BasketTabIcon"
        static let accountTabIcon = "AccountTabIcon"
        static let accountPhoto = "AccountPhoto"
    }
}
