//
//  PFUITextFieldExtension.swift
//  TableViewDemo
//
//  Created by guo-pf on 2018/7/3.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit

extension UITextField:UITextFieldDelegate{
    
    private struct AssociatedKeys {
        static var textFieldBeginEditActionKey = "pf_textFieldBeginEditActionKey"
        static var textFieldEndEditActionKey = "pf_textFieldEndEditActionKey"
        static var textFieldChangeEditActionKey = "pf_textFieldChangeEditActionKey"
        static var shouldClearActionKey = "pf_textFieldShouldClearActionKeyActionKey"
        static var shouldReturnActionKey = "pf_textFieldShouldReturnActionKey"
        
        static var isShouldBeginEditActionKey = "pf_textFieldIsShouldBeginEditActionKey"
        static var isShouldEndEditActionKey = "pf_textFieldIsShouldEndEditActionKey"
        static var isShouldClearActionKey = "pf_textFieldIsShouldClearActionKeyActionKey"
        static var isShouldReturnActionKey = "pf_textFieldIsShouldReturnActionKey"
    }
    
    private var isShouldBeginEdit : Bool?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isShouldBeginEditActionKey, newValue as Bool? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.isShouldBeginEditActionKey) as? Bool?
            {
                return action
            }
                return nil
        }
    }
    private var isShouldEndEdit : Bool?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isShouldEndEditActionKey, newValue as Bool? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.isShouldEndEditActionKey) as? Bool?
            {
                return action
            }
            return nil
        }
    }
    private var isShouldClear : Bool?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isShouldClearActionKey, newValue as Bool? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.isShouldClearActionKey) as? Bool?
            {
                return action
            }
            return nil
        }
    }
    private var isShouldReturn : Bool?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isShouldReturnActionKey, newValue as Bool? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.isShouldReturnActionKey) as? Bool?
            {
                return action
            }
            return nil
        }
    }
    
    private var shouldClearAction : ((UITextField) -> Void)?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.shouldClearActionKey, newValue as ((UITextField) -> Void)? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.shouldClearActionKey) as? ((UITextField) -> Void)?
            {
                return action
            }
            return nil
        }
    }
    private var shouldReturnAction : ((UITextField) -> Void)?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.shouldReturnActionKey, newValue as ((UITextField) -> Void)? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.shouldReturnActionKey) as? ((UITextField) -> Void)?
            {
                return action
            }
            return nil
        }
    }
    
    
    
    private var beginEditAction : ((UITextField) -> Void)?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.textFieldBeginEditActionKey, newValue as ((UITextField) -> Void)? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.textFieldBeginEditActionKey) as? ((UITextField) -> Void)?
            {
                return action
            }
            return nil
        }
    }
    private var endEditAction : ((UITextField) -> Void)?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.textFieldEndEditActionKey, newValue as ((UITextField) -> Void)? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.textFieldEndEditActionKey) as? ((UITextField) -> Void)?
            {
                return action
            }
            return nil
        }
    }
    private var changeEditAction : ((UITextField,NSRange,String) -> Void)?  {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.textFieldChangeEditActionKey, newValue as ((UITextField,NSRange,String) -> Void)? , .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.textFieldChangeEditActionKey) as? ((UITextField,NSRange,String) -> Void)?
            {
                return action
            }
            return nil
        }
    }
    
    func pf_text(_ text: String,_ placeholder : String?,_ color: UIColor?,_ font:CGFloat? = nil,_ bold:Bool? = false) {
        pf_text(text,color)
        if font != nil {
            pf_font(font!,bold)
        }
        if placeholder != nil {
             self.placeholder = placeholder
        }
        
    }
    func pf_font(_ font: CGFloat,_ bold:Bool? = false) {
        guard bold != nil else {
            self.font = UIFont.systemFont(ofSize: font)
            return
        }
        if bold! {
             self.font = UIFont.boldSystemFont(ofSize: font)
        }else{
            self.font = UIFont.systemFont(ofSize: font)
        }
        
    }
    
    func pf_text(_ text: String,_ color: UIColor?) {
        pf_text(text)
        if color != nil {
            self.textColor = color
        }
        
    }
    func pf_textFieldDelegate(_ delegate : UITextFieldDelegate){
        self.delegate = delegate
    }
    
    func pf_text(_ text: String) {
        self.text = text
    }
    func pf_placeholder(_ placeholder : String) {
        self.placeholder = placeholder
    }
    func pf_borderStyle(_ borderStyle: UITextBorderStyle )  {
        self.borderStyle = borderStyle
    }
    func pf_isSecureTextEntry(_ isSecureTextEntry: Bool)  {
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    func pf_textEdit(_ shouldBegin:Bool,beginEdit:@escaping (_ t: UITextField)->(),
                         chageEdit:@escaping (_ t: UITextField,_ r :NSRange,_ s :String)->(),
                         _ shouldEnd:Bool, didEndEdit:@escaping (_ t: UITextField)->()) {
        self.delegate = self
        self.isShouldBeginEdit = shouldBegin
        self.isShouldEndEdit = shouldEnd
        
        self.beginEditAction = beginEdit
        self.changeEditAction = chageEdit
        self.endEditAction = didEndEdit
    }
    func pf_textClearAndReturn(_ clearMode:UITextFieldViewMode,
                               _ clear:Bool,shouldClear:@escaping (_ t: UITextField)->(),
                               _ returnType: UIReturnKeyType ,
                               _ isReturn:Bool, shouldReturn:@escaping (_ t: UITextField)->()) {
        
        self.returnKeyType = returnType
        self.clearButtonMode = clearMode
        self.isShouldClear = clear
        self.isShouldReturn = isReturn
        self.shouldClearAction = shouldClear
        self.shouldReturnAction = shouldReturn
//        UIApplication.shared.keyWindow?.endEditing(true)
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return isShouldBeginEdit ?? false
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        guard beginEditAction != nil else{
            return
        }
        beginEditAction!(textField)
    }
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return isShouldEndEdit ?? false
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard endEditAction != nil else{
            return
        }
        endEditAction!(textField)
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        guard changeEditAction != nil else{
            return false
        }
        changeEditAction!(textField,range,string)
        return true
        
    }
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        guard shouldClearAction != nil else{
            return false
        }
        shouldClearAction!(textField)
        return isShouldClear ?? false
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard shouldReturnAction != nil else{
            return false
        }
        shouldReturnAction!(textField)
        self.resignFirstResponder()
        
        return isShouldReturn ?? false
    }
    
  
}

//extension UIViewController {
//   public class func initializeMethod() {
//        let originalSelector = #selector(UIViewController.viewDidAppear(_:))
//        let swizzledSelector = #selector(UIViewController.myMethod(animated:))
//        let originalMethod = class_getInstanceMethod(self, originalSelector)
//        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
//        //在进行 Swizzling 的时候,需要用 class_addMethod 先进行判断一下原有类中是否有要替换方法的实现
//        let didAddMethod: Bool = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
//        //如果 class_addMethod 返回 yes,说明当前类中没有要替换方法的实现,所以需要在父类中查找,这时候就用到 method_getImplemetation 去获取 class_getInstanceMethod 里面的方法实现,然后再进行 class_replaceMethod 来实现 Swizzing
//        if didAddMethod {
//            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
//        }
//        else {
//            method_exchangeImplementations(originalMethod!, swizzledMethod!)
//
//        }
//
//    }
//    @objc func myMethod(animated: Bool) {
//        self.myMethod(animated: animated)
//
//    }
//}

    

