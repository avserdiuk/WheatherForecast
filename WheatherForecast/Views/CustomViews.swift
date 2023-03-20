//
//  CustomViews.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import Foundation
import UIKit

class CVLabel : UILabel {

    init(text: String, size : CGFloat, weight: UIFont.Weight, color: Colors = .textbBlack, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color.color
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CVImage : UIImageView {
    init(imageName: String){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(named: imageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
