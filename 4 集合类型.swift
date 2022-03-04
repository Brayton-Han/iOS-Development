// 2022.01.24

// 1 集合的可变性
// 数组是有序的值的集合 合集是唯一值的无序集合 字典是无序的键值对集合
// 若将集合赋值给变量那么后续可变，若赋值给常量则不可变

// 2 数组
// 2.1 数组类型简写语法
Array<Element>
[Element] // 更推荐

// 2.2 创建一个空数组
var someInt = [Int]()
var someInt1: [Int] = []

someInt.append(3)

someInt = [] // 因为之前已经指定了类型，所以此处的类型仍然为[int]

// 2.3 使用默认值创建数组
var threeDoubles = Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]

// 2.4 通过连接两个数组来创建数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// 2.5 使用数组字面量创建数组 
var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"] // 可以自动推断

// 2.6 访问和修改数组
shoppingList.count //检查数量
shoppingList.isEmpty //检查是否为空
shoppingList.append("Flour") //添加元素
shoppingList += ["Baking Powder"]
shoppingList[0] //索引
shoppingList.contains("Tea") //查询
shoppingList[4...6] = ["Bananas", "Apples"] //数量可以不匹配
shoppingList.insert("Maple Syrup", at: 0) //插入at之前
let mapleSyrup = shoppingList.remove(at: 0) //即删除时会返回该值
let apples = shoppingList.removeLast()

// 2.7 遍历一个数组
for item in shoppingList
    print(item)

for (index, value) in shoppingList.enumerated()
    print("Item \(index + 1): \(value)")

// 3 合集
// 无序 + 无重复

// 3.1 Set类型的哈希值
// 被存储的类型必须是可哈希的，哈希值为Int
// 若a == b，则a.hashValue == b.hashValue
// Swift的默认类型都是可哈希的，自行定义的类型必须定义类型为Int的hashValue属性

// 3.2 合集类型语法
Set<Element> //无简写形式

// 3.3 创建并初始化一个空合集
var letters = Set<Character>()
var letters1: Set<Character> = []
letters.insert("a")
letters = []

// 3.4 使用数组字面量创建合集
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"] //Set必须显式！类型可推断

// 3.5 访问和修改合集
favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("Jazz")
favoriteGenres.remove("Rock") //若没有则返回nil
favoriteGenres.contains("Funk")

// 3.6 遍历合集
for genre in favoriteGenres
    print(genre)

for genre in favoriteGenres.sorted() { //默认从小到大
    print(genre)
}

// 4 执行合集操作
// 4.1 基本合集操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
oddDigits.intersection(evenDigits) // AB
oddDigits.symmetricDifference(evenDigits) // A + B - 2AB
oddDigits.union(evenDigits) // A + B - AB
oddDigits.subtracting(evenDigits) // A - B

// 4.2 合集成员关系和相等性
oddDigits == evenDigits // false
oddDigits.isSubset(of: evenDigits) // false
oddDigits.isStrictSubset(of: evenDigits) // false 不等
evenDigits.isSuperset(of: oddDigits) // false
evenDigits.isStrictSuperset(of: oddDigits) // false
oddDigits.isDisjoint(with: evenDigits) // true 完全不同

// 5 字典
// 5.1 字典类型简写语法
Dictionary<KeyType, ValueType>
[KeyType: ValueType]

// 5.2 创建一个字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// 5.3 用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// 5.4 访问和修改字典
airports.count
airports.isEmpty
airports["LHR"] = "London" // 创建
airports["LHR"] = "London Heathrow" // 修改

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB is \(oldValue).")
} // updateValue返回的是？类型

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
} // 下标形式返回的也是？类型

airports["DUB"] = nil //移除
let removedValue = airports.removeValue(forKey: "DUB")

// 5.5 遍历字典
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print(airportCode)
}
for airportName in airports.values {
    print(airportName)
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
// 以特定顺序遍历用sorted()
