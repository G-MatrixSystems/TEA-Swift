//
//  TEA.swift
//  TEA-Swift
//
//  Created by 紅 塵 忘 on 12/18/15.
//  Copyright © 2015 com.aone. All rights reserved.
//

import Foundation

/**
 TEA加密
 
 - parameter v: 值
 - parameter k: 加密 密钥
 
 - returns: 加密值
 */
func encryptTEA (inout Value v: [UInt32],Key k: [UInt32]) ->[UInt32] {
    var v0 : UInt32 = v[0]
    var v1 : UInt32 = v[1]
    
    var sum : UInt32 = 0
    /* set up */
    let delta : UInt32 = 0x9e3779b9/* a key schedule constant */
    
    for _ in 0...31 {/* basic cycle start */
        
        sum = sum &+ delta
        
        v0 = v0 &+ (((v1<<4) &+ k[0]) ^ (v1 &+ sum) ^ ((v1>>5) &+ k[1]))
        
        v1 = v1 &+ (((v0<<4) &+ k[2]) ^ (v0 &+ sum) ^ ((v0>>5) &+ k[3]))
        
    }
    v[0] = v0
    v[1] = v1
    
    return v
}

/**
 TEA解密
 
 - parameter v: 值
 - parameter k: 解密 密钥
 
 - returns: 解密值
 */
func decryptTEA (inout Value v : [UInt32],Key k : [UInt32]) ->[UInt32] {
    var  v0 : UInt32 = v[0]
    var v1 : UInt32 = v[1]
    var sum : UInt32 = 0xC6EF3720  /* set up */
    let delta : UInt32 = 0x9e3779b9                     /* a key schedule constant */
    
    for _ in 0...31 {/* basic cycle start */
        
        v1 = v1 &- (((v0<<4) &+ k[2]) ^ (v0 &+ sum) ^ ((v0>>5) &+ k[3]))
        v0 = v0 &- (((v1<<4) &+ k[0]) ^ (v1 &+ sum) ^ ((v1>>5) &+ k[1]))
        sum = sum &- delta
        
    }
    v[0] = v0
    v[1] = v1
    return v
}