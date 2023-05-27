//Copyright © 2023 Charles Kerr. All rights reserved.

import Foundation

extension String {
    public init(asciiData:Data) {
        self.init()
        let temp = String(data:data,encoding: .ascii)
        if temp != nil {
            self = temp!
            // Now, see if we have some extra null characters
            // Find the first null
            let nullstart = self.firstIndex { value in
                return (value.asciiValue ?? 0) == 0
            }
            if  nullstart != nil {
                // So there was some null characters
                self.removeSubrange(nullstart!..<self.endIndex)
            }
        }
    }
}
