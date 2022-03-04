// 2022.01.20

// 1 常量和变量
// 常量的值一旦设置好便不能再被更改，变量可以在将来被设置为不同的值

// 1.1 声明常量和变量
// 常量和变量必须在使用前被声明，let常量，var变量
let max = 10
var cur = 0
var x = 0.0, y = 0.1, z = 0.2

// 1.2 类型标注
var welcome: String
welcome = "Hello world!"

var red, green, blue: Double

// 1.3 命名常量和变量
// 一旦声明一个确定类型的常量或者变量，就不能改存其他类型的值
// 常量和变量之间不能互换
let π = 3.1415926
let 你好 = "你好世界"
let 🐶️🐮️ = "dogcow"

var friendly_welcome = "Hello!"
friendly_welcome = "Bonjour!"

// 1.4 输出常量和变量
// 默认来说，函数通过在行末尾添加换行符来结束输出
print(friendly_welcome)
print("The current value of friendly_welcome is \(friendly_welcome)")

// 2 注释
// hello!

/* Hello
   world */

/* hello
/* bonjour */
   world */

// 3 分号
// 若想在一行里写多句代码，分号还是需要的

// 4 整数
// Swift 提供了 8，16，32 和 64 位编码的有符号和无符号整数

// 4.1 整数范围
let minValue = UInt8.min
let maxValue = UInt8.max

// 4.2 Int
// 除非你需操作特定长度的整数，否则请尽量在代码中使用 Int 作为你的整数的值类型

// 4.3 UInt
// 即使已经知道存储的值都是非负的，也统一使用Int，会提高代码的兼容性

// 5 浮点数
// Double代表64位的浮点数，Float代表32位的浮点数
// 在两种类型都可以的情况下，推荐使用 Double 类型

// 6 类型安全和类型推断
// 浮点值默认Double
let anotherPi = 3 + 0.1415926

// 7 数值型字面量
// 浮点字面量可以是十进制或十六进制
let decimal = 17
let binary = 0b10001
let octal = 0o21
let hexadecimal = 0x11

// 十进制的浮点字面量还有一个可选的指数，用大写或小写的 e 表示
// 十六进制的浮点字面量必须有指数，用大写或小写的 p 来表示。
let decimaldouble = 12.1875
let exponentdouble = 1.21875e1
let hexadecimaldouble = 0xC.3p0

// 整数和浮点数都可以添加额外的零或者添加下划线来增加代码的可读性
let paddeddouble = 000123.456
let onemillion = 1_000_000
let justoveronemillion = 1_000_000.000_000_1

// 8 数值类型转换
// 8.1 整数转换
// 要将一种数字类型转换成另外一种类型，你需要用当前值来初始化一个期望的类型
let twothousand: UInt16 = 2_000
let one: UInt8 = 1
let twothousandandone = twothousand + UInt16(one)

// 8.2 整数和浮点数转换
let three = 3
let pointonefouronefivenine = 0.14159
let pi = Double(three) + pointonefouronefivenine

// 用浮点数初始化一个新的整数类型时，数值会被截断
let integerPi = Int(pi)

// 9 类型别名
// 类型别名可以为已经存在的类型定义了一个新的可选名字
typealias audiosample = UInt16
var maxamplitudefound = audiosample.min

// 10 布尔值
let orangesareorange = true
let turnipsaredelicious = false

// if后面必须是Bool类型，否则报错
if turnipsaredelicious {
    print("Mmm, tasty turnips")
} else {
    print("Eww, turnips are horrible")
}

// 11 元组
// 元组把多个值合并成单一的复合型的值
// 元组内的值可以是任何类型，而且可以不必是同一类型
let http404error = (404, "Not Found")

// 可以将一个元组的内容分解成单独的常量或变量
let (number, message) = http404error
print("The status code is \(number)")
print("The status message is \(message)")

// 如果只需要使用其中的一部分数据，不需要的数据可以用 _ 代替

// 另外一种方法就是利用从零开始的索引数字访问元组中的单独元素
print("The status code is \(http404error.0)")
print("The status message is \(http404error.1)")

// 可以在定义元组的时候给其中的单个元素命名
let http200status = (num: 200, des: "OK")
print("The status code is \(http200status.num)")
print("The status message is \(http200status.des)")

// 12 可选项
// 可选项意味着：这里有一个值等于x 或者 根本没有值
let possiblenumber = "123"
let convertednumber = Int(possiblenumber) // 该变量类型为Int?

// 12.1 nil
// 可以通过给可选变量赋值 nil 来将之设置为没有值
var serverRespenseCode: Int? = 404 //变量赋值为int值404
serverRespenseCode = nil //变量现在为空值

// 如果定义的可选变量没有提供默认值，变量会被自动设置成 nil
var surveyanswer: String? //变量为空值

// 12.2 if语句以及强制展开
// 利用 if 语句来判断一个可选变量中是否包含值
if convertednumber != nil {
    print("convertednumber contains some integer value.")
}

// 一旦确定可选中包含值，就可在后面加一个感叹号来获取值（强制转换）
if convertednumber != nil {
    print("convertednumber has an integer value of \(convertednumber!).")
}

// 12.3 可选项绑定
if let actualnumber = Int(possiblenumber) { // 如果转换成功，actualNumber就可以用在 if 语句的第一个分支中
    print("\'\(possiblenumber)\' has an integer value of \(actualnumber)")
} else {
    print("\'\(possiblenumber)\' could not be converted to an integer")
}

// 可在同一个if语句中包含多个可选项绑定，用逗号分隔即可
// 如果任一可选绑定结果是 nil 或者布尔值为 false ，那么整个 if 判断会被看作 false
if let first = Int("4"), let second = Int("42"), first < second && second < 100 {
    print("\(first) < \(second) < 100")
}

// 12.4 隐式展开可选项
// 通过在声明的类型后边添加一个叹号而非问号来书写隐式展开可选项
let assumedstring: String! = "An implicitly unwrapped optional string."
let implicitstring: String = assumedstring

let optionalstring = assumedstring //类型为String?

// 13 错误处理
// 通过在函数声明过程当中加入 throws 关键字来表明这个函数会抛出一个错误
func canThrowAnError() throws {

}

// 调用一个可以抛出错误的函数时，需要在表达式前预置 try 关键字
// Swift会自动将错误传递到它们的生效范围之外，直到它们被 catch 分句处理
do {
    try canThrowAnError()
    // no error
} catch {
    // an error was thrown
}

// 多种错误类型
func makeASandwich() throws {

}
 
do {
    try makeASandwich()
    eatASandwich()
} catch Error.OutOfCleanDishes {
    washDishes()
} catch Error.MissingIngredients(let ingredients) {
    buyGroceries(ingredients)
}

// 14 断言和先决条件
// 断言只在 debug 构建的时候检查，但先决条件则在 debug 和生产构建中生效

// 14.1 使用断言进行调试
// 如果条件判断为 true，代码运行会继续进行；如果条件判断为 false，代码运行结束
let age = -3
assert(age >= 0, "A person's age cannot be less than zero.")

// 如果代码已经检查了条件，你可以使用 assertionFailure() 来标明断言失败
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

// 14.2 强制先决条件
// 在你代码中任何条件可能潜在为假但必须肯定为真才能继续执行的地方使用先决条件
precondition(index > 0, "Index must be greater than zero.")

// 你可以调用preconditionFailure() 来标明错误发生了
