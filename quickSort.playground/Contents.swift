
/*
   快速排序
 */

import Foundation
//快速排序
 var unsortedList : [Int] = []
//排序20个 0-99的随机整数
 for i in 0..<20 {
     unsortedList.append(Int(arc4random_uniform(UInt32(100))))
 }
print("快排原始数组 : \(unsortedList)\n\n")

//统计一下快排的次数
var sortCount : Int = 0

//时间复杂度为O(NlogN)
quickSort(&unsortedList, low: 0, high: unsortedList.count - 1)

//递归调用
private func quickSort(_ list : inout [Int], low : Int, high : Int){
    if low < high {
        let prePivot = quickSortNode(&list, low: low, high: high)
        quickSort(&list, low: low, high: prePivot - 1)
        quickSort(&list, low: prePivot + 1, high: high)
    }
}
//单次快排
private func quickSortNode(_ list : inout [Int], low : Int ,high : Int) -> Int{
    var low = low
    var high = high
    let pivot = list[low]
    //上下未相遇
    while low < high {
        //从后面找一个比pivot小的数,填入pivot位置
        while low < high && list[high]>=pivot {
            high -= 1
        }
        list[low] = list[high]
        //从前面找一个比pivot大的数,填入刚刚放入位置
        while low < high && list[low]<=pivot {
            low += 1
        }
        list[high] = list[low]
    }
    //pivot放入坑
    list[low] = pivot
    //统计快排次数的
    sortCount += 1
    print("第\(sortCount)次快排后的结果 result:\(list)\n")
    return low
}
