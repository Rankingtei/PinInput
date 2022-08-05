//
//  Pin.swift
//  PinInput
//
//  Created by Tei Akpotosu-Nartey on 8/2/22.
//

import UIKit

class Pin: UIView {
    
    let pin = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        addSubview(pin)
        pin.backgroundColor = .white
        pin.layer.cornerRadius = 8.0
        pin.layer.masksToBounds = true
        pin.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            pin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pin.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pin.widthAnchor.constraint(equalToConstant: 16.0),
            pin.heightAnchor.constraint(equalToConstant: 16.0),
        ])
    }
}
