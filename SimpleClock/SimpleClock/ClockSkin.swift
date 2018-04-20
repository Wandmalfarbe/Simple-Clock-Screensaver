//
//  ClockSkin.swift
//  SimpleClock
//
//  Created by Pascal Wagler on 08/07/16.
//  Copyright © 2016 Pascal Wagler. All rights reserved.
//

import Foundation

protocol ClockSkin {

	var scaling: ClockSkinScaling { get }
	var color: ClockSkinColor { get }
	var tick: ClockSkinTick { get }
	var lineCap: ClockSkinLineCap { get }
}

protocol ClockSkinScaling {
	var clockFaceHeight: CGFloat { get }
	var borderWidth: CGFloat { get }

	var majorTickWidth: CGFloat { get }
	var majorTickHeight: CGFloat { get }

	var minorTickWidth: CGFloat { get }
	var minorTickHeight: CGFloat { get }

	var majorTickRadius: CGFloat { get }
	var minorTickRadius: CGFloat { get }

	var secondHandWidth: CGFloat { get }
	var secondHandHeight: CGFloat { get }
	var secondHandOverhangWidth: CGFloat { get }
	var secondHandOverhangHeight: CGFloat { get }

	var minuteHandWidth: CGFloat { get }
	var minuteHandHeight: CGFloat { get }
	var minuteHandOverhangWidth: CGFloat { get }
	var minuteHandOverhangHeight: CGFloat { get }

	var hourHandWidth: CGFloat { get }
	var hourHandHeight: CGFloat { get }
	var hourHandOverhangWidth: CGFloat { get }
	var hourHandOverhangHeight: CGFloat { get }

	var handCircleRadius: CGFloat { get }
}

protocol ClockSkinColor {
	var screenBackground: CGColor { get }
	var clockBackground: CGColor { get }

	var border: CGColor { get }
	var majorTick: CGColor { get }
	var minorTick: CGColor { get }

	var secondHand: CGColor { get }
	var minuteHand: CGColor { get }
	var hourHand: CGColor { get }
	var handShadow: CGColor { get }
}

protocol ClockSkinTick {
	var totalTicks: Int { get }
	var majorTickEveryX: Int { get }
	var removeTickEveryX: Int { get }
}

protocol ClockSkinLineCap {
	var majorTick: CGLineCap { get }
	var minorTick: CGLineCap { get }

	var secondHand: CGLineCap { get }
	var secondHandOverhang: CGLineCap { get }

	var minuteHand: CGLineCap { get }
	var minuteHandOverhang: CGLineCap { get }

	var hourHand: CGLineCap { get }
	var hourHandOverhang: CGLineCap { get }
}
