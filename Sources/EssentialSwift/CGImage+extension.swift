//Copyright © 2023 Charles Kerr. All rights reserved.

import Foundation
import ImageIO
import UniformTypeIdentifiers
@available(macOS 11.0, *)
extension CGImage {
    public func saveTo(url:URL,type:UTType) {
        guard let destination = CGImageDestinationCreateWithURL(url as CFURL, type.identifier as CFString, 1, nil) else { return  }
        CGImageDestinationAddImage(destination, self, nil)
        CGImageDestinationFinalize(destination)
    }
    public var pixel32Data:[UInt32]? {
        let orderInfo = CGBitmapInfo.byteOrder32Little.rawValue
        let alphaInfo = CGImageAlphaInfo.premultipliedFirst.rawValue
        let component = 8
        let pixelsize  = 4
        guard let context =  CGContext(data:nil,width: self.width,height: self.height,bitsPerComponent: component,bytesPerRow: self.width * pixelsize,space:CGColorSpace(name: CGColorSpace.sRGB)!,bitmapInfo: CGBitmapInfo(rawValue: (orderInfo | alphaInfo)).rawValue) else {
            return nil
        }
        context.draw(self,in:CGRect(origin: CGPoint(x: 0, y:0),size: CGSize(width: self.width, height: self.height)), byTiling: false)
        var components = Data(bytes:context.data!,count: self.width * self.height * pixelsize )
        
        for index  in stride(from:0,to:components.count, by:4) {
            for sub in 0..<3 {
                components[index+sub] = components[index+3] == 0 ?components[index+sub] : UInt8(truncatingIfNeeded: (UInt(components[index+sub]) * 255) / UInt(components[index+3]))
            }
        }
        return components.uInt32Array
    }
    public var pixel16Data:[UInt16]? {
        let orderInfo = CGBitmapInfo.byteOrder16Little.rawValue
        let alphaInfo = CGImageAlphaInfo.noneSkipLast.rawValue
        let component = 5
        let pixelsize  = 2
        guard let context =  CGContext(data:nil,width: self.width,height: self.height,bitsPerComponent: component,bytesPerRow: self.width * pixelsize,space:CGColorSpace(name: CGColorSpace.sRGB)!,bitmapInfo: CGBitmapInfo(rawValue: (orderInfo | alphaInfo)).rawValue) else {
            return nil
        }
        context.draw(self,in:CGRect(origin: CGPoint(x: 0, y:0),size: CGSize(width: self.width, height: self.height)), byTiling: false)
        let data = Data(bytes:context.data!,count: self.width * self.height * pixelsize )
        return data.uInt16Array
    }
}
