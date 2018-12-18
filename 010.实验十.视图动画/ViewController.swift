//
//  ViewController.swift
//  010.实验十.视图动画
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 李潘. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var totalView: UIView!
    lazy var animator = UIDynamicAnimator(referenceView: self.totalView)
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    var firstView: UIView!
    var secondView: UIView!
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
        // Do any additional setup after loading the view, typically from a nib.
        
       animation()
        
        transition()
       
        
    }
    //animation动画
    func animation() {
        let view = UIView(frame: CGRect(x: 300, y: 100, width: 100, height: 100))
        view.backgroundColor = UIColor.blue
        self.view.addSubview(view)
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {
            view.frame = CGRect(x: 0, y: 20, width: 10, height: 10)
            view.backgroundColor = UIColor.yellow
            view.transform = view.transform.rotated(by: CGFloat.pi)
        }, completion: nil)
    }
    //transition动画
    func transition() {
        let button = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 44))
        button.setTitle("切换视图", for: .normal)
        button.backgroundColor = UIColor.purple
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        self.view.addSubview(button)
        
        firstView = UIView(frame: CGRect(x: 100, y: 300, width: 150, height: 200))
        firstView.backgroundColor = UIColor.black
        self.view.addSubview(firstView)
        
        secondView = UIView(frame: CGRect(x: 100, y: 300, width: 150, height: 300))
        secondView.backgroundColor = UIColor.brown
        self.view.addSubview(secondView)
        
    }
    @objc func changeView() {
            UIView.transition(from: secondView, to: firstView, duration: 3, options: [.transitionCurlUp], completion: nil)
    }
    //dynamicAnimation动画
    @IBAction func addDy(_ sender: Any) {
        let width = Int(totalView.bounds.width / 10)
        //随机x位置
        let randx = Int(arc4random() % 10) * width
       // 图形
        let label = UILabel(frame: CGRect(x: randx, y: 0, width: width, height: width))
        label.backgroundColor = UIColor.red
        label.text = "H"
        label.textAlignment = .center
        totalView.addSubview(label)
        
        gravity.addItem(label)
        collision.addItem(label)
    }
    
}

