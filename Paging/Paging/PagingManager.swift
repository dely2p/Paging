//
//  PagingManager.swift
//  Paging
//
//  Created by Eunjin on 03/03/2020.
//  Copyright © 2020 Eunjin. All rights reserved.
//

import Foundation

class PagingManager {
    private var asciiList: [String] = []
    private var page = 0
    private var rowIndex = 10
    private let startAscii = 65
    private let endAscii = 127
    private var hasNoData = false
    
    func makeAsciiList() {
        for number in startAscii...endAscii {
            asciiList.append(String(UnicodeScalar(number) ?? "A"))
        }
    }
    
    func getList() -> [String]? {
        if hasNoData { return nil }
        var list: [String] = []
        let endIndex = getEndIndex()
        for index in 0..<endIndex {
            list.append(asciiList[(page*rowIndex)+index])
        }
        page = page + 1
        return list
    }
    
    func getEndIndex() -> Int {
        var endIndex = 10
        if ((page+1) * rowIndex) > (endAscii-startAscii+1) {
            endIndex = (endAscii-startAscii+1)%page
            self.hasNoData = true
        }
        return endIndex
    }
}
