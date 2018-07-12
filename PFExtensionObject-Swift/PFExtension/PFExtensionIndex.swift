//
//  ExtensionIndex.swift
//  TableViewDemo
//
//  Created by guo-pf on 2018/6/20.
//  Copyright © 2018年 guo-pf. All rights reserved.
//

import UIKit

 private struct isContainsKey {
    static var isContains:Bool = true
 }

extension IndexPath {
    
    func isRow(_ row:Int...) -> Bool {
      
            if isContainsKey.isContains {
                return row.contains(self.row)
            }
 
        return isContainsKey.isContains

    }
    func isSection(_ section:Int...) -> Bool {
        return section.contains(self.section)
    }
    func isSection(_ section:Int...) -> IndexPath{
         isContainsKey.isContains = section.contains(self.section)
        return self
    }

    
}

