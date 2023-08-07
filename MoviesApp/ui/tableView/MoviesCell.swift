//
//  MoviesCell.swift
//  MoviesApp
//
//  Created by Tuba Nur  on 3.08.2023.
//

import UIKit

protocol HucreProtocol{
    func sepeteEkleTikla(indexPath : IndexPath)
    
    
    
}




class MoviesCell: UICollectionViewCell {
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    
    @IBAction func btnAddBasket(_ sender: Any) {
        hucreProtocol?.sepeteEkleTikla(indexPath: indexPath!)
    }
    
    
    @IBOutlet weak var labelPay: UILabel!
    
    
}
