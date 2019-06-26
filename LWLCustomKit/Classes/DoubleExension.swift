//
//  Double+exension.swift
//  Exx
//
//  Created by mqt on 2017/7/7.
//  Copyright © 2017年 mqt. All rights reserved.
//


import Foundation

extension Double {
    
    /**
     向下取第几位小数
     
     - parameter places: 第几位小数 ，1
     
     15.96 * 10.0 = 159.6
     floor(159.6) = 159.0
     159.0 / 10.0 = 15.9
     
     - returns:  15.96 =  15.9
     */
    func f(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return floor(self * divisor) / divisor
    }
    
    /**
     转化为字符串格式
     
     - parameter minF:
     - parameter maxF:
     - parameter minI:
     
     - returns:
     */
    func toString(_ minF: Int = 0, maxF: Int = 10, minI: Int = 1, roundMode: NumberFormatter.RoundingMode = .halfEven) -> String {
        let valueDecimalNumber = NSNumber(value: self)
//        let valueDecimalNumber = NSDecimalNumber(value: self)
        let twoDecimalPlacesFormatter = NumberFormatter()
        twoDecimalPlacesFormatter.maximumFractionDigits = maxF
        twoDecimalPlacesFormatter.minimumFractionDigits = minF
        twoDecimalPlacesFormatter.minimumIntegerDigits = minI
        twoDecimalPlacesFormatter.roundingMode = roundMode
        return twoDecimalPlacesFormatter.string(from: valueDecimalNumber)!
    }
    /**
     转化为金额格式
     
     - parameter minF:
     - parameter maxF:
     - parameter minI:
     
     - returns:
     */
    func toDecimalString(_ minF: Int = 0, maxF: Int = 10, minI: Int = 1, roundMode: NumberFormatter.RoundingMode = .halfEven) -> String {
//        let str = String(self)//精度缺失
//        let str = "\(self)"//精度缺失
//        let str = String(format: "%lf", self)//精度缺失，只能精确到6位
//        let str = String(format: "%.8lf", self)//精度缺失，不能只舍不入,后面多此一举了
//        let str = String(stringInterpolationSegment: self)//精度缺失
//        let valueDecimalNumber = NSDecimalNumber(value: self)
//        print(valueDecimalNumber.stringValue)
        let valueDecimalNumber = NSNumber(value: self)
        let twoDecimalPlacesFormatter = NumberFormatter()
        twoDecimalPlacesFormatter.maximumFractionDigits = maxF
        twoDecimalPlacesFormatter.minimumFractionDigits = minF
        twoDecimalPlacesFormatter.minimumIntegerDigits = minI
        twoDecimalPlacesFormatter.roundingMode = roundMode
        let str = twoDecimalPlacesFormatter.string(from: valueDecimalNumber)!
        return str
    }
    /**
     除法结果转换为string
     
     - parameter divisor:除数（不为零）
     - parameter dec:保留小数位
     */
    func divideResultToString(divisor:Double?,dec:Int = 3)->String{
        guard let divisor = divisor,divisor != 0,self != 0 else {
            return ""
        }
        return String(format: "%.\(dec)f", self / divisor)
    }
    
    /**
     
     乘积换成String
     - parameter multi:乘数
     - parameter dec:保留小数位
     */
    func multiResultToString(multi:Double?,dec:Int = 3)->String{
        guard let multi = multi,self != 0,multi != 0 else {
            return ""
        }
        return String(format: "%.\(dec)f", self * multi)
    }
    
}
