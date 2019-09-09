//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by yl on 2019/9/9.
//  Copyright © 2019 yl. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    
    var title = "SwiftUI"
    var image = "Illustration1"
    var text = "Loading..."
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(title)
                .font(.headline)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(text)
                .font(.subheadline)
                .lineLimit(nil)
            Spacer()
        }
        .padding(20)
        
       
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
