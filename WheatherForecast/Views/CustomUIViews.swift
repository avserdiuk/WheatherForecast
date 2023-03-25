//
//  CustomUIViews.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import Foundation
import UIKit

class CVLabel : UILabel {

    init(
        text: String,
        size : CGFloat,
        weight: Font,
        color: Colors = .textBlack,
        numberOfLines: Int = 1,
        textAlignment: NSTextAlignment = .left,
        tag : Int = 0
    ){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        //self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.font = UIFont(name: "\(weight.rawValue)", size: size)
        self.textColor = color.color
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.tag = tag
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

class CVButton : UIButton {
    init(title: String, titleSize: CGFloat, titleColor : Colors = .textBlack, titleWeight: UIFont.Weight = .regular,  backgroundColor: Colors = .transparent, cornerRadius: CGFloat = 0){
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: titleSize, weight: titleWeight)
        self.setTitleColor(titleColor.color, for: .normal)
        self.backgroundColor = backgroundColor.color
        self.layer.cornerRadius = cornerRadius

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CVView : UIView {
    init(backgroundColor: Colors = .transparent, cornerRadius: CGFloat = 0){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor.color
        self.layer.cornerRadius = cornerRadius
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CVStackView : UIStackView {
    init(axis : NSLayoutConstraint.Axis = .horizontal, spacing : CGFloat = 0, alignment : UIStackView.Alignment = .fill){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
