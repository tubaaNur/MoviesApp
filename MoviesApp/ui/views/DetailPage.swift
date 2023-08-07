//
//  DetailPage.swift
//  MoviesApp
//
//  Created by Tuba Nur  on 3.08.2023.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFilm: UILabel!
    
    var film: Movies?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = film{
            labelFilm.text = f.name
            imageViewFilm.image = UIImage(named: f.image!)
            labelFiyat.text = "\(f.pay!) ₺"
         
        }

 
    }
    

    

}
