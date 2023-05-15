//

import Foundation

public struct GeneralError  : LocalizedError {
    var msg:String? = nil
    var reason:String? = nil
    
    public var localizedDescription:String {
        return "General Error: \(msg ?? "unspecified")"
    }
    public var errorDescription: String? {
        return "General Error: \(msg ?? "unspecified")"
    }
    public var failureReason: String? {
        return "\(reason ?? "unspecified")"
    }
    public init(msg: String? = nil, reason: String? = nil) {
        self.msg = msg
        self.reason = reason
    }
}

