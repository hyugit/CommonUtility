//

#import "CCSha256.h"
#include <CommonCrypto/CommonCrypto.h>

extern NSData * CommonCryptoSha256(NSData * data) {
    NSUInteger size = CC_SHA256_DIGEST_LENGTH;
    unsigned char *(*digester)(const void *data, CC_LONG len, unsigned char *md) = CC_SHA256;
    NSMutableData * digest = [[NSMutableData alloc] initWithLength:size];
    digester(data.bytes, (CC_LONG) data.length, digest.mutableBytes);

    return digest;
}
