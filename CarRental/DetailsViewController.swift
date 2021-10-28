//
//  DetailsViewController.swift
//  CarRental
//
//  Created by Onurcan Sever on 2021-10-22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var carModel: CarModel! = nil
    
    @IBOutlet weak var modelTitle: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var dynamicImage: UIImageView!
    @IBOutlet weak var modelDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelTitle.text = carModel.carModel
        modelDescription.text = carModel.carDescription
        
        image1.image = UIImage(named: carModel.carPhoto)
        image2.image = UIImage(named: carModel.carPhoto)
        image3.image = UIImage(named: carModel.carPhoto)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        image1.addGestureRecognizer(tap)
        
        image1.isUserInteractionEnabled = true
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imageTapped() {
        dynamicImage.image = UIImage(named: carModel.carPhoto)
    }
    
}
