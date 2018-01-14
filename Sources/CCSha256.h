//

// solution found here:
// https://forums.developer.apple.com/thread/83677
//
// this solution seems like it could ease the hassle
// of doing additional import for users of the lib.
// Otherwise, 

@import Foundation;

/*! Returns a digest of the specified data.
 *  \param data The data to digest.
 *  \returns A digest of that data.
 */

extern NSData * CommonCryptoSha256(NSData * data);
