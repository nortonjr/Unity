//
//  Vector4.swift
//  Unity
//
//  Created by Helbert Gomes on 06/03/17.
//  Copyright © 2017 Helbert Gomes. All rights reserved.
//

import Foundation

/** Representation of 4D vectors and points. */
public struct Vector4 {
    
    // MARK: - Variable(s).
    
    /** X component of the vector. */
    public private(set) var x: Float
    
    /** Y component of the vector. */
    public private(set) var y: Float
    
    /** Z component of the vector. */
    public private(set) var z: Float
    
    /** W component of the vector. */
    public private(set) var w: Float
    
    /** Returns the length of this vector. */
    public var magnitude: Float {
        return sqrt((x * x) + (y * y) + (z * z) + (w * w))
    }
    
    /** Returns this vector with a magnitude of 1. */
    public var normalized: Float {
        return self.normalize()
    }
    
    // MARK: - Static Variable(s).
    
    /** Shorthand for writing Vector4(1, 1, 1, 1). */
    public static var one: Vector4 {
        return Vector4(x: 1, y: 1, z: 1, w: 1)
    }
    
    /** Shorthand for writing Vector4(0, 0, 0, 0). */
    public static var zero: Vector4 {
        return Vector4(x: 0, y: 0, z: 0, w: 0)
    }
    
    // MARK: - Constructor(s).
    
    public init() {
        self.x = 0
        self.y = 0
        self.z = 0
        self.w = 0
    }
    
    public init(x: Float, y: Float, z: Float, w: Float) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    /** Set x and y components of an existing Vector2. */
    public init(with v: Vector2) {
        self.x = v.x
        self.y = v.y
        self.z = 0
        self.w = 0
    }
    
    /** Set x, y and z components of an existing Vector3. */
    public init(with v: Vector3) {
        self.x = v.x
        self.y = v.y
        self.z = v.z
        self.w = 0
    }
    
    /** Set x, y, z and w components of an existing Vector4. */
    public init(with v: Vector4) {
        self.x = v.x
        self.y = v.y
        self.z = v.z
        self.w = v.w
    }
    
    /** Returns a nicely formatted string for this vector. */
    public func toString() -> String {
        return "Vector4(\(self.x), \(self.y), \(self.z), \(self.w))"
    }
    
    // MARK: - Function(s).
    
    /** Makes this vector have a magnitude of 1. */
    public func normalize() -> Float {
        return (self.x / self.magnitude) + (self.y / self.magnitude) + (self.z / self.magnitude) + (self.w / self.magnitude)
    }
    
    /** Set x, y, z and w components of an existing Vector4. */
    public mutating func set(with v: Vector4) -> Void {
        self.x = v.x
        self.y = v.y
        self.z = v.z
        self.w = v.w
    }
    
    // MARK: - Static Function(s).
    
    /** Returns the angle in degrees between from and to. */
    public static func angle(from: Vector4, to: Vector4) -> Float {
        let a = from.magnitude * to.magnitude
        let b = (from.x * to.x) + (from.y * to.y) + (from.z * to.z) + (from.w * to.w)
        
        return b/a
    }
    
    /** Returns the distance between a and b. */
    public static func distance(from: Vector4, to: Vector4) -> Float {
        return (from - to).magnitude
    }
    
    /** Dot Product of two vectors. */
    public static func dot(lhs: Vector4, rhs: Vector4) -> Float {
        return (lhs.x * rhs.x) + (lhs.y * rhs.y) + (lhs.z * rhs.z) + (lhs.w * rhs.w)
    }
    
    /** Returns a vector that is made from the largest components of two vectors. */
    public static func max(lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(x: lhs.x > rhs.x ? lhs.x : rhs.x,
                       y: lhs.y > rhs.y ? lhs.y : rhs.y,
                       z: lhs.z > rhs.z ? lhs.z : rhs.z,
                       w: lhs.w > rhs.w ? lhs.w : rhs.w)
    }
    
    /** Returns a vector that is made from the smallest components of two vectors. */
    public static func min(lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(x: lhs.x < rhs.x ? lhs.x : rhs.x,
                       y: lhs.y < rhs.y ? lhs.y : rhs.y,
                       z: lhs.z < rhs.z ? lhs.z : rhs.z,
                       w: lhs.w < rhs.w ? lhs.w : rhs.w)
    }
    
    /** Multiplies two vectors component-wise. */
    public static func scale (a: Vector4, b: Vector4) -> Vector4 {
        return Vector4(x: a.x * b.x, y: a.y * b.y, z: a.z * b.z, w: a.w * b.w)
    }
    
    // MARK: - Operator(s).
    
    /** Subtracts one vector from another. */
    public static func - (lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z, w: lhs.w - rhs.w)
    }
    
    /** Adds two vectors. */
    public static func + (lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z, w: lhs.w + rhs.w)
    }
    
    /** Multiplies a vector by a number. */
    public static func * (lhs: Vector4, rhs: Float) -> Vector4 {
        return Vector4(x: lhs.x * rhs, y: lhs.y * rhs, z: lhs.z * rhs, w: lhs.w * rhs)
    }
    
    /** Divides a vector by a number. */
    public static func / (lhs: Vector4, rhs: Float) -> Vector4 {
        return Vector4(x: lhs.x / rhs, y: lhs.y / rhs, z: lhs.z / rhs, w: lhs.w / rhs)
    }
    
    /** Returns true if vectors different. */
    public static func != (lhs: Vector4, rhs: Vector4) -> Bool {
        return lhs.x != rhs.x || lhs.y != rhs.y || lhs.z != rhs.z || lhs.w != rhs.w
    }
    
    /** Returns true if the vectors are equal. */
    public static func == (lhs: Vector4, rhs: Vector4) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w
    }
}
