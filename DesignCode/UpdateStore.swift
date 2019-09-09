//
//  UpdateStore.swift
//  DesignCode
//
//  Created by yl on 2019/9/9.
//  Copyright © 2019 yl. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var updates: [Update]{
        didSet{
            objectWillChange.send()
        }
    }
    
    init(updates:[Update]) {
        self.updates = updates
    }
}
