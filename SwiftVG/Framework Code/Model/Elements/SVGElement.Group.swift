//
//  SVGElement.Group.swift
//  SwiftVG
//
//  Created by Ben Gottlieb on 4/22/18.
//  Copyright © 2018 Stand Alone, inc. All rights reserved.
//

import Foundation

import Foundation

extension SVGElement {
	class Group: SVGElement.Container {
		init(parent: SVGElement? = nil, attributes: [String: String]) {
			super.init(kind: .group, parent: parent)
			self.load(attributes: attributes)
		}
		
		override func draw(in ctx: CGContext) {
			ctx.saveGState()
			defer { ctx.restoreGState() }
			
			if let transform = self.attributes?["transform"]?.embeddedTransform { ctx.concatenate(transform) }
			super.draw(in: ctx)
		}
	}
}