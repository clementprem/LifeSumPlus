//
//  ProgressOverlayViewController.swift
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

import UIKit
import ASProgressPopUpView

class ProgressOverlayViewController: UIViewController {

    @IBOutlet weak var progressBar: ASProgressPopUpView!
    
    override func viewDidLoad() {
        progressBar.popUpViewAnimatedColors = [UIColor.redColor(), UIColor.orangeColor(), UIColor.greenColor()];
        progressBar.popUpViewCornerRadius = 14.0;
        showProgressBar()
        progressBar.setProgress(0.01, animated: true);
    }
    
    func showProgressBar()  {
        self.progressBar.showPopUpViewAnimated(true);
    }
    
    func hideProgressBar() {
        self.progressBar.hidePopUpViewAnimated(true);
    }
    
    func setBarProgress(progress: Float) {
        self.progressBar.setProgress(progress, animated: true);
    }
    
}
