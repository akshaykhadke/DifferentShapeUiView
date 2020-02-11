//
//  ViewController.swift
//  DifferentUiViewShape
//
//  Created by Akshay Khadke on 11/02/20.
//  Copyright © 2020 Akshay Khadke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var triangle4: UIView!
    @IBOutlet weak var triangle3: UIView!
    @IBOutlet weak var triangle2: UIView!
    @IBOutlet weak var triangle1: UIView!
    @IBOutlet weak var bottomCurvView: UIView!
    @IBOutlet weak var topCurvView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.topCurvView.addTopRoundedCornerToView(targetView: self.topCurvView, desiredCurve: 2)
        self.bottomCurvView.addBottomRoundedCornerToView(targetView: self.bottomCurvView, desiredCurve: 2)
        self.triangle1.setUpTriangle(targetView: self.triangle1)
        self.triangle2.setDownTriangle(targetView: self.triangle2)
        self.triangle3.setLeftTriangle(targetView: self.triangle3)
        self.triangle4.setRightTriangle(targetView: self.triangle4)
    }


}

//UIView with only one diagonal side
class CustomView: UIView {

// Only override draw() if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
override func draw(_ rect: CGRect) {
    // Drawing code
    // Get Height and Width
    //let layerHeight = layer.frame.height
    let layerWidth = layer.frame.width
    // Create Path
    let bezierPath = UIBezierPath()
    //  Points
    let pointA = CGPoint(x: 0, y: 30)
    let pointB = CGPoint(x: 20, y: 0)
    let pointC = CGPoint(x: layerWidth, y: 0)
    let pointD = CGPoint(x: layerWidth, y:30)
    // Draw the path
    bezierPath.move(to: pointA)
    bezierPath.addLine(to: pointB)
    bezierPath.addLine(to: pointC)
    bezierPath.addLine(to: pointD)
    bezierPath.close()
    // Mask to Path
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = bezierPath.cgPath
    layer.mask = shapeLayer
}
}


//TopRoundedCornerToView, BottomRoundedCornerToView ,TriangleView

extension UIView {

func addTopRoundedCornerToView(targetView:UIView?, desiredCurve:CGFloat?)
{
    let offset:CGFloat =  targetView!.frame.width/desiredCurve!
    let bounds: CGRect = targetView!.bounds

    //Top side curve
    let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)
    
    let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
    
    //Top side curve
    let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
    
    let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
    rectPath.append(ovalPath)

    // Create the shape layer and set its path
    let maskLayer: CAShapeLayer = CAShapeLayer()
    maskLayer.frame = bounds
    maskLayer.path = rectPath.cgPath

    // Set the newly created shape layer as the mask for the view's layer
    targetView!.layer.mask = maskLayer
}
    
    func setTopCurve(){
           let offset = CGFloat(self.frame.size.height/4)
           let bounds = self.bounds
           let rectBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y + bounds.size.height/2  , width:  bounds.size.width, height: bounds.size.height / 2)
        
           let rectPath = UIBezierPath(rect: rectBounds)
           
         let ovalBounds = CGRect(x: bounds.origin.x , y: bounds.origin.y - offset / 2, width: bounds.size.width + offset, height: bounds.size.height)
           let ovalPath = UIBezierPath(ovalIn: ovalBounds)
       rectPath.append(ovalPath)

           let maskLayer = CAShapeLayer.init()
           maskLayer.frame = bounds
           maskLayer.path = rectPath.cgPath
           self.layer.mask = maskLayer
       }
    
    func addBottomRoundedCornerToView(targetView:UIView?, desiredCurve:CGFloat?)
    {
        let offset:CGFloat =  targetView!.frame.width/desiredCurve!
        let bounds: CGRect = targetView!.bounds

        //Bottom side curve
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)

        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        
        //Bottom side curve
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        targetView!.layer.mask = maskLayer
    }
        
        func setBottomCurve(){
               let offset = CGFloat(self.frame.size.height/4)
               let bounds = self.bounds
               
            let rectBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y  , width:  bounds.size.width, height: bounds.size.height / 2)
               let rectPath = UIBezierPath(rect: rectBounds)
               let ovalBounds = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
            
               let ovalPath = UIBezierPath(ovalIn: ovalBounds)
           rectPath.append(ovalPath)

               let maskLayer = CAShapeLayer.init()
               maskLayer.frame = bounds
               maskLayer.path = rectPath.cgPath
               self.layer.mask = maskLayer
           }
    
    func setRightTriangle(targetView:UIView?){
        let heightWidth = targetView!.frame.size.width //you can use triangleView.frame.size.height
        let path = CGMutablePath()

        path.move(to: CGPoint(x: heightWidth/2, y: 0))
        path.addLine(to: CGPoint(x:heightWidth, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth/2, y:heightWidth))
        path.addLine(to: CGPoint(x:heightWidth/2, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor

        targetView!.layer.insertSublayer(shape, at: 0)
    }
    
    func setLeftTriangle(targetView:UIView?){
        let heightWidth = targetView!.frame.size.width
        let path = CGMutablePath()

        path.move(to: CGPoint(x: heightWidth/2, y: 0))
        path.addLine(to: CGPoint(x:0, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth/2, y:heightWidth))
        path.addLine(to: CGPoint(x:heightWidth/2, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor

        targetView!.layer.insertSublayer(shape, at: 0)
    }
    
    func setUpTriangle(targetView:UIView?){
     let heightWidth = targetView!.frame.size.width
        let path = CGMutablePath()

        path.move(to: CGPoint(x: 0, y: heightWidth))
        path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth, y:heightWidth))
        path.addLine(to: CGPoint(x:0, y:heightWidth))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor

        targetView!.layer.insertSublayer(shape, at: 0)
    }
    
    func setDownTriangle(targetView:UIView?){
        let heightWidth = targetView!.frame.size.width
        let path = CGMutablePath()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth, y:0))
        path.addLine(to: CGPoint(x:0, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor

        targetView!.layer.insertSublayer(shape, at: 0)
    }
}

