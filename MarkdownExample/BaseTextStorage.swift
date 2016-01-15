//
//  BaseTextStorage.swift
//  MarkdownExample
//
//  Created by Max Schoening on 1/15/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import UIKit

class BaseTextStorage: NSTextStorage {

	private let storage = NSMutableAttributedString()

	override var string: String {
		return storage.string
	}

	override func attributesAtIndex(location: Int, effectiveRange range: NSRangePointer) -> [String : AnyObject] {
		return storage.attributesAtIndex(location, effectiveRange: range)
	}

	override func replaceCharactersInRange(range: NSRange, withAttributedString attrString: NSAttributedString) {
		let beforeLength = (string as NSString).length
		storage.replaceCharactersInRange(range, withAttributedString: attrString)
		let afterLength = (string as NSString).length
		edited(.EditedCharacters, range: range, changeInLength: beforeLength - afterLength)
	}

	override func setAttributes(attrs: [String : AnyObject]?, range: NSRange) {
		storage.setAttributes(attrs, range: range)
		edited(.EditedAttributes, range: range, changeInLength: 0)
	}
}
