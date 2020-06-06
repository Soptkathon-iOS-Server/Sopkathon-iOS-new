//
//  MainVC.swift
//  CinemaSalon
//
//  Created by elesahich on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var dropView: DropItView! {
        didSet {
            dropView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addDrop(recognizer: ))))
            dropView.backgroundColor = UIColor.black
        }
    }
    
    var isDarkStatusBar = false {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - viewDidLoad~~~
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        setNavigationBar()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dropView.animating = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dropView.animating = false
    }
}

extension MainVC {
    
    @objc func addDrop(recognizer: UIGestureRecognizer) {
        if recognizer.state == .ended {
            dropView.addDrop()
        }
    }
    
    func setNavigationBar() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        guard let titleImage = UIImage(named: "mainBtnLogo") else { return }
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.contentMode = .scaleAspectFill
        
        let searchButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "mainBtnSearch"),
                                                                    style: .plain,
                                                                    target: self,
                                                                    action: #selector(sendSearchView))
        
        self.navigationItem.titleView = titleImageView
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func sendSearchView() {
        guard let vc = storyboard?.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
