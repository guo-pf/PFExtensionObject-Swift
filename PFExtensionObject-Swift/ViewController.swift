//
//  ViewController.swift
//  PFExtensionObject-Swift
//
//  Created by guo-pf on 2018/7/12.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let textField = UITextField()
    let btn = UIButton(type: .custom)
    let alert = PFAlert()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**
         * Uilabel 里面只有部分属性，没有系统的全部给抽出来，因为感觉label其实并没有太大的意义。
         */
        label.pf_makeObject {
            $0.pf_frame(100, 80, 100, 50)
            $0.pf_text("nihao")
            $0.pf_textColor(.red)
            $0.pf_backgroundColor(.purple)
            $0.pf_font(15, true)
            $0.pf_alignment(.center)
            $0.pf_coRadius(8)
            $0.pf_addTo(self.view)
        }
        
        /**
         * UITextField  其中 pf_makeObject{}控件中通用 ，内部你影响源生代码的编写
         */
        textField.pf_makeObject {
            $0.pf_text("", "测试文本",.black)
            $0.pf_frame(100, 250, 100, 20)
            $0.pf_addTo(self.view)
            $0.pf_textEdit(true, beginEdit: { (T) in
                
            }, chageEdit: { (T, R, S) in
                
            }, true, didEndEdit: { (T) in
                
            })
            $0.pf_textClearAndReturn(.never, true, shouldClear: { (T) in
                
            }, .next, true, shouldReturn: { (T) in
                
            })
        }
        /**
         * Uibutton
         */
        
        btn.pf_makeObject {
            $0.pf_frame(100, 180, 100, 40)
            $0.pf_coRadius(20)
            $0.pf_title("测试按钮0")
            $0.pf_titleColor(.purple)
            $0.pf_titleFont(15)
            $0.pf_backgroundColor(.brown)
            $0.pf_addTo(self.view)
            $0.pf_ButtonDisSelected { (b) in
                /**
                 * UIAlertController
                 */
                self.alert.alert("提醒", "这是个测试ALERT", .alert)
                    .addText("", "ceshishuju", true)?//<------可以传一个自定义textfield
                    .addAction("取消", .cancel)?
                    .addAction("确定", .default)?
                    .actionClicked({ (v , i) in
                        print()
                    })
                //                self.alert.alert("提醒", "这是个测试ALERT", .alert)
                //                    .addAction("取消", .cancel)?
                //                    .addAction("确定", .default)?
                //                    .actionClicked({ (v , i) in
                //                        print()
                //                    })
            }
        }
        
        /**
         * 字符串截取
         */
        
        let  str = "abcdefghijklmn"
        let _ = str.comSeparatedByStrRangeStr("b", toStr: "g", isContain: .rightContain)
        let _ = str.comSeparatedByStrRangeIndex(2, toIndex: 7)
        let _ = str.comSeparatedByStrRangeIndex(2..<7)
        let _ = str.comSeparatedByStrRangeIndex(2...7)
        let _ = str.comSeparatedByStrRangeStr("c"..."k")
        let _ = str.comSeparatedByStrRangeStr("c"..<"k")
        
        /**
         *   IndexPath 判断
         **/
        let indexPath :IndexPath = IndexPath(row: 2, section: 4)
        //意思是 第1组的3或者5 或者是第2组的3和5
        if indexPath.isSection(1,2).isRow(3,5){
            
        }else{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

