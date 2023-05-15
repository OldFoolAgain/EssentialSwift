//Copyright © 2023 Charles Kerr. All rights reserved.

import Foundation

extension Data {
    public func array<T>(type: T.Type) -> [T] where T: ExpressibleByIntegerLiteral {
        
        let arraysize = self.count / MemoryLayout<T>.stride
        var array = Array<T>(repeating: 0, count: arraysize)
        
        _ = array.withUnsafeMutableBytes { copyBytes(to: $0, count: arraysize * MemoryLayout<T>.stride) }
        return array
    }
    
    /// extract at a given offset the value from the data
    /// - Parameters:
    ///     - offset: The offset into the data
    /// - Returns: the value requested, or nil if insufficient data
    public func extract<T:FixedWidthInteger>(type:T.Type ,offset:Int)  ->T?{
        guard offset+MemoryLayout<T>.size <= self.count else {
            return nil
        }
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(fromByteOffset: offset, as: T.self)
        }
    }
    
    public var uint8:UInt8? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: UInt8.self)
        }
    }
    public var int8:Int8? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: Int8.self)
        }
    }
    public var uint16:UInt16? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: UInt16.self)
        }
    }
    public var int16:Int16? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: Int16.self)
        }
    }
    public var uint32:UInt32? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: UInt32.self)
        }
    }
    public var int32:Int32? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: Int32.self)
        }
    }
    public var uint64:UInt64? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: UInt64.self)
        }
    }
    public var int64:Int64? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: Int64.self)
        }
    }
    public var uint:UInt? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: UInt.self)
        }
    }
    public var int:Int? {
        return self.withUnsafeBytes { ptr in
            ptr.loadUnaligned(as: Int.self)
        }
    }
    
}
