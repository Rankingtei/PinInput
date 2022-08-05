//
//  NumberButton.swift
//  PinInput
//
//  Created by Tei Akpotosu-Nartey on 8/1/22.
//

import UIKit

class NumberButton: UICollectionViewCell {
    
    let digitsLabel = UILabel()

    static let reuseID = "Cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.88, alpha: 1.00)
        setupLabel()
    }
    
    
    func setupLabel(){
        addSubview(digitsLabel)
        
        digitsLabel.textColor = UIColor(red: 0.25, green: 0.29, blue: 0.32, alpha: 1.00)
        digitsLabel.font = UIFont.boldSystemFont(ofSize: 32)
        digitsLabel.textAlignment = .center
        digitsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            digitsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            digitsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
