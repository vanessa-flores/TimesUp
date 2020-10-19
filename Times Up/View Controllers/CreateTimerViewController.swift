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
    @IBOutlet private weak var timePicker: UIPickerView!
    @IBOutlet private weak var titleTextfield: UITextField!

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

// MARK: - UIPickerViewDataSource

extension CreateTimerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return CountdownTime.hours.count
        case 1:
            return CountdownTime.minutes.count
        case 2:
            return CountdownTime.seconds.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(CountdownTime.hours[row])"
        case 1:
            return "\(CountdownTime.minutes[row])"
        case 2:
            return "\(CountdownTime.seconds[row])"
        default:
            return ""
        }
    }
}

// MARK: - UIPickerViewDelegate

extension CreateTimerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hours = CountdownTime.hours[pickerView.selectedRow(inComponent: 0)]
        let minutes = CountdownTime.minutes[pickerView.selectedRow(inComponent: 1)]
        let seconds = CountdownTime.seconds[pickerView.selectedRow(inComponent: 2)]
        
        titleTextfield.text = "\(hours) hours \(minutes) minutes \(seconds) seconds"
    }
    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        <#code#>
//    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
            
        if let view = view as? UILabel{
            label = view
        } else{
            label = UILabel()
        }
            
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica", size: 16)
        
        switch component {
        case 0:
            label.text = "\(CountdownTime.hours[row])"
        case 1:
            label.text = "\(CountdownTime.minutes[row])"
        case 2:
            label.text = "\(CountdownTime.seconds[row])"
        default:
            label.text = ""
        }
        
        DispatchQueue.main.async {  // middle row
            if let label = pickerView.view(forRow: row, forComponent: component) as? UILabel {
                label.textColor = UIColor.blue
                label.font = UIFont(name: "Helvetica", size: 20)
                
                switch component {
                case 0:
                    label.text = "\(CountdownTime.hours[row]) hours"
                case 1:
                    label.text = "\(CountdownTime.minutes[row]) min"
                case 2:
                    label.text = "\(CountdownTime.seconds[row]) sec"
                default:
                    label.text = ""
                }
            }
        }
            
            
        return label
    }
}
