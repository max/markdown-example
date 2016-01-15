//
//  TextEditorViewController.swift
//  MarkdownExample
//
//  Created by Max Schoening on 1/15/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import UIKit

class TextEditorViewController: UIViewController {

	// MARK: - Properties

	let textView: UITextView = {
		let textStorage = MarkdownTextStorage()
		let layoutManager = NSLayoutManager()
		let textContainer = NSTextContainer()
		layoutManager.addTextContainer(textContainer)
		textStorage.addLayoutManager(layoutManager)

  		let view = UITextView(frame: .zero, textContainer: textContainer)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.font = UIFont.systemFontOfSize(16)
		return view
	}()


	// MARK: - UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Markdown"

		view.backgroundColor = .whiteColor()

		view.addSubview(textView)

		NSLayoutConstraint.activateConstraints([
			textView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
			textView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
			textView.topAnchor.constraintEqualToAnchor(view.topAnchor),
			textView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
		])
	}
}
