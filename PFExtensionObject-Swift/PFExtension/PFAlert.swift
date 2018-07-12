//
//  PFAlert.swift
//  TableViewDemo
//
//  Created by guo-pf on 2018/6/26.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit

fileprivate protocol AlertPro {

    var alertController: UIAlertController? { get set }
    var textValue : String? { get set }
    var clickComletion: ((Any?,NSInteger)->Void)? { get set }

}

extension AlertPro where Self : Any {
    fileprivate func proAlert(_ title : String ,_ message: String ,_ style : UIAlertControllerStyle) -> Self {
        var newSelf = self
        newSelf.alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        return newSelf
    }
    
    func proText(_ title : String, _ placeholder: String,_ secure:Bool,_ comletion: @escaping(_ textfield:UITextField)->()) -> Self{
        let newSelf = self
        guard newSelf.alertController?.preferredStyle == .alert else{
            return newSelf
        }
        newSelf.alertController?.addTextField(configurationHandler: { (textField) in
            textField.text = title
            textField.placeholder = placeholder
            textField.isSecureTextEntry = secure
            comletion(textField)
        })
        
        return newSelf
    }
    func proText(_ textField : UITextField,_ comletion: @escaping(_ textfield:UITextField)->()) -> Self {
        let newSelf = self
        guard newSelf.alertController?.preferredStyle == .alert else{
            return newSelf
        }
        newSelf.alertController?.addTextField(configurationHandler: { myTextField in
            myTextField.copy(textField)
            comletion(myTextField)
        })
        return newSelf
    }
    
    fileprivate func proAction(_ title : String, _ style: UIAlertActionStyle) -> Self {
        var newSelf = self
        guard newSelf.alertController?.preferredStyle == .alert else{
            return newSelf
        }
         let action = UIAlertAction(title: title, style: style) {  action in
            newSelf.clickComletion!(newSelf.textValue,(newSelf.alertController?.actions.index(of: action))!)
            newSelf.clickComletion = Optional.none
            newSelf.alertController = Optional.none
        }
        newSelf.alertController?.addAction(action)
        return newSelf
    }
    
    fileprivate func proActionClicked(_ comletion: @escaping(_ value:Any?, _ index: NSInteger)->()){
        var newSelf = self
        newSelf.clickComletion = comletion
        currentViewController()?.present(newSelf.alertController!, animated: true, completion: {
            
        })
    }
    
    fileprivate func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController
        {
            return currentViewController(base: nav.visibleViewController)
            
        }
        if let tab = base as? UITabBarController
        {
            return currentViewController(base: tab.selectedViewController)
            
        }
        if let presented = base?.presentedViewController
        {
            return currentViewController(base: presented)
            
        }
        return base
        
    }
    
 
    
}

class PFAlert: PFAction {
    
    deinit {
          print()
    }
    func alert(_ title : String ,_ message: String ,_ style : UIAlertControllerStyle) -> PFAction{
        return proAlert(title, message, style)
    }

}


class PFAction :NSObject, UITextFieldDelegate, AlertPro  {
    deinit {
        print()
        clickComletion = Optional.none
        alertController = Optional.none
    }
    fileprivate var clickComletion: ((Any?,NSInteger)->Void)?
    

    //var clickComletion =  ((Any?, NSInteger) -> ()).self
    

 //   fileprivate var comletion: (Any?, NSInteger) -> ()?

    
    fileprivate var textValue: String?
    
    fileprivate var alertController: UIAlertController?
    
    func addText(_ title : String, _ placeholder: String,_ secure:Bool) -> PFAction? {
        return proText(title, placeholder, secure, { (textField) in
            textField.delegate = self
        })
    }
    func addText(_ textField : UITextField) -> PFAction? {
        return proText(textField, { (textField) in
            textField.delegate = self
        })
    }
    
    func addAction(_ title : String, _ style: UIAlertActionStyle) -> PFAction? {
        return proAction(title, style)
    }
    func actionClicked(_ comletion: @escaping(_ value:Any? ,_ index: NSInteger)->()) {
        proActionClicked(comletion)
    //  clickComletion = comletion
    }
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        textValue = textField.text
    }
    
}












