//
//  ViewExtension.swift
//  AVPlayerDemo
//
//  Created by guo-pf on 2018/6/15.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit



public protocol pf_makeObject {}



extension pf_makeObject where Self: Any {
     /**框架*/
    public func pf_makeObject( block: (inout Self) -> Void){
        var copy = self
        block(&copy)
    }
}

extension pf_makeObject where Self: AnyObject {
     /**框架*/
    public func pf_makeObject( block: (Self) -> Void) {
        block(self)
    }
}

extension NSObject: pf_makeObject {}

extension UIView{
    /**背景色*/
    func pf_backgroundColor(_ color:UIColor)  {
        self.backgroundColor = color;
    }
    /** frame */
    func pf_frame(_ x:CGFloat,_ y:CGFloat,_ w:CGFloat,_ h:CGFloat) {
        self.frame = CGRect(x: x, y: y, width: w, height: h);
    }
    /** 添加到父视图 */
    func pf_addTo(_ view:UIView) {
        view.addSubview(self)
    }
    /** 圆角大小 */
    func pf_coRadius(_ radius:CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    /** 边框设置 */
    func pf_border(_ color:UIColor,_ width:CGFloat) {
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}









