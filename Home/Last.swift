// Last
//  Copyright © 2020 Darakson. All rights reserved.
//------------------------Refractor Status : Completed-----------------------------------------------
//Importing essintial dependencies and frameworks here
import UIKit // For UI
import AVFoundation // To draw Circles
import CocoaMQTT // To connect to the car wirelessly
import Firebase // for linking the project with firebase.

//----------------The circles-------------------------
class CcircleView2:UIView{
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let radius: Double  = 40
        let center = CGPoint(x: 40, y: rect.height / 2)
        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y ))
        for i in stride(from: 0, to: 361.0, by: 8){
            let radians = i * Double.pi / 100
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
        
            path.addLine(to: CGPoint(x: x, y: y))
        }
        UIColor.init(red: 99/255, green: 73/255, blue: 71/255, alpha:1.0).setFill()
        path.fill()
    }
    
}
class CcView2:UIView{
    let path = UIBezierPath()
    override func draw(_ rect: CGRect) {
        let radius: Double  = 15
        let center = CGPoint(x: 40, y: rect.height / 2)
        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y ))
        for i in stride(from: 0, to: 361.0, by: 8){
            let radians = i * Double.pi / 100
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
        
            path.addLine(to: CGPoint(x: x, y: y))
        }
        UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).setFill()
        path.fill()
    }
}

class Last: UIViewController {
    
//---------------All the Buttons initialized here----------------------------------------------

    @IBOutlet weak var Bigcloud2: UIImageView!//The cloud that we type on
    
    @IBOutlet weak var Label2: UILabel!
    
    @IBOutlet weak var Backtolearn: UIButton!// The button that returns user to the learn page
    
    @IBOutlet weak var Print2: UIButton!//just the print viewcontrooler
    
    @IBOutlet weak var Store2: UIButton!//just the Store viewcontrooler
    
    @IBOutlet weak var ifu: UILabel!//The label that repressend last talk!
    
    @IBOutlet weak var ifu2: UILabel!//The label that repressend the two choices!
    
    @IBOutlet weak var abovecloud: UIImageView!// the  cloud that give a chiled two choices
    
    
//This method animates all the button to give them the spring effect
           func animateButton(_ viewA: UIView){
               UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: .curveEaseIn, animations: {
                       viewA.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
                   }){(_) in }
               
               UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
                       viewA.transform = CGAffineTransform(scaleX: 1, y: 1)
                   }, completion: nil)
               }
//to animate the typing effect of the words

//------------------The main---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundDisplay()//Display the moving background
        mrRobot()// Draw Mr.Robot
        blinkeye() //Let Mr.Robot blink!!! ^_~

//---------------hide all the icons first, then let the appear as wanted----------------------------------
    //Buttons respinsible for diplaying text
    Bigcloud2.alpha = 1.0
    ifu.alpha = 1.0
    ifu2.alpha = 1.0
    abovecloud.alpha = 1.0

        
    Print2.alpha = 1.0//Going to the Print page
    Store2.alpha = 1.0//Going to the Store page
    Backtolearn.alpha = 1.0//Going to the learn page
        
//-----------View all the Scene however some are transparents so that they don't get in the way--------------

    view.addSubview(Bigcloud2)
    view.addSubview(abovecloud)
    view.addSubview(ifu)
    view.addSubview(ifu2)
    view.addSubview(Print2)
    view.addSubview(Store2)
    view.addSubview(Backtolearn)
        
     
    }
  //-----------------------Functions responsible for displaying the background and drawing Mr Robot------------
    //The background function for the level
        func backgroundDisplay(){
            // the background of the view
            let backview = UIView()
            backview.frame.size = CGSize(width: 500, height: 1000)
            backview.center = view.center
            view.addSubview(backview)
            
            // Animating the background to move
            let gradient = CAGradientLayer(layer: backview.layer)
            gradient.colors = [UIColor.init(red: 181/255, green: 220/255, blue: 255/255, alpha: 1.0).cgColor ,UIColor.init(red: 255/255, green: 198/255, blue: 181/255, alpha: 1.0).cgColor]
            gradient.startPoint = CGPoint(x:0, y:0)
            gradient.endPoint = CGPoint(x:0, y:1.0)
            gradient.frame = backview.bounds
            gradient.locations = [0, 0.6]
            backview.layer.insertSublayer(gradient, at: 0)
            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [0, 0.6]
            animation.toValue = [0, 2]
            animation.autoreverses = true
            animation.repeatCount = Float.infinity
            animation.speed = 0.2
            gradient.add(animation, forKey: nil)
        }
