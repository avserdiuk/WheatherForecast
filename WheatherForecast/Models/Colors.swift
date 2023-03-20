//
//  Colors.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 20.03.2023.
//

import Foundation
import UIKit

enum Colors {
    case accentBlue
    case textWhite
    case textGray
    case orange
    case textbBlack

    var color: UIColor {

        switch self {
            case .accentBlue :
                return UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
            case .textWhite:
                return UIColor(red: 0.973, green: 0.961, blue: 0.961, alpha: 1)
            case .orange:
                return UIColor(red: 0.949, green: 0.431, blue: 0.067, alpha: 1)
            case .textGray:
                return UIColor(red: 0.538, green: 0.513, blue: 0.513, alpha: 1)
            case .textbBlack:
                return UIColor(red: 0.153, green: 0.153, blue: 0.133, alpha: 1)
        }
    }
}

