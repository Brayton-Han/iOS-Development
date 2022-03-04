// 2022.01.26

// 1 定义和调用函数
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Brayton"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!" // 简写
}

// 2 函数的形式参数和返回值
// 2.1 无形式参数的函数
func sayHelloWorld() -> String {
    return "hello, world!"
}
print(sayHelloWorld())

// 2.2 多形式参数的函数
// 函数名可以相同，但参数类型/返回类型要有区别
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

// 2.3 无返回值的函数
// 其实有返回值，是Void，是一个空的元组()
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")

// 返回值可以被忽略
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

// 2.4 多返回值的函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var curMin = array[0]
    var curMax = array[0]
    for value in array[1..<array.count] {
        if value < curMin {
            curMin = value
        } else if value > curMax {
            curMax = value
        }
    }
    return (curMin, curMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print(bounds.min)
print(bounds.max)

// 2.5 可选元组返回类型
// 若元组在返回时可能没有值，则使用可选元组返回类型，在后面加上一个？
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    // 同上
}
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print(bounds.min)
    print(bounds.max)
}

// 2.6 隐式返回的函数
// 如果函数体是一个单一的表达式，那么函数隐式返回这个表达式
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))

// 3 函数实际参数标签和形式参数名
// 每个函数的形式参数都包含实际参数标签和形式参数名
// 实际参数标签用在调用函数的时候，每一个实际参数前边都要写实际参数标签
// 所有的形式参数必须有唯一的名字，但多个形式参数可能拥有相同的实际参数标签

// 3.1 指定实际参数标签
// 在形式参数名之前使用实际参数标签
func greet(person: String, from hometown: String) -> String {
    return person + " " + hometown
}
print(greet(person: "Bill", from: "Cupertino"))

// 3.2 省略实际参数标签
// 使用_来为形式参数代替显式地实际参数标签
func someFunction(_ first: Int, second: Int) {
    print(first)
    print(second)
}
someFunction(1, second: 2) // 无论如何都要按顺序传参

// 3.3 默认形式参数值
func some(para: Int = 12) {
    print(para)
}
some(para: 6)
some()

// 3.4 可变形式参数
// 函数可拥有多个可变形式参数，可变形式参数后的第一个形式参数必须有实际参数标签
func mean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for num in numbers {
        total += num
    }
    return total / Double(numbers.count)
}
print(mean(1, 2, 3, 4, 5))

// 3.5 输入输出形式参数
// 只能将变量作为输入输出形式参数的实际参数
func swap(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}
var x = 3
var y = 107
swap(&x, &y)

// 4 函数类型
// 由形式参数类型和返回类型组成
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
} // 类型为 (Int, Int) -> Int
func print() {
    print("...")
} // 类型为 () -> Void

// 4.1 使用函数类型
var math: (Int, Int) -> Int = add
print(math(2, 3)) // 效果：不用写实际参数标签

let anothermath = add // 可以自动推断

// 4.2 函数类型作为形式参数类型
func printresult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(function(a, b))
}
printresult(add, 3, 5)

// 4.3 函数类型作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func choose(back: Bool) -> (Int) -> Int {
    return back ? stepBackward : stepForward
}
var cur = 3
let move = choose(back: cur > 0)

// 5 内嵌函数
// 即在函数内部定义的函数
// 默认在外部被隐藏，但可以通过包裹它们的函数来调用
// 包裹的函数可以返回内嵌函数作为返回值
func choosestep(back: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    return back ? stepBackward : stepForward
}
var cur = -4
let move = choosestep(back: cur > 0)
while cur != 0 {
    print(cur)
    cur = move(cur)
}
