//
//  DropItView.swift
//  CinemaSalon
//
//  Created by elesahich on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class DropItView: UIView {
    
    private let gravity = UIGravityBehavior()
    private let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(gravity)
                animator.addBehavior(collider)
                
            } else {
                animator.removeBehavior(gravity)
                animator.removeBehavior(collider)
            }
        }
    }
    
    private let dropsPerRow = 1
    
    private var dropSize: CGSize {
//        let size = bounds.size.width - 100 / CGFloat(dropsPerRow)
        return CGSize(width: 191.3, height: 46.7)
    }
    
    func addDrop() {
        
        var frame = CGRect.init(origin: CGPoint(x: 0, y: 0), size: dropSize)
        frame.origin.x = CGFloat(100 + arc4random() % 20 )
        
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        addSubview(drop)
        
        let imageView = UIImageView(frame: frame)
        imageView.frame = CGRect.init(x: 0, y: 0, width: drop.frame.width, height: drop.frame.height)
        imageView.contentMode = .scaleAspectFill
        
        let image: [UIImage?] = [UIImage(named: "yellow"), UIImage(named: "blue"), UIImage(named: "green"), UIImage(named: "pink")]
        let constant: Int = Int(arc4random() % 4)
        imageView.image = image[constant]
        
        drop.addSubview(imageView)
        gravity.addItem(drop)
        collider.addItem(drop)
    }
}
