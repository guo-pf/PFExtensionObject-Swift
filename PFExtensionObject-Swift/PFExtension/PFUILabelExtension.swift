//
//  PFUILabelExtension.swift
//  TableViewDemo
//
//  Created by guo-pf on 2018/7/3.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit



extension UILabel{
    /** 文字neir */
    func pf_text(_ text:String,_ font:CGFloat? = nil,_ bold:Bool? = false ){
        self.text = text
        if font != nil {
            pf_font(font!, bold!)
        }
    }
    func pf_textColor(_ color: UIColor) {
        self.textColor = color
    }
    func pf_font(_ font: CGFloat,_ bold:Bool? = false)  {
        if bold! {
            self.font = UIFont.boldSystemFont(ofSize: font)
        }else{
            self.font = UIFont.systemFont(ofSize: font)
        }
    }
    func pf_alignment(_ alig:NSTextAlignment) {
        self.textAlignment = alig
    }
    func pf_numOfLines(_ num: NSInteger) {
        self.numberOfLines = num
    }
    func pf_adjustToWidth(_ layout:Bool) {
        self.adjustsFontSizeToFitWidth = layout
    }
    func pf_clips(_ clips:Bool) {
        self.clipsToBounds = clips
    }
    
    
}
