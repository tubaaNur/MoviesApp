//
//  ViewController.swift
//  MoviesApp
//
//  Created by Tuba Nur  on 3.08.2023.
//

import UIKit

class HomePage: UIViewController {
    
    
    @IBOutlet weak var movieCollectionView:UICollectionView!
    
    
    var movieList = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
        let m1 = Movies(id: 1, name: "Django", image: "django", pay: 24)
        let m2 = Movies(id: 2, name: "Interstellar", image: "interstellar", pay: 34)
        let m3 = Movies(id: 3, name: "Inception", image: "inception", pay: 56)
        let m4 = Movies(id: 4, name: "The Hateful Eight", image: "thehatefuleight", pay: 28)
        let m5 = Movies(id: 5, name: "The Pianist", image: "thepianist", pay: 58)
        let m6 = Movies(id: 6, name: "Anadoluda", image: "anadoluda", pay: 70)
        movieList.append(m1)
        movieList.append(m2)
        movieList.append(m3)
        movieList.append(m4)
        movieList.append(m5)
        movieList.append(m6)
    }
}

extension HomePage : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movieList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! MoviesCell
        
        cell.imageViewMovie.image = UIImage(named: movie.image!)
        cell.labelPay.text = "\(movie.pay!)$"
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        
        return cell
    }

}

