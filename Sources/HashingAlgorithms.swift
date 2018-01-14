//

import Foundation

public struct HashingAlgorithms {

    static func rmd160(_ data: Data) -> Data? {
        let count = data.count
        let dataPointer = UnsafeMutablePointer<UInt8>.allocate(capacity: count + 1)
        data.copyBytes(to: dataPointer, count: count)
        "\0".data(using: String.Encoding.ascii)!.copyBytes(to: dataPointer + count, count: 1)
        if let rmdPointer = RMD(dataPointer) {
            let rmdData = Data(bytes: rmdPointer, count: 20)
            return rmdData
        }
        return nil
    }

    public static func sha256(of content: Data) -> Data {
        return CommonCryptoSha256(content)
    }

    public static func ripemd160(of content: Data) -> Data {
        if let result = rmd160(content) {
            return result
        }
        return Data()
    }

    public static func doubleSha256(of content: Data) -> Data {
        return CommonCryptoSha256(CommonCryptoSha256(content))
    }

    public static func hash160(of content: Data) -> Data {
        return CommonCryptoSha256(ripemd160(of: content))
    }
}
