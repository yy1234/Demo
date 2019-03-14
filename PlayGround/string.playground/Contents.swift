import UIKit
import Foundation
//var str = "Hello, playground"
//
///// 字符串的可变性
//var variableString = "Horse"
//variableString += " and carriage"
//
////遍历字符
//for c in variableString {
////    print(c)
//}
//
////字符串插值
//let multiplier = 3
//let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//
//
////字符串索引
//let greeting  = "Guten Tag!"
//print(greeting[greeting.startIndex])
//
//greeting[greeting.index(after: greeting.startIndex)]
//
//greeting[greeting.index(before: greeting.endIndex)]
//
//let index = greeting.index(before: greeting.endIndex)
//print(greeting[index])
//
//
////访问了字符串之外的位置，导致报错
////greeting[greeting.endIndex] // error
//for index in greeting.indices {
////    print("\(greeting[index]) ", terminator: "\(index)")
//}
//
////字符串的插入和删除
////var welcome = "hello"
////welcome.insert("!", at: welcome.endIndex)
////welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
//
//let helloworld = "Hello, world!"
//let indexx = helloworld.index(of: ",") ?? helloworld.endIndex
//let beging = helloworld[..<indexx]
//
//
//let flagLetterC = "🇨"
//let flagLetterN = "🇳"
//let flag = flagLetterC + flagLetterN // 🇨🇳
//flag.count // 1
//flag.count == flagLetterC.count + flagLetterN.count // false”
//
//
//
//var strRange = "Hello, joshwang0830"
//var indexRange = strRange.index(of: ",")//得到“,”在字符串中的位置
//let strRange1 = strRange[indexRange!...]
//let ssss = str.prefix(upTo: indexRange!)
//let ttt = strRange[indexRange!...]

let message = "Hello, world"
message.split(separator: "d")
let characters = message.characters
print(type(of: characters))

let commaSeparatedNumbers = "1,2,3,4,5"
let numbers = commaSeparatedNumbers
    .split(separator: ",").flatMap { Int($0) }


let text = "👉 Click here for more info."
let linkTarget =
    URL(string: "https://www.youtube.com/watch?v=DLzxrzFCyOs")!
let formatted = NSMutableAttributedString(string: text)
if let linkRange = formatted.string.range(of: "Click here"){
    print(linkRange)
    let nsrange = NSRange(linkRange, in: formatted.string)
    formatted.addAttribute(.link, value: linkRange, range: nsrange)
}

