//

import XCTest
@testable import CommonUtility

class CommonUtilityTests: XCTestCase {

    let a: [UInt8] = [
        0x80, 0x0C, 0x28, 0xFC,
        0xA3, 0x86, 0xC7, 0xA2,
        0x27, 0x60, 0x0B, 0x2F,
        0xE5, 0x0B, 0x7C, 0xAE,
        0x11, 0xEC, 0x86, 0xD3,
        0xBF, 0x1F, 0xBE, 0x47,
        0x1B, 0xE8, 0x98, 0x27,
        0xE1, 0x9D, 0x72, 0xAA,
        0x1D
    ]

    func testSha256() {
        let data = Data(bytes: a)
        let digest = HashingAlgorithms.sha256(of: data)
        XCTAssertEqual(digest.hexEncodedString(), "8147786c4d15106333bf278d71dadaf1079ef2d2440a4dde37d747ded5403592")
    }

    func testDoubleSha256() {
        let data = Data(bytes: a)
        let digest2 = HashingAlgorithms.doubleSha256(of: data)
        XCTAssertEqual(digest2.hexEncodedString(), "507a5b8dfed0fc6fe8801743720cedec06aa5c6fca72b07c49964492fb98a714")
    }

    func testHash160() {

    }

    func testRipeMD160() {
        var a = "abc"
        var code = "8eb208f7e05d987a9b044a8e98c6b087f15a0bfc"
        var data = a.data(using: String.Encoding.ascii, allowLossyConversion: false)!
        XCTAssertEqual(HashingAlgorithms.ripemd160(of: data).hexEncodedString(), code)

        a = ""
        code = "9c1185a5c5e9fc54612808977ee8f548b2258d31"
        data = a.data(using: String.Encoding.ascii, allowLossyConversion: false)!
        XCTAssertEqual(HashingAlgorithms.ripemd160(of: data).hexEncodedString(), code)

        a = "a"
        code = "0bdc9d2d256b3ee9daae347be6f4dc835a467ffe"
        data = a.data(using: String.Encoding.ascii, allowLossyConversion: false)!
        XCTAssertEqual(HashingAlgorithms.ripemd160(of: data).hexEncodedString(), code)

        a = "message digest"
        code = "5d0689ef49d2fae572b881b123a85ffa21595f36"
        data = a.data(using: String.Encoding.ascii, allowLossyConversion: false)!
        XCTAssertEqual(HashingAlgorithms.ripemd160(of: data).hexEncodedString(), code)

        a = "abcdefghijklmnopqrstuvwxyz"
        code = "f71c27109c692c1b56bbdceb5b9d2865b3708dbc"
        data = a.data(using: String.Encoding.ascii, allowLossyConversion: false)!
        XCTAssertEqual(HashingAlgorithms.ripemd160(of: data).hexEncodedString(), code)

        a = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
        code = "12a053384a9c0c88e405a06c27dcf49ada62eb2b"
        data = a.data(using: String.Encoding.ascii, allowLossyConversion: false)!
        XCTAssertEqual(HashingAlgorithms.ripemd160(of: data).hexEncodedString(), code)

        a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        code = "b0e20b6e3116640286ed3a87a5713079b21f5189"
        data = a.data(using: String.Encoding.ascii, allowLossyConversion: false)!
        XCTAssertEqual(HashingAlgorithms.ripemd160(of: data).hexEncodedString(), code)
    }
}
