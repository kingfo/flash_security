package {
	import flash.display.Sprite;
	import web.security.external.SecurityExternalInterface;
	
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class SecurityExternalInterfaceExample extends Sprite {
		
		public function SecurityExternalInterfaceExample() {
			var flashvars:Object = stage.loaderInfo.parameters;
			trace(
				'param1', flashvars['param1'],
				'typeof', typeof flashvars['param1'],
				'param2', flashvars['param2'],
				'typeof', typeof flashvars['param2'],
				'escape', String(flashvars['param2']).split("\\").join("\\\\"),
				'encode', encodeURI(flashvars['param2'])
				);
			try {
				SecurityExternalInterface.watch(this);
				SecurityExternalInterface.call(flashvars['param1'],flashvars['param2']);
			}catch (e:Error) {
				trace(e);
			}finally {
				
			}
		}
	
	}

}