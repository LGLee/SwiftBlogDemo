import Foundation

//选择排序
var unsortedList : [Int] = []
//排序20个 0-99的随机整数
for i in 0..<20 {
    unsortedList.append(Int(arc4random_uniform(UInt32(100))))
}
print("选择排序原始数组 : \(unsortedList)\n")

//统计一下排序的次数
var sortCount : Int = 0

var sortedList = selectSort(&unsortedList)
print("\n排序后数组 : \(sortedList) \t 次数:\(sortCount)次")

/// 选择排序算法 O(n^2)   n的平方
///
/// - Parameter list: 待排数组
/// - Returns: 排序完毕的数组
private func selectSort(_ list : inout[Int]) -> [Int]{
    //记录最小值
    var minPosition = 0
    //外层遍历所有元素
    for i in 0..<list.count {
        minPosition = i
        //找出剩下中最小数的位置
        for j in (i+1)..<list.count {
            if list[j] < list[minPosition] {
                minPosition = j
            }
        }
        //交换i 和 最小元素的位置
        if i != minPosition {
            swap(&list[i], &list[minPosition])
            sortCount += 1
            print("第\(sortCount)次交换后的结果的为\(list)")
        }
    }
    return list
}
