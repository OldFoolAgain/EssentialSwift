//Copyright © 2023 Charles Kerr. All rights reserved.

import Foundation
extension URL {
    public var size:Int? {
        return try? self.resourceValues(forKeys:[.fileSizeKey]).fileSize
    }
    
    public var securityData:Data? {
        guard self.isFileURL else {return nil}
        return try? self.bookmarkData(options: .withSecurityScope,includingResourceValuesForKeys: nil,relativeTo: nil)
    }
}
