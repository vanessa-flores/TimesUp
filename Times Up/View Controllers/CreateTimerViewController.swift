//
//  AddEditTimerViewController.swift
//  Times Up
//
//  Created by Vanessa Flores on 10/19/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import UIKit

class CreateTimerViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var slideUpView: UIView!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slideUpView.layer.cornerRadius = 10
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}

// MARK: - UIViewControllerTransitioningDelegate

extension CreateTimerViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension CreateTimerViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return (touch.view === self.view)
    }
}
