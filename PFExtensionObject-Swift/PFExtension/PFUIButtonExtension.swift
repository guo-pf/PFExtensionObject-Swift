//
//  PFUIButtonExtension.swift
//  TableViewDemo
//
//  Created by guo-pf on 2018/7/3.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit

extension UIButton{
    private struct AssociatedKeys {
        static var selectedActionKey = "pf_btnSelectedActionKey"
    }
    private var selectedAction : ((UIButton) -> Void)?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.selectedActionKey, newValue as ((UIButton) -> Void)? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
        } get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.selectedActionKey) as? ((UIButton) -> Void)?
            {
                return action
                
            }
            return nil
            
        }
        
    }
    
    func pf_title(_ title: String,_ state:UIControlState? = .normal,_ font: CGFloat? = nil,_ bold:Bool? = false) {
        self.setTitle(title, for: state!)
        if font != nil {
            pf_titleFont(font!, bold)
        }
    }
    func pf_titleFont(_ font: CGFloat,_ bold:Bool? = false) {
        if bold! {
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: font)
        }else{
            self.titleLabel?.font = UIFont.systemFont(ofSize: font)
        }
        
    }
    func pf_titleColor(_ color: UIColor,_ state:UIControlState? = .normal) {
        self.setTitleColor(color, for: state!)
    }
    func pf_titleShadowColor(_ color: UIColor,_ state:UIControlState? = .normal) {
        self.setTitleShadowColor(color, for: state!)
    }
    func pf_bcImage(_ image:UIImage,_ state:UIControlState? = .normal) {
        self.setBackgroundImage(image, for: state!)
    }
    func pf_lineBreakMode(_ breakModel :NSLineBreakMode) {
        self.titleLabel?.lineBreakMode = breakModel
    }
    func pf_enable(_ isEnabled:Bool,_ isUserInteractionEnabled:Bool){
        self.isEnabled = isEnabled
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }
    func pf_image(_ image: UIImage , _ controlState:UIControlState? = .normal) {
        self.setImage(image, for: controlState!)
    }
    func pf_backImage(_ image: UIImage , _ controlState:UIControlState? = .normal) {
        self.setBackgroundImage(image, for: controlState!)
    }
    func pf_selectStatus(_ adjustsImageWhenHighlighted: Bool,
                        _ adjustsImageWhenDisabled:Bool) {
        self.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted //使触摸模式下按钮也不会变暗（半透明）
        self.adjustsImageWhenDisabled = adjustsImageWhenDisabled //使禁用模式下按钮也不会变暗（半透明）
    }
    func pf_titleImage(_ image: UIImage?,
                       _ title: String,
                       _ titlePosition: UIViewContentMode,
                       _ additionalSpacing: CGFloat,
                       _ state: UIControlState? = .normal){
        
        self.imageView?.contentMode = .center
        self.setImage(image, for: state!)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state!)
        
    }
    
    
    func pf_addTarget(_ target: Any?,_ action: Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }
   
    
    func pf_ButtonDisSelected(_ btnSelectedAction:@escaping (_ button:UIButton) -> ()) {
        selectedAction = btnSelectedAction
        pf_addTarget(self, #selector(btnClickFun(sender:)))
        
    }
    @objc private func btnClickFun(sender:UIButton?){
        let newSelf = self
        guard selectedAction != nil else{
            return
        }
        selectedAction!(newSelf)
        
    }
    
}
extension UIButton{
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}



