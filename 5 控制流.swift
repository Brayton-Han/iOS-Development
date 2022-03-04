// 2022.01.25

// 1 For-in循环
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print(name);
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("...")
} // 不会按照写入顺序输出，因为是无序的

for index in 1...5 {
    print("...")
}

let base = 3
let power = 10
var ans = 1
for _ in 1...power {  // 不需要的值用下划线代替
    ans *= base;
}

let minutes = 60
for tickMark in 0..<minutes {

}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // [0, minutes) 间隔为5
}

let hour = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hour, by: hourInterval) {
    // [3, hourInterval] 间隔为3
}

// 2 While循环
// 最好在第一次循环后还有未知数量的遍历时使用

// 2.1 While
while condition {
    statements
}

// 2.2 Repeat-While
repeat {
    statements
} while condition

// 3 条件语句
// 3.1 If
// 单一条件
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("...")
} else if temperatureInFahrenheit >= 86 {
    print("...")
} else {  // 可选
    print("...")
}

// 3.2 Switch
// 基于第一个匹配成功的模式来执行合适的代码块
switch value {
case pattern 1:
    ...
case pattern 2, pattern 3:
    ...
default:
    ...
}

// 3.2.1 没有隐式贯穿
// 每个pattern自动break
// 每个情况的函数体必须包含至少一个可执行语句，下面是语法错误的
switch char {
case "a":
case "A":
    print("...")
default:
    print("...")
}

// 3.2.2 区间匹配
switch number {
case 0:
    print("...")
case 1..<5:
    print("...")
case 5...10:
    print("...")
default:
    print("...")
}

// 3.2.3 元组
// 允许多个switch情况来判断相同的值，但只会执行首次匹配
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("...")
case (_, 0):
    print("...")
case (0, _):
    print("...")
case (-2...-2, -2...-2):
    print("...")
default:
    print("...")
}

// 3.2.4 值绑定
// 可以将匹配到的值临时绑定为一个常量或者变量 来给情况的函数体使用
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("...")
case (0, var y):
    print("...")
case let (x, y): // 此时不需要default
    print("...")
}

// 3.2.5 Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("...")
case let (x, y) where x == -y:
    print("...")
case let (x, y):
    print("...")
}

// 3.2.6 复合情况
switch char {
case "a", "e", "i", "o", "u":
    print("...")
default
    print("...")
}

switch point {
case (let distance, 0), (0, let distance):
    print("...")
}

// 4 控制转移语句
// 4.1 Continue
for a in b {
    if condition {
        contunue
    } else {
        ...
    }
}

// 4.2 Break
// 4.2.1 循环语句中的Break
// 立即结束循环的执行

// 4.2.2 Switch语句里的Break
// 若匹配类型没有操作则可以用break
switch char {
case "a":
    break
case "b":
    print("...")
default:
    print("...")
}

// 4.3 Fallthrough
// 可显式声明
switch char {
case "a":
    print("...")
    fallthrough
case "b":
    print("...")
default:
    print("...")
}

// 4.4 给语句打标签
// 显式地标记需要break/continue的循环或者条件语句
lable: while condition {
    switch char {
    case "a":
        break lable
    case "b":
        continue lable
    default:
        ...
    }
}

// 5 提前退出
// guard语句 要求条件必须为真才能执行guard之后的语句
// 总有一个else语句，必须结束guard所在的代码块，可用 return break continue throw
// condition中使用的可选项绑定后续都可用
guard condition else {
    ...
}

// 6 检查API的可用性
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
