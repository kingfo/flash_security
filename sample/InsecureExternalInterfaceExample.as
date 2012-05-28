package  {
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class InsecureExternalInterfaceExample extends Sprite {
		
		public function InsecureExternalInterfaceExample() {
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
				ExternalInterface.call(flashvars['param1'],flashvars['param2']);
			}catch (e:Error) {
				trace(e);
			}finally {
				
			}
		}
		
	}

}