//Drawing Mr Robot
        func mrRobot(){
            //Head of Mr.Robot
            let head = UIView(frame: CGRect(x: 94, y: 300, width:240, height:180 ) )
            head.backgroundColor = UIColor.init(red: 206/255, green: 236/255, blue: 242/255, alpha: 1.0)
            view.addSubview(head)
                
            //head details
            let cap = UIView(frame: CGRect(x: 150, y: 290, width:100, height: 10 ) )
            cap.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 107/255, alpha: 1.0)
            view.addSubview(cap)
                
            //neck
            let neck = UIView(frame: CGRect(x: 190, y: 480, width:50, height: 40 ) )
            neck.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 107/255, alpha: 1.0)
            view.addSubview(neck)
                
            //Neck details
            var x = 485
            for _ in 1...4{
                let stripe = UIView(frame: CGRect(x: 190, y: x, width:50, height: 3 ) )
                stripe.backgroundColor = UIColor.init(red: 224/255, green: 215/255, blue: 215/255, alpha: 1.0)
                x = x + 10
                view.addSubview(stripe)
            }
                
            //Body of Mr.Robot
            let body = UIView(frame: CGRect(x: 87, y: 510, width:255, height:90 ) )
            body.backgroundColor = UIColor.init(red: 206/255, green: 236/255, blue: 242/255, alpha: 1.0)
            view.addSubview(body)

            //eyes of Mr.Robot
            let eye1 = circleView(frame: CGRect(x: 110, y: 360, width: 100, height: 100 ) )
            eye1.backgroundColor = UIColor(white: 1, alpha: 0.0)
            view.addSubview(eye1)
                
            let eye2 = circleView(frame: CGRect(x: 240, y: 360, width: 100, height: 100 ) )
            eye2.backgroundColor = UIColor(white: 1, alpha: 0.0)
            view.addSubview(eye2)
                
            //Eye bling
            let bling1 = cView(frame: CGRect(x: 90, y: 350, width: 100, height: 100 ) )
            bling1.backgroundColor = UIColor(white: 1, alpha: 0.0)
            view.addSubview(bling1)
                
            let bling2 = cView(frame: CGRect(x: 220, y: 350, width: 100, height: 100 ) )
            bling2.backgroundColor = UIColor(white: 1, alpha: 0.0)
            view.addSubview(bling2)
                
            //Antena
            let antena = UIView(frame: CGRect(x: 170, y: 220, width: 3, height: 70 ) )
            antena.backgroundColor =  UIColor.init(red: 99/255, green: 73/255, blue: 71/255, alpha:1.0)
            view.addSubview(antena)
        }
//Mr.Robots Eye blinking, P.s We all blink if you don't the please get that checked
        func blinkeye(){
            //The eyelids blinking ^_^
            let eyeb = UIView(frame: CGRect(x: 50, y: 330, width:90,height:60 ) )
            eyeb.backgroundColor = UIColor.init(red: 206/255, green: 236/255,blue: 242/255, alpha: 1.0)
            view.addSubview(eyeb)
            let eyeb2 = UIView(frame: CGRect(x: 100, y: 330, width:90,height:60 ) )
            eyeb2.backgroundColor = UIColor.init(red: 206/255, green:236/255, blue: 242/255, alpha: 1.0)
            view.addSubview(eyeb2)
            let startPoint1 = CGPoint(x: 150, y: 333)
            let endpoint1 = CGPoint(x: 150, y: 395)
            let startPoint2 = CGPoint(x: 280, y: 333)
            let endpoint2 = CGPoint(x: 280, y: 395)
            let duration: Double = 1.9
            let animate1 = constructAnimation(starting: startPoint1, ending:endpoint1, duration: duration)
            let animate2 = constructAnimation(starting: startPoint2, ending:endpoint2, duration: duration)
            eyeb.layer.add(animate1, forKey: "position")
            eyeb2.layer.add(animate2, forKey: "position")
        }
//This is the function that lets the eyelids of Mr.Robot Blink
        func constructAnimation(starting: CGPoint, ending: CGPoint, duration:Double) -> CABasicAnimation{
            let postion = CABasicAnimation(keyPath: "position")
            postion.fromValue = NSValue(cgPoint: starting)
            postion.toValue = NSValue(cgPoint: ending)
            postion.duration = duration
            postion.autoreverses = true
            postion.repeatCount = Float.infinity
            postion.speed = 2.0
            return postion
        }

    @IBAction func backToLearn(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "Learnpage") as! Learnpage
                                                                         
        self.navigationController?.pushViewController(storyboard, animated: true)
        storyboard.navigationItem.hidesBackButton = true
    }
    
}
