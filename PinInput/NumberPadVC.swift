//
//  ViewController.swift
//  PinInput
//
//  Created by Tei Akpotosu-Nartey on 8/1/22.
//

import UIKit


class NumberPadVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let numbers = ["1", "2", "3", "4", "5","6", "7", "8", "9", "", "0", "<"]
    
    let background = UIColor(red: 0.97, green: 0.95, blue: 0.94, alpha: 1.00)
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"imagename")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = background
        collectionView.register(NumberButton.self, forCellWithReuseIdentifier: NumberButton.reuseID)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberButton.reuseID, for: indexPath)
        if numbers[indexPath.item].isEmpty == false {
            (cell as! NumberButton).digitsLabel.text = numbers[indexPath.item]
        }
        else{
            cell.isHidden = true
        }
            return cell
    }
    
    
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sidePadding = view.frame.width * 0.13
        let innerSpacig = view.frame.width * 0.1
        let cellWidth = (view.frame.width - 2 * sidePadding - 2 * innerSpacig) / 3
        return .init(width: cellWidth , height: cellWidth)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sidePadding = view.frame.width * 0.15
        return .init(top: 16, left: sidePadding, bottom: 16, right: sidePadding)
    }
}
