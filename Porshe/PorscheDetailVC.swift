//
//  PorscheDetailVC.swift
//  Porshe
//
//  Created by Admin on 15/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class PorscheDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var main2Img: UIImageView!
    @IBOutlet weak var powerLbl: UILabel!
    @IBOutlet weak var secondsLbl: UILabel!
    @IBOutlet weak var topSpeedLbl: UILabel!
    @IBOutlet weak var fuelLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    
    var porsche:Car!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        nameLbl.text = porsche.name
        mainImg.image = UIImage(named: "\(porsche.carId)")
        main2Img.image = UIImage(named: "\(porsche.carId)-image")
        powerLbl.text = "\(porsche.horsePower) hp at 6,500 1/min"
        //secondsLbl.text = "\(porsche.acceleration) secs"
        topSpeedLbl.text = "\(porsche.topSpeed) km/h"
        fuelLbl.text = "\(porsche.fuel)"
        priceLbl.text = "from £ \(porsche.price) incl. VAT"
        
    }
    
    @IBAction func backBtnpressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
