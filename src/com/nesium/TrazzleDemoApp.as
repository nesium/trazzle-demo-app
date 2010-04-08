//
//  TrazzleDemoApp.as
//
//  Created by Marc Bauer on 2010-02-26.
//  Copyright (c) 2010 nesiumdotcom. All rights reserved.
//

package com.nesium{
	
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.nesium.ui.Menu;
	import com.nesium.ui.MenuItem;
	import com.nesium.ui.StatusBar;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class TrazzleDemoApp extends Sprite{
		
		//*****************************************************************************************
		//*                                   Private Properties                                  *
		//*****************************************************************************************
		private var m_menuItem1:MenuItem;
		private var m_menuItem2:MenuItem;
		private var m_menuItemLabel:Label;
		
		
		
		//*****************************************************************************************
		//*                                     Public Methods                                    *
		//*****************************************************************************************
		public function TrazzleDemoApp(){
			addEventListener(Event.ADDED_TO_STAGE, self_addedToStage);
		}
		
		
		
		//*****************************************************************************************
		//*                                    Private Methods                                    *
		//*****************************************************************************************
		private function startApplication():void{
			// will be displayed in trazzle's tab title
			zz_init(stage, 'Trazzle DemoApp');
			createChildren();
		}
		
		private function createChildren():void{
			var x:int = 100;
			var y:int = 10;
			var w:int = 200;
			var sp:int = 30;
			
			var btn:PushButton = new PushButton(this, x, y, 'Log all supported types', 
				logAllTypesButton_click);
			btn.width = w;
			y += sp;
			
			btn = new PushButton(this, x, y, 'Create log message with stacktrace', 
				demoStackTraceButton_click);
			btn.width = w;
			y += sp;
			
			btn = new PushButton(this, x, y, 'Standard trace', standardTraceButton_click);
			btn.width = w;
			y += sp;
			
			btn = new PushButton(this, x, y, 'Toggle performance window', 
				togglePerformanceWinButton_click);
			btn.width = w;
			btn.toggle = true;
			y += sp;
			
			btn = new PushButton(this, x, y, 'Beep', beepButton_click);
			btn.width = w;
			y += sp;
			
			btn = new PushButton(this, x, y, 'Toggle System Menu', toggleMenuButton_click);
			btn.width = w;
			btn.toggle = true;
			y += sp;
			
			m_menuItemLabel = new Label(this, x, y, '');
			m_menuItemLabel.width = w;
			y += sp;
			
			btn = new PushButton(this, x, y, 'Log BitmapData', logBmpDataButton_click);
			btn.width = w;
			y += sp;
		}
		
		
		
		//*****************************************************************************************
		//*                                         Events                                        *
		//*****************************************************************************************
		private function self_addedToStage(e:Event):void{
			startApplication();
		}
		
		private function logAllTypesButton_click(e:Event):void{
			log('normal');
			log('d debug');
			log('i info');
			log('n notice');
			log('w warning');
			log('e error');
			log('c critical');
			log('f fatal');
		}
		
		private function demoStackTraceButton_click(e:Event):void{
			method1();
		}
		
		private function method1():void{
			method2();
		}
		
		private function method2():void{
			method3();
		}
		
		private function method3():void{
			logFinally();
		}
		
		private function logFinally():void{
			log('Here we go. Click on the small arrow to the left.');
		}
		
		
		private function standardTraceButton_click(e:Event):void{
			trace('Standard trace');
		}
		
		private function togglePerformanceWinButton_click(e:Event):void{
			zz_monitor(PushButton(e.target).selected);
		}
		
		private function beepButton_click(e:Event):void{
			zz_beep();
		}
		
		private function toggleMenuButton_click(e:Event):void{
			if (PushButton(e.target).selected){
				m_menuItem1 = StatusBar.systemStatusBar().addItemWithTitle('MenuItem 1');
				m_menuItem2 = StatusBar.systemStatusBar().addItemWithTitle('MenuItem 2');
				m_menuItem1.addEventListener(MouseEvent.CLICK, menuItem_click);
				m_menuItem2.addEventListener(MouseEvent.CLICK, menuItem_click);
				
				var submenu:Menu = new Menu();
				m_menuItem2.submenu = submenu;
				submenu.addItemWithTitle('MenuItem 2.1').addEventListener(
					MouseEvent.CLICK, menuItem_click);
				submenu.addItemWithTitle('MenuItem 2.2').addEventListener(
					MouseEvent.CLICK, menuItem_click);
				submenu.addItemWithTitle('MenuItem 2.3').addEventListener(
					MouseEvent.CLICK, menuItem_click);
				submenu.addItemWithTitle('MenuItem 2.4').addEventListener(
					MouseEvent.CLICK, menuItem_click);
			}else{
				StatusBar.systemStatusBar().removeItem(m_menuItem1);
				StatusBar.systemStatusBar().removeItem(m_menuItem2);
			}
		}
		
		private function menuItem_click(e:Event):void{
			var item:MenuItem = MenuItem(e.target)
			m_menuItemLabel.text = 'MenuItem with title "' + item.title + '" was clicked.';
			item.selected = !item.selected;
		}
		
		private function logBmpDataButton_click(e:Event):void{
			var bmp:Bitmap = new Assets.Picture();
			log(bmp.bitmapData);
		}
	}
}