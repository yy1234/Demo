//
//  ContentView.swift
//  SwiftUITest
//
//  Created by yang on 2019/6/9.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import SwiftUI

//struct ContentView : View {
//    var body: some View {
//        Text("Hello Worldenabling CoreFoundation debug logging for more information. This will only be logged once.enabling CoreFoundation debug logging for more")
//            .lineLimit(nil)
//            .font(.largeTitle)
//            .multilineTextAlignment(.center)
//            .foregroundColor(Color.red)
//            .background(Color.yellow)
//            .lineSpacing(20)
//    }
//}

/// 显示日期
//struct ContentView : View  {
//    static let taskDateFormat : DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        return formatter
//    }()
//    var dueDate = Date()
//    var body: some View {
//        Text("task due date:\(dueDate,formatter:Self.taskDateFormat)")
//    }
//
//}
/// 图片展示
//struct  ContentView : View {
//
//    var body: some View {
//        //目前会奔溃
////        Image("example-image")
//
//        guard let img = UIImage(named: "example-image") else {
//            fatalError("Unable to load image")
//        }
//        return Image(uiImage: img)
//                .resizable()//可变大小
//                .aspectRatio(contentMode: .fit)//缩放模式
//
//    }
//
//}

//渐变渲染
//struct  ContentView : View {
//
//    var body: some View {
//        Text("Hello World")
//            .padding()
//            .foregroundColor(.red)
//            .background(LinearGradient(gradient: Gradient(colors: [.white, .black, .red]), startPoint: .leading, endPoint: .trailing), cornerRadius: 0)
//
////        Text("Hello World")
////            .padding()
////            .foregroundColor(.white)
////            .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom), cornerRadius: 0)
//
//
//    }
//
//}

//struct ContentView : View {
//    var body: some View {
////        Rectangle()
////            .fill(Color.red)
////            .frame(width: 200, height: 200)
//
//        Circle()
//            .fill(Color.blue)
//            .frame(width: 50, height: 50)
//    }
//
//
//}


//一个view作为背景
//struct ContentView : View {
//    var body: some View {
////        Text("hack swift in hello world")
////            .font(.callout)
////            .background(Image(uiImage: UIImage.init(named: "example-image")!)
////                            .resizable()
////                            .frame(width: 100, height: 100))
//        Text("Hacking with Swift")
//            .font(.largeTitle)
//            .background(Circle()
//                .fill(Color.red)
//                .frame(width: 200, height: 200))
//                .clipped()
//
//    }
//
//
//}

//布局
//struct ContentView : View {
//    var body: some View {
//        VStack(){
//            Text("SwiftUI")
//            .padding(.bottom,100)
//            .background(Color.red)
//            Divider()
//            Text("rocks")
//        }
////        HStack {
////                    Text("SwiftUI")
////                    Text("rocks")
////                }
////        ZStack {
////            Text("SwiftUI")
////            Text("rocks")
////        }
//    }
//
//
//}



//
//struct ContentView : View {
//    var body: some View {
//        Group {
//            if Bool.random() {
//                Text("Better luck")
//            } else {
//                Text("Better luck next time")
//            }
//        }
//    }
//}


//struct ContentView : View {
//
//    let colors: [Color] = [.red, .green, .blue]
//    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
//    var body: some View {
//        VStack(alignment: .leading) {
//            ForEach((1...10).reversed()) {
//                Text("\($0)...").background(Color.red)
//            }
//            Text("i am coming")
//        }
  //您可以.identified(by: \.self)在数组上使用SwiftUI将值本身用作标识符
        
        
        
//        VStack {
//            ForEach (colors.identified(by: \.self)){ color in
//                Text(color.description.capitalized)
//                    .padding()
//                    .background(color)
//            }
//        }
        //这告诉SwiftUI它可以ForEach通过查看它们的id属性来区分内部的视图。
//        VStack {
//            ForEach(results.identified(by: \.id)) { result in
//                Text("souce:\(result.score),is:\(result.id)")
//            }
//
//        }
//    }
//}

struct Result {
    var id = UUID()
    var score: Int
}
//struct ContentView : View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
//
//    var body: some View {
//        if horizontalSizeClass == .compact {
//            return Text("Compact")111
//        } else {
//            return Text("Regular")
//        }
//    }
//}

//edgesIgnoringSafeArea忽略安全区
//struct ContentView : View {
//
//    var body: some View {
//        Text("Hello World")
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//            .background(Color.red)
//            .edgesIgnoringSafeArea(.all)
//    }
//}


//struct ContentView: View {
//    @State var showGreeting = true
//    var body: some View {
//        VStack {
//            Toggle(isOn: $showGreeting) {
//                Text("Show welcome Message")
//            }.padding()
//            if showGreeting {
//                Text("hellow world")
//            }
//        }
//    }
//}

//struct ContentView : View {
//    @State var showGreeting = true
//    
//    var body: some View {
//        VStack {
//            Toggle(isOn: $showGreeting) {
//                Text("Show welcome message")
//                }.padding()
//            
//            if showGreeting {
//                Text("Hello World!")
//            }
//        }
//    }
//}

//按钮
//struct ContentView: View {
//    @State var showDetails = true
//    var body: some View {
//        VStack {
//            Button(action: {
//                self.showDetails.toggle()
//            }) {
//                Text("Show detail")
//            }
//            if showDetails {
//                Text("You should follow me on Twitter: @twostraws")
//                .font(.largeTitle)
//                .lineLimit(nil)
//            }
//        }
//    }
//}


//struct ContentView: View {
//    @State var name: String = ""
//    var body :
//            SecureField($name, placeholder: Text("password"))
//            Text("enter your password")
//        }
//    }
//}
//MARK:slider
//struct ContentView : View {
//    @State var celsius: Double = 0
//
//    var body: some View {
//        VStack {
//            Slider(value: $celsius, from: -100, through: 100, by: 0.1)
//            Text("\(celsius) Celsius is \(celsius * 9 / 5 + 32) Fahrenheit")
//        }
//    }
//}

//MARK:Picker
//struct ContentView : View {
//    var colors = ["Red","Green","Blue","Tartan"]
//    @State private var selectColor = 0
//    var body: some View {
//        VStack {
//            Picker(selection: $selectColor, label: Text("Please choose a color")) {
//                ForEach(0 ..< colors.count){
//                    Text(self.colors[$0]).tag($0)
//                }
//            }
//            Text("You selected: \(colors[selectColor])")
//        }
//    }
//}
//MARK:datePicker
struct ContentView: View {
    var  dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State var birthDate = Date()
    var body: some View {
        VStack {
            DatePicker(
                $birthDate,
                maximumDate: Date(),
                displayedComponents: .hourAndMinute
            )
            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
    }
    
    
    
}
