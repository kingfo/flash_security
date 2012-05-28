package web.security.external {
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	
	public function parameterEscapeFix(str:String):String {
		return str.split("\\").join("\\\\");
	}

}