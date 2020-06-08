//
//  ViewController.swift
//  DGOnScreenNotifier
//
//  Created by Dhruv Govani on 06/06/20.
//  Copyright © 2020 Dhruv Govani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let TopOSNotifierView = UIView()
    let BottomOSNotifierView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        TopOSNotifierView.frame = .zero
        self.view.addSubview(TopOSNotifierView)
        
        TopOSNotifierView.initOSNotifier(ParantView: self.view, BackgroundColor: .black, AppearFrom: .top, TextColor: .white)
        
        //Features : Auto Font Size, Multiline, Icon, Eyes boggling animation
        
        BottomOSNotifierView.frame = .zero
        self.view.addSubview(BottomOSNotifierView)

        BottomOSNotifierView.initOSNotifier(ParantView: self.view, BackgroundColor: .black, AppearFrom: .bottom, TextColor: .white)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Action(_ sender: Any) {
       
        TopOSNotifierView.showOSNotifier(to: .top, ParantView: self.view, Title: "Features : Auto Font Size, Multiline, Icon, Eyes boggling animation", Image: #imageLiteral(resourceName: "ok"))
        
        BottomOSNotifierView.showOSNotifier(to: .bottom, ParantView: self.view, Title: "DGOSNotifier", Image: #imageLiteral(resourceName: "info"))
    }
    
    @IBAction func button(_ sender: Any) {
        
//        MyView.hideOSNotifier(ParantView: self.view)
    }
    
    


}

