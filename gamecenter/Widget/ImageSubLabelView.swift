//
//  ImageSubLabelView.swift
//  gamecenter
//
//  Created by daovu on 10/7/20.
//  Copyright © 2020 daovu. All rights reserved.
//

import UIKit

class ImageSubLabelView: UIView {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: UIFont.primaryFontNameMedium, size: 14)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.image = UIImage(named: Image.heart.name)
        image.tintColor = .white
        return image
    }()
    
    var didTapped: (() -> Void)?
    
    init(frame: CGRect, image: UIImage?, showText: Bool = true) {
        super.init(frame: frame)
        setupView()
        imageView.image = image
        textLabel.isHidden = !showText
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(textLabel)
        addSubview(imageView)
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        textLabel.anchor(top: imageView.bottomAnchor,
                         leading: leadingAnchor,
                         bottom: nil,
                         trailing: trailingAnchor,
                         padding: .init(top: 2, left: 0, bottom: 0, right: 0))
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOffset = .init(width: 0, height: 1)
        imageView.layer.shadowOpacity = 0.6
        imageView.layer.shadowRadius = 1.0
        imageView.clipsToBounds = false
    }
    
    @objc private func didTap() {
        didTapItem()
        didTapped?()
    }
    
    open func didTapItem() {}
}
