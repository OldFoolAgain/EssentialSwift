//Copyright © 2023 Charles Kerr. All rights reserved.

import Foundation
extension URL {
    public var size:Int? {
        return try? self.resourceValues(forKeys:[.fileSizeKey]).fileSize
    }
}
