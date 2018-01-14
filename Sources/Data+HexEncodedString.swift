//

import Foundation

/// following the convention of swift function naming, this extension
/// provides a simple `hexEncodedString` helper to convert Data into
/// hex strings
///
/// original solution found from stackoverflow:
/// https://stackoverflow.com/a/40089462

extension Data {
    func hexEncodedString() -> String {
        let hexDigits = Array(("0123456789abcdef").utf16)
        var chars: [unichar] = []
        chars.reserveCapacity(2 * count)
        for byte in self {
            chars.append(hexDigits[Int(byte / 16)])
            chars.append(hexDigits[Int(byte % 16)])
        }
        return String(utf16CodeUnits: chars, count: chars.count)
    }
}
