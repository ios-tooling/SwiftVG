//
//  XMLParser.swift
//  SwiftVG
//
//  Created by Ben Gottlieb on 4/21/18.
//  Copyright © 2018 Stand Alone, inc. All rights reserved.
//

import Foundation

class SVGParser: NSObject {
	var image: SVGImage!
	var url: URL?
	let data: Data
	var xmlParser: XMLParser!
	var root: Element! { return self.currentTree.first }
	var size: CGSize?
	
	var title: String?
	var currentTree: [Element] = []
	
	init(data: Data, from url: URL? = nil) {
		self.data = data
		self.url = url
	}
	
	func start(with image: SVGImage) {
		self.image = image
		self.xmlParser = XMLParser(data: self.data)
		self.xmlParser.delegate = self
		self.xmlParser.parse()
	}
	
	func finished() {
		print("Done: \(self.root!.toString())")
	}
	
	func draw(in ctx: CGContext) {
		self.root?.draw(in: ctx)
	}
}

