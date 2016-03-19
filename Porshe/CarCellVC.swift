//
//  CarCellVC.swift
//  Porshe
//
//  Created by Admin on 14/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class CarCellVC: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var porsche: Car!
    
    required init?(coder aDecoder:NSCoder){
        super.init(coder:aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(porsche:Car){
        self.porsche = porsche
        
        thumbImg.image = UIImage(named: "\(self.porsche.carId)")
        nameLbl.text = self.porsche.name
        
    }
}
