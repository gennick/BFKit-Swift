//
//  UILabelExtension.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import UIKit

// MARK: - UILabel extension

/// This extesion adds some useful functions to UILabel.
public extension UILabel {
    // MARK: - Functions
    
    /// Create an UILabel with the given parameters.
    ///
    /// - Parameters:
    ///   - frame: Label frame.
    ///   - text: Label text.
    ///   - font: Label font.
    ///   - color: Label text color.
    ///   - alignment: Label text alignment.
    ///   - lines: Label text lines.
    ///   - shadowColor: Label text shadow color.
    public convenience init(frame: CGRect, text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment, lines: Int, shadowColor: UIColor = UIColor.clear) {
        self.init(frame: frame)
        self.font = font
        self.text = text
        self.backgroundColor = UIColor.clear
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = lines
        self.shadowColor = shadowColor
    }
    
    /// Create an UILabel with the given parameters.
    ///
    /// - Parameters:
    ///   - frame: Label frame.
    ///   - text: Label text.
    ///   - font: Label font name.
    ///   - size: Label font size.
    ///   - color: Label text color.
    ///   - alignment: Label text alignment.
    ///   - lines: Label text lines.
    ///   - shadowColor: Label text shadow color.
    public convenience init(frame: CGRect, text: String, font: FontName, fontSize: CGFloat, color: UIColor, alignment: NSTextAlignment, lines: Int, shadowColor: UIColor = UIColor.clear) {
        self.init(frame: frame)
        self.font = UIFont(fontName: font, size: fontSize)
        self.text = text
        self.backgroundColor = UIColor.clear
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = lines
        self.shadowColor = shadowColor
    }
    
    /// Calculates height based on text, width and font.
    ///
    /// - Returns: Returns calculated height.
    public func calculateHeight() -> CGFloat {
        let text: String = self.text!
        return UIFont.calculateHeight(width: self.frame.size.width, font: self.font, text: text)
    }
    
    /// Sets a custom font from a character at an index to character at another index.
    ///
    /// - Parameters:
    ///   - font: New font to be setted.
    ///   - fromIndex: The start index.
    ///   - toIndex: The end index.
    public func setFont(_ font: UIFont, fromIndex: Int, toIndex: Int) {
        guard let text = self.text else {
            return
        }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSFontAttributeName, value: font, range: NSRange(location: fromIndex, length: toIndex - fromIndex))
        
        self.attributedText = string
    }
    
    
    /// Sets a custom font from a character at an index to character at another index.
    ///
    /// - Parameters:
    ///   - font: New font to be setted.
    ///   - fontSize: New font size.
    ///   - fromIndex: The start index.
    ///   - toIndex: The end index.
    public func setFont(_ font: FontName, fontSize: CGFloat, fromIndex: Int, toIndex: Int) {
        guard let text = self.text else {
            return
        }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSFontAttributeName, value: UIFont(fontName: font, size: fontSize), range: NSRange(location: fromIndex, length: toIndex - fromIndex))
        
        self.attributedText = string
    }
}
