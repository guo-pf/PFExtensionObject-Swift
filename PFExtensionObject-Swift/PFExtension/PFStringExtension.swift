//
//  StringHandle.swift
//  TestDemo
//
//  Created by guo-pf on 2018/5/28.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit

extension String {
    /**
     * title: 类型枚举
     * enum:leftContain：只包含左边字符；rightContain：只包括右边字符；nullContain：不包括两边字符；allContain：两边字符都包括
     */
    enum ContainOptions{
        case leftContain
        case rightContain
        case nullContain
        case allContain
    }
    /**
     * title: 获取某字符串起始位置
     * parmes: s:搜寻的字符串
                options:从头搜还是从后面搜
     * return: 获取某字符串起始位置
     */
    
    
    func strPosition(_ s:String , backwards:Bool? = false) -> Int {
        guard self.count > 0 else {
            return 0
        }
        var position : Int = 0
        let range = self.range(of: s, options:backwards! ? .backwards : .literal )
        if !(range?.isEmpty)! {
            position = self.distance(from: startIndex, to: (range?.lowerBound)!)
        }
        return position
    }
    /**
     * title: 截取字符串
     * parmes: range:范围 包含最后一位
     * return: 截取后的字符串
     */
    func comSeparatedByStrRangeIndex(_ range: CountableClosedRange<Int>) -> String? {
        guard self.count > 0 else {
            return self
        }
        return componentsSeparatedByStr(self, starIndex: range.first!, endIndex: range.last!)
    }
    /**
     * title: 截取字符串
     * parmes: range:范围 不包含最后一位
     * return: 截取后的字符串
     */
    func comSeparatedByStrRangeIndex(_ range: CountableRange<Int>) -> String? {
        guard self.count > 0 else {
            return self
        }
        return componentsSeparatedByStr(self, starIndex: range.first!, endIndex: range.last!)
    }
    
    /**
     * title: 截取字符串
     * parmes: fromIndex:起始位置
     *         toIndex:结束位置
     *         isContain:是否包含开始结束字符串 默认包含
     * return: 截取后的字符串
     */
    func comSeparatedByStrRangeIndex(_ fromIndex : Int? = 0 , toIndex : Int? = 0, isContain: ContainOptions) -> String? {
        guard self.count > 0 else {
            return self
        }
        var toI : Int = 0
        let fromI : Int = fromIndex!>0 ? fromIndex! : 0
        if toIndex == nil || toIndex == 0{
            toI = self.count
        }else{
            toI = toIndex!
        }
        if fromI <= toI {
            return self
        }
        let indexArr : [Int] = ContainOptionsComponents(fromI, toIndex: toI, isContain: isContain)
        return componentsSeparatedByStr(self, starIndex: indexArr.first!, endIndex: indexArr.last!)
    }
    
    /**
     * title: 截取字符串
     * parmes: 范围 包含最后一位
     * return: 截取后的字符串
     */
    
    func comSeparatedByStrRangeStr(_ range :  ClosedRange<String>) -> String? {
        guard self.count > 0 else {
            return self
        }
        return comSeparatedByStrRangeStr(String(range.description.first!), toStr: String(range.description.last!), isContain: .allContain)
        
    }
    
    /**
     * title: 截取字符串
     * parmes: 范围 不包含最后一位
     * return: 截取后的字符串
     */
    
    func comSeparatedByStrRangeStr(_ range :  Range<String>) -> String? {
        guard self.count > 0 else {
            return self
        }
        return comSeparatedByStrRangeStr(String(range.description.first!), toStr: String(range.description.last!), isContain: .leftContain)
    }
    /**
     * title: 截取字符串
     * parmes: fromIndex:起始字符串
     *         toIndex:结束字符串
     *         isContain:是否包含开始结束字符串 默认包含
     * return: 截取后的字符串
     */
    func comSeparatedByStrRangeStr(_ fromStr : String? = nil, toStr : String? = nil, isContain: ContainOptions) -> String? {
        guard self.count > 0 else {
            return self
        }
        var fromS = fromStr
        var toS = toStr
        if fromS == nil {
            fromS = String(self.first!)
        }
        if toS == nil {
            toS = String(self.last!)
        }
        if !self.contains(fromStr!) {
            fromS = String(self.first!)
        }
        if !self.contains(toStr!){
            toS = String(self.last!)
        }
        
        let fromI : Int = strPosition(fromS!)
        let toI : Int = strPosition(toS!, backwards: true)
       
        let indexArr : [Int] = ContainOptionsComponents(fromI, toIndex: toI, isContain: isContain)
        
        return componentsSeparatedByStr(self, starIndex: indexArr.first!, endIndex: indexArr.last!)

    }
    /**
     * title: 截取字符串(包含起始和结束字符串)
     * parmes: fromIndex:起始字符串
     *         toIndex:结束字符串
     * return: 截取后的字符串
     */
    func comSeparatedByStrRangeStr(_ fromStr : String? = nil, toStr : String? = nil) -> String? {
        
        return comSeparatedByStrRangeStr(fromStr, toStr: toStr, isContain: .allContain)
    }
    
    /**
     * title: 截取字符串(包含起始和结束位置)
     * parmes: fromIndex:起始位置
     *         toIndex:结束位置
     * return: 截取后的字符串
     */
    func comSeparatedByStrRangeIndex(_ fromIndex : Int? = 0 , toIndex : Int? = nil) -> String? {
      
        return comSeparatedByStrRangeIndex(fromIndex, toIndex: toIndex, isContain: .allContain)
    }
    
    
}

func ContainOptionsComponents(_ fromIndex : Int? = 0 , toIndex : Int? = 0, isContain: String.ContainOptions) -> [Int]{
    var toI : Int = toIndex!
    var fromI : Int = fromIndex!
    
    switch isContain  {
    case .leftContain://只包括起点
        toI -= 1
        break
    case .rightContain:  //只包括终点 dui le
        fromI += 1
        break
    case .nullContain:      //都不包括
        fromI += 1
        toI -= 1
        break
    case .allContain:       //两边都包括 dui le
        break
    }
    
    return [fromI,toI]
    
}

func componentsSeparatedByStr(_ s : String, starIndex :Int, endIndex :Int) -> String?{
    let fromIndex = s.index(s.startIndex, offsetBy: starIndex)
    let toIndex = s.index(s.endIndex, offsetBy:endIndex - s.count)
     return String(s[fromIndex...toIndex])
}
