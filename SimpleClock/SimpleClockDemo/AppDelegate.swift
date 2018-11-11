//
//  AppDelegate.swift
//  SimpleClockDemo
//
//  Created by Pascal Wagler on 02/08/16.
//  Copyright (c) 2016 - 2018 Pascal Wagler. All rights reserved.
//

import Cocoa
import ScreenSaver

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

	func applicationDidFinishLaunching(_ aNotification: Notification) {

	}

	func applicationWillTerminate(_ aNotification: Notification) {

	}

	@objc func applicationShouldTerminateAfterLastWindowClosed(_ theApplication: NSApplication) -> Bool {
		return true
	}
}
