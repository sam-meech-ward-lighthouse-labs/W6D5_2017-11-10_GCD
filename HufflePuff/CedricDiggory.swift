 //
//  CedricDiggory.swift
//  HufflePuff
//
//  Created by Sam Meech-Ward on 2017-11-10.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import Foundation

struct Snitch {
    let game: String
}

class CedricDiggory {
    
    static let sharedCedric = CedricDiggory()
    
    private var _snitches: [Snitch] = []
    
    private let snitchQueue = DispatchQueue(label: "com.huffle-puff.snitchQueue", qos: .default, attributes: [.concurrent])
    
    func add(snitch: Snitch) {
        snitchQueue.async (flags: .barrier) {
            self._snitches.append(snitch)
        }
    }
    
    var snitches: [Snitch] {
        var tmp: [Snitch] = []
        snitchQueue.sync {
            tmp = _snitches
        }
        return tmp
    }
    
    func flyAroundHogwarts() {
        let random = arc4random_uniform(2)+1
        sleep(random)
        print("Flying")
        
    }
    
    func practiceDueling() {
        let random = arc4random_uniform(2)+1
        sleep(random)
        print("Dueling")
        
    }
    
    func somethingElse() {
        let random = arc4random_uniform(2)+1
        sleep(random)
        print("🤗")
        
    }
    
}
