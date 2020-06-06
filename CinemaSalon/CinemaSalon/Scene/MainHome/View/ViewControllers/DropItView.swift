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
        let size = bounds.size.width - 100 / CGFloat(dropsPerRow)
        return CGSize(width: size, height: 55)
    }
    
    func addDrop() {
        
        var frame = CGRect.init(origin: CGPoint(x: 60, y: 0), size: dropSize)
        frame.origin.x = CGFloat.random(max: dropsPerRow) * dropSize.width
        
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
    }
}
