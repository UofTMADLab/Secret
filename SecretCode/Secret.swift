//
//  Secret.swift
//  SecretCode
//
//  Created by Mike Spears on 2019-09-24.
//  Copyright © 2019 Mike Spears. All rights reserved.
//

import Foundation

struct Secret : Codable {
    let sliderValue: Int
    let switchIsOn: Bool
    let segmentValue: Int
    private let secretMessage: String
    func checkCode(slider: Int, isOn: Bool, segment: Int) -> String? {
        if slider == sliderValue && isOn == switchIsOn && segment == segmentValue {
            return secretMessage
        } else {
            return nil
        }
    }
    
    static func getSavedSecret() -> Secret? {
        let codeFile = Bundle.main.url(forResource: "code", withExtension: "json")
        if codeFile == nil {
            return nil
            
        }
        do {
            let data = try Data(contentsOf:codeFile!)
            return try JSONDecoder().decode(Secret.self, from: data)
        } catch let e {
            print(e.localizedDescription)
            return nil
        }
    }
}
