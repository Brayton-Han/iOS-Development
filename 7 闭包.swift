// 2022.01.28

// 闭包是可以在代码中被传递和引用的功能性独立代码块
// 闭包能够捕获和存储定义在其上下文中的任何常量和变量的引用
// 全局函数是一个有名字但不会捕获任何值的闭包
// 内嵌函数是一个有名字且能从其上层函数捕获值的闭包
// 闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包

// 1 闭包表达式
// 是一种在简短行内就能写完闭包的语法

// 1.1 Sorted方法
// 不修改原数组，返回一个新数组
let names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward) // 排序闭包需为一个(String, String) -> Bool类型的函数
// 上述写法有些复杂

// 1.2 闭包表达式语法
// 一般形式
// 不能提供默认值，可变形式参数需在参数列表的最后面使用
{ (parameters) -> return_type in
    statements
}
// sort的闭包写法
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2})

// 1.3 从语境中推断类型
// 当闭包被用作函数的实际参数时都不需要用完整格式来书写行内闭包
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

// 1.4 从单表达式闭包隐式返回
// 单表达式闭包可删掉 return 关键字
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})

// 1.5 简写的实际参数名
reversedNames = names.sorted(by: {$0 > $1})

// 1.6 运算符函数
reversedNames = names.sorted(by: >)

// 2 尾随闭包
reversedNames = names.sorted() {$0 > $1}
reversedNames = names.sorted {$0 > $1}

// 3 捕获值

// 4 闭包是引用类型

// 5 逃逸闭包

// 6 自动闭包