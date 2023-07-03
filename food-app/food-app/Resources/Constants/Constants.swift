//
//  Constants.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import UIKit

enum Constants{
    enum Colors{
        static var white: UIColor?{
            UIColor(named: "White")
        }
        static var black: UIColor?{
            UIColor(named: "Black")
        }
        static var black40: UIColor?{
            UIColor(named: "Black40")
        }
        static var black50: UIColor?{
            UIColor(named: "Black50")
        }
        static var black65: UIColor?{
            UIColor(named: "Black65")
        }
        static var accent: UIColor?{
            UIColor(named: "Accent")
        }
        static var tab: UIColor?{
            UIColor(named: "GrayTabBar")
        }
    }
    enum Fonts{
        static var headline: UIFont?{
            UIFont(name: "SF-Pro-Display-Medium", size: 20)
        }
        static var headline1: UIFont?{
            UIFont(name: "SF-Pro-Display-Medium", size: 18)
        }
        static var headline2: UIFont?{
            UIFont(name: "SF-Pro-Display-Medium", size: 16)
        }
        static var subHead1: UIFont?{
            UIFont(name: "SF-Pro-Display-Regular", size: 14)
        }
        static var tab: UIFont?{
            UIFont(name: "SF-Pro-Display-Medium", size: 10)
        }
        static var mainBody: UIFont?{
            UIFont(name: "SF-Pro-Display-Regular", size: 14)
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
