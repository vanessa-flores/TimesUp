//
//  CustomPickerView.swift
//  Times Up
//
//  Created by Vanessa Flores on 10/19/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import UIKit

class CustomPickerView: UIPickerView {
    
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return 60.0
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var label: UILabel
            
        if let view = view as? UILabel{
            label = view
        } else{
            label = UILabel()
        }
            
        label.textColor = UIColor.yellow
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica", size: 16)
        
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
            
            
        return label
    }
}
