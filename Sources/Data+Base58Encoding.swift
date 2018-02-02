//

import Foundation

fileprivate let codeString: String = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

extension Data {

    public init?(base58Encoded string: String) {
        var result: [UInt8] = [0]
        for ch in string {
            if let index = codeString.index(of: ch)?.encodedOffset {
                result = UInt8(58).multiplyingLong(multiplier: result)
                var overflow = false
                var i = result.count - 1
                (result[i], overflow) = result[i].addingReportingOverflow(UInt8(index))
                while overflow && i > 0 {
                    i = i - 1
                    (result[i], overflow) = result[i].addingReportingOverflow(1)
                }
                if overflow {
                    result.insert(1, at: 0)
                }
            } else {
                return nil
            }
        }
        self.init(bytes: result)
    }

    public func base58EncodedString() -> String {
        guard self.count > 0 else {
            return String()
        }

        var dividend = [UInt8](self)
        var remainder: UInt8 = 0
        var result: String = ""
        while dividend.count > 1 || dividend.last! > 0 {
            (dividend, remainder) = UInt8(58).dividingLong(dividend: dividend)
            let index = codeString.index(codeString.startIndex, offsetBy: String.IndexDistance(remainder))
            result.insert(codeString[index], at: result.startIndex)
        }

        return result
    }
}
