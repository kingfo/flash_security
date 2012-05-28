package web.security.external {
	import flash.display.DisplayObjectContainer;
	import flash.external.ExternalInterface;
	
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class SecurityExternalInterface {
		
		public static function get available():Boolean {
			return ExternalInterface.available;
		}
		
		public static function get marshallExceptions():Boolean {
			return ExternalInterface.marshallExceptions;
		}
		
		public static function set marshallExceptions(value:Boolean):void {
			ExternalInterface.marshallExceptions = value;
		}
		
		public static function get objectID():String {
			return ExternalInterface.objectID;
		}
		
		public function SecurityExternalInterface() {
		
		}
		
		public static function addCallback(methodName:String, closure:Function):void {
			ExternalInterface.addCallback.call(ExternalInterface, methodName, closure);
		}
		
		public static function call(methodName:String, ... args):* {
			if (isAllowAccess == -1) {
				throw new Error("Should have use SecurityExternalInterface.watch() first");
			}
			if (isAllowAccess == 0)
				return undefined;
			for (var p:*in args) {
				if (args[p] is String) {
					args[p] = parameterEscapeFix(args[p]);
				}
			}
			trace(methodName);
			args.unshift(methodName);
			return ExternalInterface.call.apply(ExternalInterface, args);
		}
		
		/**
		 * To wath a Document class to external interface
		 * @param	documentClass		the AS or MXML entry point
		 */
		public static function watch(documentClass:DisplayObjectContainer):void {
			var urlRegExp:RegExp = /^(http|https):\/\/w{0,3}[a-zA-Z0-9_\-.:#\/~}]+/;
			var swfURL:String = documentClass.loaderInfo.url;
			var location:String = ExternalInterface.call("location.href.toString");
			swfURL = swfURL.match(urlRegExp)[0];
			if (location.indexOf(swfURL) < 0) {
				isAllowAccess = 1;
			} else {
				isAllowAccess = 0;
			}
		}
		
		private static var isAllowAccess:int = -1;
	
	}

}