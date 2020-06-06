//
//  Extensions+UIColor.swift
//  CinemaSalon
//
//  Created by elesahich on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

enum AssetsColor {

    case darkGrayColor
    case grayColor
    case redColor
    
}

extension UIColor {
      static func salonColor(_ name: AssetsColor) -> UIColor {
        switch name {
        case .darkGrayColor:
            return UIColor(displayP3Red: 90/255, green: 90/255, blue: 90/255, alpha: 0.3)
        case .grayColor:
            return UIColor(displayP3Red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        case .redColor:
            return UIColor(displayP3Red: 250/255, green: 49/255, blue: 51/255, alpha: 1)

            
        }
        
    }
}

