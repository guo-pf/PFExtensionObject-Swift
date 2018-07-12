# PFExtensionObject-Swift
自己扩展的一点东西，例如UIButton,例如TextField，例如Alert,例如字符串截取，例如IndexPath判断。。
  /**
   * UITextField  其中 pf_makeObject{}控件中通用 ，内部不影响源生代码的编写
   */
   
    let textField = UITextField()
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
     * UIAlertController
     */
     let alert = PFAlert()
      self.alert.alert("提醒", "这是个测试ALERT", .alert)
                      .addText("", "ceshishuju", true)?//<------可以传一个自定义textfield
                      .addAction("取消", .cancel)?
                      .addAction("确定", .default)?
                      .actionClicked({ (v , i) in
                          print()
                      })
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
        
        
        
        
