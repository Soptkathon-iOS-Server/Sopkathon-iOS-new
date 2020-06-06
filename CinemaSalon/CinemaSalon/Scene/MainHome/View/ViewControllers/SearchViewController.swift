//
//  SearchViewController.swift
//  CinemaSalon
//
//  Created by elesahich on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        view.backgroundColor = UIColor.black
    }
}

extension SearchViewController {
    
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
