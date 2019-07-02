//
//  CircleImage.swift
//  LandMarks
//
//  Created by yang on 2019/6/29.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red,lineWidth: 4))
        .shadow(radius: 10)
        
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
