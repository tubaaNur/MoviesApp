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
        
        let tasarım = UICollectionViewFlowLayout()
        tasarım.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarım.minimumInteritemSpacing = 10
        tasarım.minimumLineSpacing = 10
        
        // 10 X 10 X 10 = 30 BOŞLUK
        // 15X 15 X 15 x 15 = 50 BOŞLUK
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik-30) / 2
        
        tasarım.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        movieCollectionView.collectionViewLayout = tasarım
        
        
    }
}

extension HomePage : UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movieList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! MoviesCell
        cell.imageViewMovie.image = UIImage(named: movie.image!)
        let payTitle = String(localized: "payTitle", comment: "")
        cell.labelPay.text = "\(movie.pay!)" + payTitle
        let addToBasketTitle = String(localized:"addToBasket", comment: "")
        cell.addToBaskett.setTitle(addToBasketTitle, for: .normal)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        
        return cell
    }
    
    func sepeteEkleTikla(indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        print("\(movie.name!) sepete eklendi.")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: movie)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let film = sender as? Movies{
                
                let gidilecekVc = segue.destination as! DetailPage
                gidilecekVc.film = film
            }
        }
    }

}

