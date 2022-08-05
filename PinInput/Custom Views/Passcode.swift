//
//  Passcode.swift
//  PinInput
//
//  Created by Tei Akpotosu-Nartey on 8/2/22.


import UIKit


class Passcode: UIView, UITextInputTraits {

    
    var didFinishedEnterCode:((String)-> Void)?
    

    var code: String = "" {
        didSet {
           updateStack(by: code)
        }
    }
    var maxLength = 4
    
    let stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        addSubview(stack)
        self.backgroundColor = UIColor(white: 1, alpha: 0)
        stack.backgroundColor = UIColor(white: 1, alpha: 0)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        updateStack(by: code)
    }
    
    
    private func emptyPin() -> UIView {
        let pin = Pin()
        pin.pin.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.88, alpha: 1.00)
        return pin
    }
    
    
    private func pin() -> UIView {
        let pin = Pin()
        pin.pin.backgroundColor = UIColor(red: 0.25, green: 0.29, blue: 0.32, alpha: 1.00)
        return pin
    }
    
    
    private func updateStack(by code: String) {
        var emptyPins:[UIView] = Array(0..<maxLength).map{_ in emptyPin()}
        let userPinLength = code.count
        let pins:[UIView] = Array(0..<userPinLength).map{_ in pin()}
        
        for (index, element) in pins.enumerated() {
            emptyPins[index] = element
        }
        stack.removeAllArrangedSubviews()
        for view in emptyPins {
            stack.addArrangedSubview(view)
        }
    }

}

extension UIStackView {
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
