# TEA(Tiny Encryption Algorithm):TEA(Tiny Encryption Algorithm) for Swift

#Sample usage

```swift
let key: [UInt32] = [0x00,0x01,0x02,0x03]
var val: [UInt32] = [0x00,0x01]
encryptTEA(Value: &val, Key: key)
print(val)
decryptTEA(Value: &val, Key: key)

print(val)
```