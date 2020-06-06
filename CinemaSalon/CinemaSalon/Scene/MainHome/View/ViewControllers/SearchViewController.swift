//
//  SearchViewController.swift
//  CinemaSalon
//
//  Created by elesahich on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    var movieData: [UIImage?] = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6"),
        UIImage(named: "7"),
        UIImage(named: "8"),
        UIImage(named: "9"),
        UIImage(named: "10")
    ]
    
    //    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        
        searchCollectionView.backgroundColor = UIColor.red
        view.backgroundColor = UIColor.black
        
        setNavigationBar()
        setOtherSettings()
        
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UICollectionViewCell() }
    
        cell.movieImage.image = movieData[indexPath.item]
//                cell.bind(model: movieData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = 145
        let width = height * (98/145)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 3, left: 21, bottom: 0, right: 21)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath)
    }
}
extension SearchViewController {
    
    func setOtherSettings() {
        //        searchCollectionView.backgroundColor = UIColor.black
        //
        //        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
        //            textField.backgroundColor = UIColor.salonColor(.darkGrayColor)
        //
        //            let backgroundView = textField.subviews.first
        //            if #available(iOS 11.0, *) { // If `searchController` is in `navigationItem`
        //                backgroundView?.backgroundColor = UIColor.black //Or any transparent color that matches with the `navigationBar color`
        //                backgroundView?.subviews.forEach({ $0.removeFromSuperview() }) // Fixes an UI bug when searchBar appears or hides when scrolling
        //            }
        //            backgroundView?.layer.cornerRadius = 10.5
        //            backgroundView?.layer.masksToBounds = true
        //        }
    }
    
    func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        let settingsButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"),
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(popView))
        
        navigationItem.leftBarButtonItem = settingsButton
    }
    
    @objc func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}


public extension UISearchBar {
    
    func setStyleColor(_ color: UIColor) {
        tintColor = color
        guard let tf = (value(forKey: "searchField") as? UITextField) else { return }
        tf.textColor = color
        if let glassIconView = tf.leftView as? UIImageView, let img = glassIconView.image {
            let newImg = img.blendedByColor(color)
            glassIconView.image = newImg
        }
        if let clearButton = tf.value(forKey: "clearButton") as? UIButton {
            clearButton.setImage(clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            clearButton.tintColor = color
        }
    }
}

extension UIImage {
    
    public func blendedByColor(_ color: UIColor) -> UIImage {
        let scale = UIScreen.main.scale
        if scale > 1 {
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
        } else {
            UIGraphicsBeginImageContext(size)
        }
        color.setFill()
        let bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIRectFill(bounds)
        draw(in: bounds, blendMode: .destinationIn, alpha: 1)
        let blendedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return blendedImage!
    }
}
