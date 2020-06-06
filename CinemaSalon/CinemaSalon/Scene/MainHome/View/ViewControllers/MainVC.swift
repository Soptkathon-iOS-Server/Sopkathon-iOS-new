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
        }
    }
    
    @objc func addDrop(recognizer: UIGestureRecognizer) {
        if recognizer.state == .ended {
            dropView.addDrop()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
