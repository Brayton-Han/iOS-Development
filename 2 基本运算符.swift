// 2022.01.21

// 1 专门用语

// 2 赋值运算符
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

// 3 算数运算符
// 对所有的数字类型支持四种标准算术运算符: + - * /
// Swift 算术运算符默认不允许值溢出
let str = "Hello" + " world!"

// 3.1 余数运算符
9 % 4 // equals 1
-9 % 4 // equals -1
// 当b为负数时它的正负号被忽略掉，即a % b与a % -b能够获得相同的答案

// 3.2 一元减号运算符
// 直接在要进行操作的值前边放置，不加任何空格
let three = 3
let minusthree = -three

// 3.3 一元加号运算符
// 直接返回它操作的值，不会对其进行任何的修改
let minussix = -6
let alsominussix = +minussix

// 4 组合赋值符号
var a = 1
a += 2

// 5 比较运算符
// == != > < >= <=
// 每个比较运算符都会返回一个 Bool 值
let name = "world"
if name == "world" {
    print("hello, world")
}

// 可以比较拥有同样数量值的元组，只要元组中的每个值都是可比较的
(1, "zebra") < (2, "apple") // true because 1 is less than 2 (don't need to compare string)
(3, "apple") < (3, "bird") // true
(4, "dog") == (4, "dog") // true

// 6 三元条件运算符
// question ? answer1 : answer2
let contentheight = 40
let hasheader = true
let rowheight = contentheight + (hasheader ? 50 : 20)

// 7 合并空值运算符
// a ?? b: 如果可选项 a 有值则展开，没有则返回默认值 b
// a 必须是一个可选类型，b 必须与 a 的储存类型相同
let defaultcolorname = "red"
var userdefinedcolorname: String?
var colornametouse = userdefinedcolorname ?? defaultcolorname // red

userdefinedcolorname = "green"
colornametouse = userdefinedcolorname ?? defaultcolorname // green

// 8 区间运算符
// 8.1 闭区间运算符
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// 8.2 半开区间运算符
// 左闭右开
let names = ["Anna", "Alex", "Brain", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// 8.3 单侧区间
for name in names[2...] 
    print(name) // 2,3
}

for name in names[...2] {
    print(name) // 0,1,2
}

for name in names[..<2] {
    print(name) // 0,1
}

// 不能遍历省略了第一个值的单侧区间，可以遍历省略了最终值的单侧区间，但要确保给循环添加一个显式的条件
// 可以检测单侧区间是否包含特定的值
let range = ...5
range.contains(7) // false
range.contains(5) // true
range.contains(-1) // true

// 9 逻辑运算符
// 9.1 逻辑非运算符
let allowedentry = false
if !allowedentry {
    print("ACCESS DENIED")
}

// 9.2 逻辑与运算符
// 有短路计算
let entereddoorcode = true
let passedretinascan = false
if entereddoorcode && passedretinascan {
    print("Welcome!")
}

// 9.3 逻辑或运算符
let hasdoorkey = false
let knowspassword = true
if hasdoorkey || knowspassword {
    print("Welcome!")
}

// 9.4 混合逻辑运算
if entereddoorcode && passedretinascan || hasdoorkey || knowspassword {
    print("Welcome!")
}

// 9.5 显式括号
// 使复杂表达式更易懂
if (entereddoorcode && passedretinascan) || (hasdoorkey || knowspassword) {
    print("Welcome!")
}
