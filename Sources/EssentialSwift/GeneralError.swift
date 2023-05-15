//

import Foundation

struct GeneralError  : LocalizedError {
    var msg:String? = nil
    var reason:String? = nil
    var localizedDescription:String {
        return "General Error: \(msg ?? "unspecified")"
    }
    var errorDescription: String? {
        return "General Error: \(msg ?? "unspecified")"
    }
    var failureReason: String? {
        return "\(reason ?? "unspecified")"
    }
    init(msg: String? = nil, reason: String? = nil) {
        self.msg = msg
        self.reason = reason
    }
}

