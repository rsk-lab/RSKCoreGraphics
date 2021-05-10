//
// RectProtocol.swift
//
// Copyright (c) 2021 R.SK Lab Ltd. All Rights Reserved.
//
// Licensed under the RPL-1.5 and R.SK Lab Professional licenses
// (the "Licenses"); you may not use this work except in compliance
// with the Licenses. You may obtain a copy of the Licenses in
// the LICENSE_RPL and LICENSE_RSK_LAB_PROFESSIONAL files.
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the Licenses is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied.
//

import CoreGraphics
import RSKFoundation

/// The protocol to be adopted by a type of object that represents a rectangle in the lower-left-origin coordinate system.
public protocol RectProtocol: ObjectProtocol {
    
    // MARK: - Public Properties
    
    /// A height of the rectangle.
    var height: CGFloat { get set }
    
    /// Coordinates of the origin of the rectangle.
    var origin: CGPoint { get }
    
    /// A size of the rectangle.
    var size: CGSize { get }
    
    /// A width of the rectangle.
    var width: CGFloat { get set }
    
    /// An x-coordinate of the origin of the rectangle.
    var x: CGFloat { get set }
    
    /// A y-coordinate of the origin of the rectangle.
    var y: CGFloat { get set }
    
    // MARK: - Public Initializers
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `origin` and `size`.
    ///
    /// - Parameters:
    ///     - origin: The coordinates of the origin of the rectangle.
    ///     - size: The size of the rectangle.
    ///
    init(origin: CGPoint, size: CGSize)
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `x`, `y`, `width` and `height`.
    ///
    /// - Parameters:
    ///     - x: The x-coordinate of the origin of the rectangle.
    ///     - y: The y-coordinate of the origin of the rectangle.
    ///     - width: The width of the rectangle.
    ///     - height: The height of the rectangle.
    ///
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
}

public extension RectProtocol {
    
    // MARK: - Public Properties
    
    var origin: CGPoint {
        
        get {
            
            CGPoint(x: self.x, y: self.y)
        }
        set {
            
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    
    var size: CGSize {
        
        get {
            
            CGSize(width: self.width, height: self.height)
        }
        set {
            
            self.height = newValue.height
            self.width = newValue.width
        }
    }
    
    // MARK: - Public Initializers
    
    init(origin: CGPoint, size: CGSize) {
        
        self.init(x: origin.x, y: origin.y, width: size.width, height: size.height)
    }
}

public extension RectProtocol {
    
    // MARK: - Public Properties
    
    /// An x-coordinate of the bottom edge of the rectangle.
    var bottom: CGFloat {
        
        get {
            
            self.y
        }
        set {
            
            self.y = newValue
        }
    }
    
    /// Coordinates of the center point of the rectangle.
    var center: CGPoint {
        
        get {
            
            CGPoint(x: self.centerX, y: self.centerY)
        }
        set {
            
            self.centerX = newValue.x
            self.centerY = newValue.y
        }
    }
    
    /// An x-coordinate of the center point of the rectangle.
    var centerX: CGFloat {
        
        get {
            
            self.x + self.width / 2.0
        }
        set {
            
            if self.width > 0.0 {
                
                self.x = newValue - width / 2.0
            }
            else {
                
                self.width = (newValue - self.x) * 2.0
            }
        }
    }
    
    /// A y-coordinate of the center point of the rectangle.
    var centerY: CGFloat {
        
        get {
            
            self.y + self.height / 2.0
        }
        set {
            
            if self.height > 0.0 {
                
                self.y = newValue - height / 2.0
            }
            else {
                
                self.height = (newValue - self.y) * 2.0
            }
        }
    }
    
    /// An x-coordinate of the left edge of the rectangle.
    var left: CGFloat {
        
        get {
            
            self.x
        }
        set {
            
            self.x = newValue
        }
    }
    
    /// Largest value for the x-coordinate of the rectangle.
    var maxX: CGFloat {
        
        self.right
    }
    
    /// Largest value for the y-coordinate of the rectangle.
    var maxY: CGFloat {
        
        self.top
    }
    
    /// Smallest value for the x-coordinate of the rectangle.
    var minX: CGFloat {
        
        self.x
    }
    
    /// Smallest value for the y-coordinate of the rectangle.
    var minY: CGFloat {
        
        self.y
    }
    
    /// An x-coordinate of the right edge of the rectangle.
    var right: CGFloat {
        
        get {
            
            self.x + self.width
        }
        set {
            
            if self.width > 0.0 {
                
                self.x = newValue - width
            }
            else {
                
                self.width = newValue - self.x
            }
        }
    }
    
    /// A y-coordinate of the top edge of the rectangle.
    var top: CGFloat {
        
        get {
            
            self.y + self.height
        }
        set {
            
            if self.height > 0.0 {
                
                self.y = newValue - height
            }
            else {
                
                self.height = newValue - self.y
            }
        }
    }
    
    // MARK: - Public Initializers
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with infinity `x` and `y`, and zero `width` and `height`.
    ///
    init() {
        
        self.init(x: .infinity, y: .infinity, width: 0.0, height: 0.0)
    }
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `height`, infinity `x` and `y`, and zero `width`.
    ///
    /// - Parameters:
    ///     - height: The height of the rectangle.
    ///
    init(height: CGFloat) {
        
        self.init(x: .infinity, y: .infinity, width: 0.0, height: height)
    }
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `origin`, and zero `width` and `height`.
    ///
    /// - Parameters:
    ///     - origin: The coordinates of the origin of the rectangle.
    ///
    init(origin: CGPoint) {
        
        self.init(x: origin.x, y: origin.y, width: 0.0, height: 0.0)
    }
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `size`, and infinity `x` and `y`.
    ///
    /// - Parameters:
    ///     - size: The size of the rectangle.
    ///
    init(size: CGSize) {
        
        self.init(x: .infinity, y: .infinity, width: size.width, height: size.height)
    }
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `width`, infinity `x` and `y`, and zero `height`.
    ///
    /// - Parameters:
    ///     - height: The height of the rectangle.
    ///
    init(width: CGFloat) {
        
        self.init(x: .infinity, y: .infinity, width: width, height: 0.0)
    }
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `x`, infinity `y`, and zero `width` and `height`.
    ///
    /// - Parameters:
    ///     - x: The x-coordinate of the origin of the rectangle.
    ///
    init(x: CGFloat) {
        
        self.init(x: x, y: .infinity, width: 0.0, height: 0.0)
    }
    
    ///
    /// Initializes and returns a new object that conforms to `RectProtocol` with the specified `y`, infinity `x`, and zero `width` and `height`.
    ///
    /// - Parameters:
    ///     - y: The y-coordinate of the origin of the rectangle.
    ///
    init(y: CGFloat) {
        
        self.init(x: .infinity, y: y, width: 0.0, height: 0.0)
    }
}

public extension RectProtocol {
    
    // MARK: - Public Properties
    
    /// An object that conforms to `RectProtocol` expressed as `CGRect` object.
    var cgRect: CGRect {
        
        CGRect(origin: self.origin, size: self.size)
    }
}
