//
//  CSVParser.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class CSVParser {
    
    static func parse(fileName:String?)->NSArray{
        
        let csvFile = NSBundle.mainBundle().pathForResource(fileName, ofType:"csv")
        
        let csvData:NSData?
        do {
            csvData = try NSData(contentsOfFile:csvFile!, options: NSDataReadingOptions.DataReadingMappedAlways)
        }catch{
            csvData = nil
        }
        let csv = String.init(data:csvData!, encoding: NSUTF16StringEncoding)
        let scanner = NSScanner(string: csv!)
        let chSet = NSCharacterSet.newlineCharacterSet()
        let sections = NSMutableArray()
        var line:NSString?
        
        while !scanner.atEnd {
            scanner.scanUpToCharactersFromSet(chSet, intoString: &line)
            let array:NSArray = (line?.componentsSeparatedByString(","))!
            sections .addObject(array)
            scanner.scanCharactersFromSet(chSet, intoString:nil)
        }
        sections.removeObjectAtIndex(0)
        return sections
    }
}