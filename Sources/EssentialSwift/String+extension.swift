//Copyright © 2023 Charles Kerr. All rights reserved.

import Foundation
extension String {
    public func fixedData( size:Int) ->Data {
        guard size > 0 else {
            return Data()
        }
        let temp = self.data(using: .ascii) ?? Data(count: 0)
        var rvalue = Data(count:size)
        guard temp.count > 0 else {
            return rvalue
        }
        for (index,value) in temp.enumerated() {
            if (index >= size) {
                break
            }
            rvalue[index] = value
        }
        return rvalue
    }

}
