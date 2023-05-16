//

import Foundation

public enum FileError {
    case open(url:URL?,reason:String?)
    case create(url:URL?,reason:String?)
    case invalid(url:URL?,reason:String?)
    case size(url:URL?, filesize:Int?,needed:Int?)
    case unknown(url:URL?,reason:String?)
}

@available(macOS 13.0, *)
extension FileError : LocalizedError {
    public var localizedDescription:String {
        switch (self) {
        case .open(let url,_):
            return "Unable to open: \(url?.path ?? "unspecified")"
        case .create(let url,_):
            return "Unable to create: \(url?.path ?? "unspecified")"
        case .invalid(let url,_):
            return "Invalid file: \(url?.path ?? "unspecified")"
        case .size(let url,_,_):
            return "Invalid size for file: \(url?.path ?? "unspecified") "
        case .unknown(let url,_):
            return "Unknown file error: \(url?.path ?? "unspecified")"
        }
    }
    public var errorDescription: String? {
        switch (self) {
        case .open(let url,_):
            return "Unable to open: \(url?.path ?? "unspecified")"
        case .create(let url,_):
            return "Unable to create: \(url?.path ?? "unspecified")"
        case .invalid(let url,_):
            return "Invalid file: \(url?.path ?? "unspecified")"
        case .size(let url,_,_):
            return "Invalid size for file: \(url?.path ?? "unspecified") "
        case .unknown(let url,_):
            return "Unknown file error: \(url?.path ?? "unspecified")"
        }
    }
    public var failureReason: String? {
        switch (self) {
        case .open(_,let reason):
            return "\(reason ?? "unspecified")"
        case .create(_,let reason):
            return "\(reason ?? "unspecified")"
        case .invalid(_,let reason):
            return "\(reason ?? "unspecified")"
        case .size(_,let filesize,let needed):
            return "Size: \(filesize ?? -1) Expected: \(needed ?? -1)"
        case .unknown(_,let reason):
            return "\(reason ?? "unspecified")"
        }
    }
}
