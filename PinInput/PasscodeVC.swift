//
//  PasscodeVC.swift
//  PinInput
//
//  Created by Tei Akpotosu-Nartey on 8/2/22.
//

import UIKit

class PasscodeVC: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        let passcode = Passcode()
        passcode.backgroundColor = UIColor(red: 0.97, green: 0.95, blue: 0.94, alpha: 1.00)
        passcode.frame = CGRect(x: 0, y:0, width: 300, height: 40)
        view.addSubview(passcode)
        passcode.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passcode.topAnchor.constraint(equalTo: view.topAnchor),
            passcode.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passcode.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            passcode.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }


}


