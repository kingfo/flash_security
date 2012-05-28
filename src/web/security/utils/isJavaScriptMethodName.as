package web.security.utils {
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	
	
	public function isJavaScriptMethodName(methodName:String):Boolean {
		var regexp:RegExp = /^[A-Za-z0-9._]*$/g;
		return regexp.test(methodName);
	}

}