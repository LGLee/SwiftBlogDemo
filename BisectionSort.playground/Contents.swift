

/*
 
 二分查找法
 
 */


import UIKit

var str = "Hello, man"

var list = [Int]()//待查随机模拟数组
var item = 0
//造一个有十个元素的模拟数据数组
for i in 0..<10 {
    item = item + Int(arc4random_uniform(UInt32(20)));
    list.append(item)
}

//随机一个元素
let targetNum = list[Int(arc4random_uniform(UInt32(10)))]
print("原始数组为: \(list) 目标数字为: \(targetNum)")
//compareTimes : 记录比较次数
var compareTimes = 0
//result : 记录结果
var result = binarySearch(targetNum,list)
print("搜索结果: \(result)  比较次数 : \(compareTimes)")

/// 二分查找法  时间复杂度: O(logN)---2为底,N的对数
///
/// - Parameters:
///   - targetNum: 目标数字
///   - sourceList: 原始数组
/// - Returns: 目标数值在原始数组中的位置
func binarySearch(_ targetNum:Int, _ sourceList:[Int]) -> Int{
    var start = 0
    var end = sourceList.count - 1
    //只要没有指向同一个数,则继续查找
    while start <= end {
        compareTimes += 1
        //取中值
        var middle = (start + end)/2
        print("----第\(compareTimes)次比较的中值为\(sourceList[middle])")
        //如果中值等于目标值,直接返回中值index
        if targetNum == sourceList[middle] {
            return middle
        }
        //如果目标小于中值.说明在前半段
        if targetNum < sourceList[middle] {
            end = middle - 1
        }
        //如果目标大于中值.说明在后半段
        if targetNum > sourceList[middle] {
            start = middle + 1
        }
    }
    //没有找到
    return -1
}
