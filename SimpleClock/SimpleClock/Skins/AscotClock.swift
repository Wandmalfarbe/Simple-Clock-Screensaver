//
//  PascalAscotClock.swift
//  SimpleClock
//
//  Created by Pascal Wagler on 08/07/16.
//  Copyright (c) 2016 - 2018 Pascal Wagler. All rights reserved.
//

import Foundation
import ScreenSaver

class AscotClock: ClockSkin {

	class Scaling: NSObject, ClockSkinScaling {
		let clockFaceHeight =  CGFloat(0.8)
		let borderWidth =      CGFloat(0.03)

		let majorTickWidth =   CGFloat(0.016)
		let majorTickHeight =  CGFloat(0.14)

		let minorTickWidth =   CGFloat(0.012)
		let minorTickHeight =  CGFloat(0.1)

		let majorTickRadius =  CGFloat(0.475)
		let minorTickRadius =  CGFloat(0.44)

		let secondHandWidth =  CGFloat(0.020)
		let secondHandHeight = CGFloat(0.475)
		let secondHandOverhangWidth = CGFloat(0.02)
		let secondHandOverhangHeight = CGFloat(0.1)

		let minuteHandWidth =  CGFloat(0.02)
		let minuteHandHeight = CGFloat(0.43)
		let minuteHandOverhangWidth = CGFloat(0.02)
		let minuteHandOverhangHeight = CGFloat(0.1)

		let hourHandWidth =    CGFloat(0.02)
		let hourHandHeight =   CGFloat(0.32)
		let hourHandOverhangWidth = CGFloat(0.02)
		let hourHandOverhangHeight = CGFloat(0.1)

		let handCircleRadius = CGFloat(0.02)
	}

	class Color: NSObject, ClockSkinColor {
		let screenBackground = NSColor(red: 0.6744, green: 0.7857, blue: 0.3298, alpha: 1.0).cgColor
		let clockBackground = NSColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

		let border = NSColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0).cgColor
		let majorTick = NSColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
		let minorTick = NSColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor

		let secondHand = NSColor(red: 0.8987, green: 0.9, blue: 0.8956, alpha: 0).cgColor
		let minuteHand = NSColor(red: 0.8987, green: 0.9, blue: 0.8956, alpha: 1.0).cgColor
		let hourHand = NSColor(red: 0.8987, green: 0.9, blue: 0.8956, alpha: 1.0).cgColor
		let handShadow = NSColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
	}

	class Tick: NSObject, ClockSkinTick {
		let totalTicks = 12
		let majorTickEveryX = 3
		let removeTickEveryX = 13
	}

	class LineCap: NSObject, ClockSkinLineCap {
		let majorTick = CGLineCap.butt
		let minorTick = CGLineCap.butt

		let secondHand = CGLineCap.butt
		let secondHandOverhang = CGLineCap.butt

		let minuteHand = CGLineCap.butt
		let minuteHandOverhang = CGLineCap.butt

		let hourHand = CGLineCap.butt
		let hourHandOverhang = CGLineCap.butt
	}

	let scaling: ClockSkinScaling = Scaling()
	let tick: ClockSkinTick = Tick()
	let color: ClockSkinColor = Color()
	let lineCap: ClockSkinLineCap = LineCap()
}
