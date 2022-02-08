//
//  Swift+Example.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 19.09.2021.
//

protocol SomeProtocol {

    func methodA()
}

extension SomeProtocol {

    func methodA() {
        print("methodA")
    }
}

class ClassOne {

    var someware: (
        (Int) -> (Bool) -> Double
    )?

    func method() {
        let dfunc: (Bool) -> Double = cfunc
        let lfunc: (Bool) -> Double = xfunc

        someware = { (a: Int) in
            if a == 1 {
                return dfunc
            } else {
                return lfunc
            }
        }
    }

    func cfunc(_ v: Bool) -> Double {
        if v {
            return 5.0
        } else {
            return 3.0
        }
    }

    func xfunc(_ v: Bool) -> Double {
        if v {
            return 1.0
        } else {
            return 4.0
        }
    }
}

class A {

    var b: B?

    var propX: String = "" {
        didSet {
            b?.propY = propX
            print("A.propX")
        }
    }
}

class B {

    weak var a: A?

    var propY: String = "" {
        didSet {
            a?.propX = propY
            print("B.propY")
        }
    }
}
