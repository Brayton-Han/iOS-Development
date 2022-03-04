// 2022.01.22

// 1 字符串字面量
// 即用双引号包裹的一串字母
let someString = "Some string literal value"

// 1.1 多行字符串字面量
// 一个"""对中默认换行
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
 
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

// 用\在代码里标识换行，自动衔接下一行
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.
 
"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

// 要让多行字符串字面量起始或结束于换行，就在第一或最后一行写一个空行
let lineBreaks = """
 
This string starts with a line break.
It also ends with a line break.
 
"""

// 第二个双引号前的空格指示其他行前应该有多少空白需要忽略
let lineWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    """

// 1.2 字符串字面量里的特殊字符
// \0(空字符)，\\(反斜杠)，\t(水平制表符)，\n(换行符)，\r(回车符)，\"(双引号) 以及 \'(单引号)
// 任意的 Unicode 标量写作 \u{n}，里边的 n 是一个16进制数字
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// 可以在多行字符串字面量中包含双引号而不需转义
// 下面两个等价，都包含了三个双引号
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

// 1.3 扩展字符串分隔符
// 在字符串字面量中放置扩展分隔符以不让在其中的特殊字符生效
let str = #"Line 1\nLine 2"# // 打印一行

// 如果需要字符串中某个特殊符号的效果，使用包裹的井号数量的井号并在前面写转义符号 \
let str1 = #"Line 1\#nLine 2"# // 打印两行
let str2 = ###"Line 1\###nLine 2"### // 打印两行

// 多行字面量也能使用
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// 2 初始化一个空字符串
var emptyString = ""
var anotherEmptyString = String()

// 检查字符串是否为空
if emptyString.isEmpty() {
    print("Nothing to see here")
}

// 3 字符串可变性
// 设置为变量（可被修改），或者为常量（不能被修改）

// 4 字符串是值类型
// 每一次赋值和传递，现存的String值都会被复制一次

// 5 操作字符
// 通过for-in循环遍历 String 中的每一个独立的 Character 值
for character in "Dog!" {
    print(character)
}

// 通过提供 Character 类型标注来创建一个独立的 Character 常量或者变量
let exclamationMark: Character = "!"

// String 值可以通过传入 Character 值的字符串作为实际参数到它的初始化器来构造
let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)

// 6 连接字符串和字符
// String值能够被连接起来
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

// 使用 append() 方法来给一个 String 变量的末尾追加 Character 值
welcome.append(exclamationMark)

// 多行字符串字面量的使用
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)

// 7 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// 取消插值
print(#"Write an interpolated string in Swift using \(multiplier)."#)

// 取消插值后恢复部分插值
print(#"6 times 7 is \#(6 * 7)."#)

// 8 Unicode
// 8.1 Unicode标量
// Unicode 标量码位位于 U+0000 到 U+D7FF 以及 U+E000 到 U+10FFFF之间

// 8.2 扩展字形集群
let eAcute: Character = "\u{E9}" // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by ́

let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ

let enclosedEAcute: Character = "\u{E9}\u{20DD}" //被圈住的é

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}" // US国旗

// 9 字符统计
print(someString.count)

var word = "cafe"
print("the number of characters in \(word) is \(word.count)") // 4
word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.count)") // still 4

// 10 访问和修改字符串
// 10.1 字符串索引
// Swift 的字符串不能通过整数值索引
let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // a

// 使用 indices 属性来访问字符串中每个字符的索引
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "

// 10.2 插入和删除
// 插入单个字符用at， 若为字符串则还需要 contentsOf
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex) // hello!
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex)) // hello there!

welcome.remove(at: welcome.index(before: welcome.endIndex)) // hello there
let range = welcome.index(welcome.endIndex, offsetBy: -6) ..< welcome.endIndex
welcome.removeSubrange(range) // hello

// 11 子字符串
let greeting = "Hello, world!"
let index = greeting.index(of: ",") ?? greeting.endIndex
let beginning = greeting[..< index] // Hello，是引用，会修改原String的值

let newString = String(beginning) //拷贝了引用，具有自己的内存

// 12 字符串比较
// 12.1 字符串和字符相等性
// 使用 == 和 != 进行检查
// 两个 String 或者 Character，如果它们的扩展字形集群是规范化相等，则被认为是相等的
// 如果扩展字形集群拥有相同的语言意义和外形就说它规范化相等，就算是由不同的 Unicode 标量组合而成

// 12.2 前缀和后缀相等性
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
]
if romeoAndJuliet[0].hasPrefix("Act 1 ") {
    print("0 has prefix Act 1")
}
if romeoAndJuliet[1].hasSuffix("Capulet's mansion") {
    print("1 has suffix Capulet's mansion")
}

// 13 字符串的Unicode表示法
let dogString = "Dog!!\u{1F436}"

// 13.1 UTF-8
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
// 68 111 103 226 128 188 240 159 144 182

// 13.2 UTF-16
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
// 68 111 103 8252 55357 56374

// 13.3 Unicode标量表示法
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
// 68 111 103 8252 128054
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D o g ‼ 🐶
