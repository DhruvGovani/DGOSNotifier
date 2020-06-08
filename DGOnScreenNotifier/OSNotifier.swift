//
//  OSNotifier.swift
//  DGOnScreenNotifier
//
//  Created by Dhruv Govani on 06/06/20.
//  Copyright © 2020 Dhruv Govani. All rights reserved.
//

import Foundation
import UIKit

enum direction {
    case top, bottom
}

extension UIView{
    
    /**
     ParantView will be : self.view, this function will initialize the view.
     */
    func initOSNotifier(ParantView : UIView, BackgroundColor : UIColor, AppearFrom : direction, TextColor : UIColor){
        
        switch AppearFrom {
        case .bottom:
             self.frame = CGRect(x: 15, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width - 30, height: 50)
        case .top:
             self.frame = CGRect(x: 15, y: 0, width: UIScreen.main.bounds.width - 30, height: 50)
        }
        
        self.backgroundColor = BackgroundColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.alpha = 0
        
        let icon = UIImageView()
        icon.frame = CGRect(x: 12, y: 10, width: 30, height: 30)
        icon.image = UIImage()
        icon.contentMode = .scaleAspectFit
        self.addSubview(icon)
        
        
        let title = UILabel()
        
        title.frame = CGRect(x: 12 + icon.frame.width + 8 , y: 10, width: self.frame.width - icon.frame.width - 28, height: self.frame.height - 20)
        
        title.numberOfLines = 0
        title.textColor = TextColor
        title.lineBreakMode = .byClipping
        title.text = "default"
        title.textAlignment = .left
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.25
        title.numberOfLines = 0
        title.layoutIfNeeded()
        
        self.addSubview(title)
        
    }
    /**
    ParantView will be : self.view, this function will show and hide the notifier with animations
    */
    func showOSNotifier(to : direction,ParantView : UIView, Title : String, Image: UIImage){
        
         var startPos : CGFloat = 0
        
        for subview in self.subviews{
            if subview.tag == 0
            {
                if let label = subview as? UILabel {
                    label.text = Title
                }
                
                if let icon = subview as? UIImageView{
                    icon.image = Image
                }
            }
        }
        
        switch to {
        case .top:
            startPos = ParantView.safeAreaLayoutGuide.layoutFrame.minY + 10
        case .bottom:
            startPos = ParantView.safeAreaLayoutGuide.layoutFrame.maxY - 70
        }
        
        var defaultPos : CGFloat = 0
        
        switch to {
        case .top:
            defaultPos = 0
        case .bottom:
            defaultPos = UIScreen.main.bounds.height
        }
        
        UIView.transition(with: ParantView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.alpha = 1
             self.frame = CGRect(x: 15, y: startPos, width: UIScreen.main.bounds.width - 30, height: 50)
           
        }) { (_) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                UIView.transition(with: ParantView, duration: 0.3, options: .curveEaseOut, animations: {
                    self.alpha = 0
                }) { (_) in
                    
                    self.frame = CGRect(x: 15, y: defaultPos, width: UIScreen.main.bounds.width - 30, height: 50)
                }
                
            }
            
        }
        
        
    }
    

}
