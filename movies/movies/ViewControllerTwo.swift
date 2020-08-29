//
//  ViewControllerTwo.swift
//  movies
//
//  Created by mac on 26.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    var passingData : [String] = []
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var lbl7: UILabel!
    @IBOutlet weak var lbl8: UILabel!
    @IBOutlet weak var lbl9: UILabel!
    @IBOutlet weak var lbl10: UILabel!
    @IBOutlet weak var lbl11: UILabel!
    @IBOutlet weak var lbl12: UILabel!
    @IBOutlet weak var lbl13: UILabel!
    @IBOutlet weak var lbl14: UILabel!
    @IBOutlet weak var lbl15: UILabel!
    @IBOutlet weak var lbl16: UILabel!
    override func viewDidLoad() {
        
        for i in 0...passingData.count-1{
            if passingData[i] == "0.0" || passingData[i] == "" {
                passingData[i] = "Unknown"
            }
            else{
                passingData[i] = passingData[i].prefix(1).uppercased() + passingData[i].dropFirst(1)
            }
        }
        super.viewDidLoad()
        img.layer.cornerRadius = img.layer.bounds.height / 2
        img.clipsToBounds = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        lbl1.text = (passingData[0])
        lbl2.text = (passingData[1])
        lbl3.text = (passingData[2])
        lbl4.text = (passingData[3])
        lbl5.text = (passingData[4])
        lbl6.text = (passingData[5])
        lbl7.text = (passingData[6])
        lbl8.text = (passingData[7])
        lbl9.text = (passingData[8])
        lbl10.text = (passingData[9])
        lbl11.text = (passingData[10])
        lbl12.text = (passingData[11])
        lbl13.text = (passingData[12])
        lbl14.text = (passingData[13])
        lbl15.text = (passingData[14])
        lbl16.text = (passingData[15])
        let link = "https"+passingData[16].dropFirst(4)
        
        let url = URL(string: link)
        let data = try? Data(contentsOf: url!)

        if let imageData = data {
            let image = UIImage(data: imageData)
            img.image = image
        }
    }
    

    
}
