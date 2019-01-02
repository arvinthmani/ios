//
//  ViewController.swift
//  demoforiphone
//
//  Created by Arvinth  on 13/12/17.
//  Copyright © 2017 Arvinth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let basketView = UIView()
  let gravity = UIGravityBehavior()
  let collsion = UICollisionBehavior()
  let bounce = UIDynamicItemBehavior()

  var animator = UIDynamicAnimator()
  var eggView:UIView?
  var scoreNum: Int = 0
  var scoreNumLbl = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    animator = UIDynamicAnimator(referenceView: self.view)
    collsion.translatesReferenceBoundsIntoBoundary = true
    collsion.addBoundary(withIdentifier: "obstacle" as NSCopying, from: CGPoint(x:0, y:self.view.frame.height - 100), to: CGPoint(x:0, y:200))
    bounce.elasticity = 1
    self.gravity.magnitude = 0.2
    animator.addBehavior(gravity)
//    animator.addBehavior(self.collsion)
//    animator.addBehavior(bounce)
//    initBasketView()
    initEggView()
    
    let bgImageView = UIImageView()
    bgImageView.translatesAutoresizingMaskIntoConstraints = false
    bgImageView.image = #imageLiteral(resourceName: "bg")
    self.view.addSubview(bgImageView)
    bgImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    bgImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    bgImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    
    let scoreLbl = UILabel()
    scoreLbl.translatesAutoresizingMaskIntoConstraints = false
    scoreLbl.text = "Score: "
    self.view.addSubview(scoreLbl)
    scoreLbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
    scoreLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
    scoreLbl.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
    scoreNumLbl.translatesAutoresizingMaskIntoConstraints = false
    scoreNumLbl.text = "0"
    self.view.addSubview(scoreNumLbl)
    scoreNumLbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
    scoreNumLbl.leadingAnchor.constraint(equalTo: scoreLbl.trailingAnchor).isActive = true
    scoreNumLbl.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
    Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: {_ in
      self.increaseGravityMagnitude()
    })
  }
  
  func increaseGravityMagnitude() {
    self.gravity.magnitude += 0.2
  }
  
  func initBasketView() {
    basketView.translatesAutoresizingMaskIntoConstraints = false
    basketView.backgroundColor = .clear
    
    self.view.addSubview(basketView)
  
    let leading = basketView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
    leading.priority = UILayoutPriority(rawValue: 999)
    leading.isActive = true
    let trailing = basketView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -110)
    trailing.priority = UILayoutPriority(rawValue: 998)
    trailing.isActive = true
    basketView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
    basketView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    let width = basketView.widthAnchor.constraint(equalToConstant: 100)
    width.priority = UILayoutPriority(rawValue: 1000)
    width.isActive = true
  
    let basketImageView = UIImageView()
    basketImageView.translatesAutoresizingMaskIntoConstraints = false
    basketImageView.image = #imageLiteral(resourceName: "Basket")
    basketView.addSubview(basketImageView)
    basketImageView.topAnchor.constraint(equalTo: basketView.topAnchor).isActive = true
    basketImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    basketImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  func initEggView() {
    let timeOut = DispatchTime.now() + .milliseconds(500)
    
    DispatchQueue.main.asyncAfter(deadline: timeOut, execute: {
      self.eggView = UIView()
      let eggViewX = Int(arc4random_uniform(UInt32(self.view.frame.size.width)))
      self.eggView?.frame = CGRect(x: eggViewX, y: -10, width: 50, height: 60)
      self.view.addSubview((self.eggView)!)
      let eggImageView = UIImageView()
      eggImageView.translatesAutoresizingMaskIntoConstraints = false
      eggImageView.image = #imageLiteral(resourceName: "egg")
      self.eggView?.addSubview(eggImageView)
      eggImageView.centerXAnchor.constraint(equalTo: (self.eggView?.centerXAnchor)!).isActive = true
      eggImageView.centerYAnchor.constraint(equalTo: (self.eggView?.centerYAnchor)!).isActive = true
      eggImageView.topAnchor.constraint(equalTo: (self.eggView?.topAnchor)!).isActive = true
      eggImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
      eggImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
      
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.eggTapped))
      tapGesture.numberOfTapsRequired = 1
      tapGesture.numberOfTouchesRequired = 1

      self.eggView?.addGestureRecognizer(tapGesture)
      self.gravity.addItem((self.eggView)!)
//      self.collsion.addItem((self.eggView)!)
//      self.bounce.addItem((self.eggView)!)
      self.initEggView()
    })
  }
  
  @objc func eggTapped(sender : UITapGestureRecognizer) {
//    let alert = UIAlertController(title: "abc",
//                                  message: "cde",
//                                  preferredStyle: .alert)
//    self.present(alert, animated: true, completion: nil)
//    alert.view.addSubview(sender.view!)
    print(sender.view!)
    gravity.removeItem(sender.view!)
    for subView in sender.view!.subviews {
      let imageView: UIImageView = subView as! UIImageView
      imageView.image = #imageLiteral(resourceName: "omelet")
      scoreNum += 1
      scoreNumLbl.text = "\(scoreNum)"
    }
    
    UIView.animate(withDuration: 5, animations: {
      sender.view!.alpha = 0.0
    }, completion:{(Bool) in
      sender.view!.removeFromSuperview()
    } )
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    var greenViewCenter = basketView.center
    var point: CGPoint!
    if let touch = touches.first {
       point = touch.location(in: self.view)
    }
    greenViewCenter.x = point.x
    basketView.center = greenViewCenter
  }
  
}

