//Copyright © 2023 Charles Kerr. All rights reserved.

import Foundation

protocol CustomDataAccessible {
    var data:Data {get}
}

extension BinaryInteger  {
    /// Obtain the data representation of the value
    var data: Data {
        let data = withUnsafeBytes(of: self) { Data($0) }
        return data
    }
}
extension FloatingPoint  {
    /// Obtain the data representation of the value
    var data: Data {
        let data = withUnsafeBytes(of: self) { Data($0) }
        return data
    }
}

extension Array where Element:FixedWidthInteger {
    /// Obtain the data representation of the array
    var data:Data {
       return self.withUnsafeBufferPointer {Data(buffer: $0)}
    }
}

extension String {
    var data:Data {
        return self.data(using: .ascii) ?? Data()
    }
    func fixedData( size:Int) ->Data {
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
