//
//  Magazine.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 15/11/23.
//

import Foundation

struct Point {
    var x: Double
    var y: Double
}

struct LineEquation {
    var a: Double = 0
    var b: Double = 0
    var c: Double = 0
}

class Magazine {
    var width: Double
    var height: Double
    
    var pointA: Point {
        return Point(x: 0, y: 0)
    }

    var pointB: Point {
        return Point(x: 2 * width, y: 0)
    }

    var pointC: Point {
        return Point(x: 2 * width, y: height)
    }

    var pointD: Point {
        return Point(x: 0, y: height)
    }

    var pointE: Point {
        return Point(x: width, y: 0)
    }

    var pointG: Point {
        let equation1: LineEquation = calculayeLineEquation(point1: pointD, point2: pointE)
        let equation2: LineEquation = calculayeLineEquation(point1: pointA, point2: pointC)

        return calculatecalculateLineIntercection(lineEquation1: equation1, lineEquation2: equation2)
    }

    var pointH: Point {
        let equation1: LineEquation = calculayeLineEquation(point1: pointC, point2: pointE)
        let equation2: LineEquation = calculayeLineEquation(point1: pointB, point2: pointD)

        return calculatecalculateLineIntercection(lineEquation1: equation1, lineEquation2: equation2)
    }

    var pointF: Point {
        return Point(x: pointH.x, y: 0)
    }

    var pointI: Point {
        let equation1: LineEquation = calculayeLineEquation(point1: pointC, point2: pointE)
        let equation2: LineEquation = calculayeLineEquation(point1: pointF, point2: pointG)

        return calculatecalculateLineIntercection(lineEquation1: equation1, lineEquation2: equation2)
    }

    var pointJ: Point {
        let equation1: LineEquation = calculayeLineEquation(point1: .init(x: pointA.x, y: pointI.y), point2: .init(x: pointB.x, y: pointI.y))
        let equation2: LineEquation = calculayeLineEquation(point1: pointD, point2: pointB)

        return calculatecalculateLineIntercection(lineEquation1: equation1, lineEquation2: equation2)
    }

    var pointK: Point {
        let equation1: LineEquation = calculayeLineEquation(point1: pointJ, point2: .init(x: pointJ.x, y: pointC.y))
        let equation2: LineEquation = calculayeLineEquation(point1: pointA, point2: pointC)

        return calculatecalculateLineIntercection(lineEquation1: equation1, lineEquation2: equation2)
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func calculayeLineEquation(point1: Point, point2: Point) -> LineEquation {
        var lineEquation: LineEquation = .init()

        lineEquation.a = point1.y - point2.y
        lineEquation.b = point2.x - point1.x
        lineEquation.c = (point1.x * point2.y) - (point2.x * point1.y)
        
        return lineEquation
    }

    func calculateLineIntercectionEquationY(lineEquation1: LineEquation, lineEquation2: LineEquation) -> Double {
        return ((lineEquation1.a * lineEquation2.c) - (lineEquation2.a * lineEquation1.c)) / (-(lineEquation1.a * lineEquation2.b) + (lineEquation2.a * lineEquation1.b))
    }

    func calculateLineIntercectionEquationX(lineEquation1: LineEquation, y: Double) -> Double {
        return (-(lineEquation1.b * y) - lineEquation1.c) / lineEquation1.a
    }

    func calculatecalculateLineIntercection(lineEquation1: LineEquation, lineEquation2: LineEquation) -> Point {
        let y: Double = calculateLineIntercectionEquationY(lineEquation1: lineEquation1, lineEquation2: lineEquation2)

        let x: Double = calculateLineIntercectionEquationX(lineEquation1: lineEquation2, y: y)

        return .init(x: x, y: y)
    }
}
