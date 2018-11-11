//
//  SwissRailwayClockDark.swift
//  SimpleClock
//
//  Created by Pascal Wagler on 31/07/16.
//  Copyright (c) 2016 - 2018 Pascal Wagler. All rights reserved.
//

import Foundation
import ScreenSaver

class KundoQuartzRepetitionWestGermanyWecker: ClockSkin {

	class Scaling: NSObject, ClockSkinScaling {
		let clockFaceHeight =  CGFloat(0.57)
		let borderWidth =      CGFloat(0.025)

		let majorTickWidth =   CGFloat(0.012)
		let majorTickHeight =  CGFloat(0.015)

		let minorTickWidth =   CGFloat(0.0025)
		let minorTickHeight =  CGFloat(0.02)

		let majorTickRadius =  CGFloat(0.453)
		let minorTickRadius =  CGFloat(0.455)

		let secondHandWidth =  CGFloat(0.005)
		let secondHandHeight = CGFloat(0.37)
		let secondHandOverhangWidth = CGFloat(0.025)
		let secondHandOverhangHeight = CGFloat(0.001)

		let minuteHandWidth =  CGFloat(0.015)
		let minuteHandHeight = CGFloat(0.37)
		let minuteHandOverhangWidth = CGFloat(0.015)
		let minuteHandOverhangHeight = CGFloat(0.001)

		let hourHandWidth =    CGFloat(0.022)
		let hourHandHeight =   CGFloat(0.275)
		let hourHandOverhangWidth = CGFloat(0.022)
		let hourHandOverhangHeight = CGFloat(0.001)

		let handCircleRadius = CGFloat(0.03)
	}

	class Color: NSObject, ClockSkinColor {
		let screenBackground = NSColor(srgbRed: 0.17, green: 0.1671, blue: 0.1846, alpha: 1.0).cgColor
		let clockBackground = NSColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor

		let border = NSColor(srgbRed: 0.9354, green: 0.9354, blue: 0.9354, alpha: 0).cgColor
		let majorTick = NSColor(srgbRed: 0.9354, green: 0.9354, blue: 0.9354, alpha: 1.0).cgColor
		let minorTick = NSColor(srgbRed: 0.9354, green: 0.9354, blue: 0.9354, alpha: 1.0).cgColor

		let secondHand = NSColor(srgbRed: 0.8942, green: 0.3633, blue: 0.2739, alpha: 1.0).cgColor
		let minuteHand = NSColor(srgbRed: 0.9354, green: 0.9354, blue: 0.9354, alpha: 1.0).cgColor
		let hourHand = NSColor(srgbRed: 0.9354, green: 0.9354, blue: 0.9354, alpha: 1.0).cgColor
		let handShadow = NSColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
	}

	class Tick: NSObject, ClockSkinTick {
		let totalTicks = 60
		let majorTickEveryX = 5
		let removeTickEveryX = 61
	}

	class LineCap: NSObject, ClockSkinLineCap {
		let majorTick = CGLineCap.round
		let minorTick = CGLineCap.round

		let secondHand = CGLineCap.round
		let secondHandOverhang = CGLineCap.round

		let minuteHand = CGLineCap.round
		let minuteHandOverhang = CGLineCap.round

		let hourHand = CGLineCap.round
		let hourHandOverhang = CGLineCap.round
	}

	let scaling: ClockSkinScaling = Scaling()
	let tick: ClockSkinTick = Tick()
	let color: ClockSkinColor = Color()
	let lineCap: ClockSkinLineCap = LineCap()
}
