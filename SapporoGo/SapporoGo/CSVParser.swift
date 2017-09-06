//
//  CSVParser.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class CSVParser {
    
    static func parse(_ fileName:String?)->NSArray{
        
        let csvFile = Bundle.main.path(forResource: fileName, ofType:"csv")
        
        let csvData:Data?
        do {
            csvData = try Data(contentsOf: URL(fileURLWithPath: csvFile!), options: NSData.ReadingOptions.alwaysMapped)
        }catch{
            csvData = nil
        }
        let csv = String.init(data:csvData!, encoding: String.Encoding.utf16)
        let scanner = Scanner(string: csv!)
        let chSet = CharacterSet.newlines
        let sections = NSMutableArray()
        var line:NSString?
        
        while !scanner.isAtEnd {
            scanner.scanUpToCharacters(from: chSet, into: &line)
            let array:NSArray = (line?.components(separatedBy: ","))! as NSArray
            sections .add(array)
            scanner.scanCharacters(from: chSet, into:nil)
        }
        sections.removeObject(at: 0)
        return sections
    }
}
