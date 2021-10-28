//
//  ModelTableViewCell.swift
//  CarRental
//
//  Created by Onurcan Sever on 2021-10-22.
//

import UIKit

class ModelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dailyRate: UILabel!
    @IBOutlet weak var modelImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCarCell(obj: CarModel) {
        dailyRate.text = String(obj.carDailyRate)
        modelImage.image = UIImage(named: obj.carPhoto)
    }

}
