//
//  PinInputVC.swift
//  PinInput
//
//  Created by Tei Akpotosu-Nartey on 8/2/22.
//

import UIKit


class PinInputVC: UIViewController, NumberPadDelegate {
   
    func onNumberSelected(number: String) {
        
        if number == "<" {
            passcodeInput.passcode.code.removeLast()
        }
        else{
        passcodeInput.passcode.code += number
        print(passcodeInput.passcode.code)
        }
    
    }
    
    
    let welcomeEmoji = UIImageView()
    let goodMorning = UILabel()
    let createPinPrompt = UILabel()
    let pinInputView = UIView()
    lazy var numberPad = NumberPadVC()
    lazy var passcodeInput = PasscodeVC()
    let numberPadView = UIView()
    let forgotPinLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.95, blue: 0.94, alpha: 1.00)
        configureUI()
        
        numberPad.delegate = self
       
        self.add(childVC: passcodeInput, to: pinInputView)
        self.add(childVC: numberPad, to: numberPadView)
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    func configureUI(){
        view.addSubview(welcomeEmoji)
        view.addSubview(goodMorning)
        view.addSubview(createPinPrompt)
        view.addSubview(pinInputView)
        view.addSubview(numberPadView)
        view.addSubview(forgotPinLabel)
        
        welcomeEmoji.image = UIImage(named: "waving-hand")
        
        goodMorning.text = "Hi, Boo "
        goodMorning.textColor = UIColor(red: 0.25, green: 0.29, blue: 0.32, alpha: 1.00)
        goodMorning.font = .systemFont(ofSize: 24)
        
        createPinPrompt.text = "Create your 4 digit pin"
        createPinPrompt.textColor = UIColor(red: 0.25, green: 0.29, blue: 0.32, alpha: 1.00)
        createPinPrompt.font = .systemFont(ofSize: 13)
        
        forgotPinLabel.attributedText = NSAttributedString(string: "I forgot my pin", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        forgotPinLabel.textColor = UIColor(red: 0.25, green: 0.29, blue: 0.32, alpha: 1.00)
        forgotPinLabel.font = .systemFont(ofSize: 13)

        welcomeEmoji.translatesAutoresizingMaskIntoConstraints = false
        goodMorning.translatesAutoresizingMaskIntoConstraints = false
        createPinPrompt.translatesAutoresizingMaskIntoConstraints = false
        pinInputView.translatesAutoresizingMaskIntoConstraints = false
        numberPadView.translatesAutoresizingMaskIntoConstraints = false
        forgotPinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeEmoji.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            welcomeEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeEmoji.heightAnchor.constraint(equalToConstant: 60),
            welcomeEmoji.widthAnchor.constraint(equalToConstant: 60),
            
            goodMorning.topAnchor.constraint(equalTo: welcomeEmoji.bottomAnchor, constant: 10),
            goodMorning.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goodMorning.heightAnchor.constraint(equalToConstant: 18),
            
            createPinPrompt.topAnchor.constraint(equalTo: goodMorning.bottomAnchor, constant: 5),
            createPinPrompt.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createPinPrompt.heightAnchor.constraint(equalToConstant: 18),
            
            pinInputView.topAnchor.constraint(equalTo: createPinPrompt.bottomAnchor),
            pinInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            pinInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            pinInputView.heightAnchor.constraint(equalToConstant: 44),
            
            numberPadView.topAnchor.constraint(equalTo: pinInputView.bottomAnchor, constant: 10),
            numberPadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            numberPadView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            numberPadView.heightAnchor.constraint(equalToConstant: 350),
            
            forgotPinLabel.topAnchor.constraint(equalTo: numberPadView.bottomAnchor, constant: 50),
            forgotPinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPinLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}


