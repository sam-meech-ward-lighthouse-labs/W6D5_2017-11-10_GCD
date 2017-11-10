//
//  main.swift
//  HufflePuff
//
//  Created by Sam Meech-Ward on 2017-11-10.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import Foundation

let mainQueue = DispatchQueue.main
let globalQueue = DispatchQueue.global(qos: .default)
let customQueue = DispatchQueue(label: "com.huffle-puff.customQueue", qos: .default, attributes: [.concurrent])

//print("🤗🐈 1")
//
//mainQueue.async {
//    print("🤗🐈 2")
//    mainQueue.asyncAfter(deadline: .now() + 1) {
//        print("🤗🐈 4")
//        mainQueue.async {
//            print("🤗🐈 5")
//        }
//        print("🤗🐈 6")
//    }
//}
//
//
//print("🤗🐈 3")

//for i in 0...1000 {
//    globalQueue.async {
//        CedricDiggory.sharedCedric.add(snitch: Snitch(game: "\(i).🔮"))
//    }
//}
//
//sleep(1)
//print(CedricDiggory.sharedCedric.snitches)

let dispatchGroup = DispatchGroup()


dispatchGroup.enter()
globalQueue.async {
    CedricDiggory.sharedCedric.flyAroundHogwarts()
    dispatchGroup.leave()
}
dispatchGroup.enter()
globalQueue.async {
    CedricDiggory.sharedCedric.practiceDueling()
    dispatchGroup.leave()
}

for _ in 0...100 {

    dispatchGroup.enter()
    globalQueue.async {
        CedricDiggory.sharedCedric.somethingElse()
        dispatchGroup.leave()
    }
    
}

dispatchGroup.notify(queue: .main) {
    print("Everything's done")
}



RunLoop.main.run(until: Date(timeIntervalSinceNow: 100))
