package js.jquery;

typedef DamnUploaderOptions =
{
	/**
	 * URL to upload (default: '/upload.php'). Every upload will be performed in a separate request.
	 */
	@:optional var url : String;

	/**
	 * allows to select several files (default: true)
	 */
	@:optional var multiple : Bool;

	/**
	 * sets file field name. For ex., it will be used as index in $_FILES when upload handled by PHP. (default: 'file')
	 */
	@:optional var fieldName : String;

	/**
	 * switch on drag&drop functionality (default: true)
	 */
	@:optional var dropping : Bool;

	/**
	 * container for drag&drop. You may pass selector or jQuery chained object (default: false)
	 */
	@:optional var dropBox : Dynamic;

	/**
	 * used to limit count of files to put in queue (default: false, means no limit)
	 */
	@:optional var limit : Int;

	/**
	 * expected response type, 'text' or 'json' (default: 'text')	
	 */
	@:optional var dataType : String;
}

typedef UploadItem =
{
	var file : js.html.File;
	var fieldName : String;
	var replaceName : String;
	dynamic function progressCallback(percent:Float) : Void;
	dynamic function completeCallback(succ:Bool, data:Dynamic, status:Dynamic) : Void;
	
	function id() : String;
	
	function addPostData(name:String, value:String) : Void;
	
	/**
	 * Start upload. You not need to call this method when duStart() method is used.
	 */
	function upload() : Void;
	
	/**
	 * Cancel upload and remove item from queue.
	 */
	function cancel() : Void;
	
	/**
	 * Read file as defined format and pass data to callback.
	 * Possible formats are: 'Text', 'DataURL', 'BinaryString', 'ArrayBuffer'.
	 */
	function readAs(format:String, callb:Dynamic->Void) : Void;
}

/**
 * jQuery events: du.add, du.limit, du.completed.
 */
extern class DamnUploader
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/DamnUploader.js");
	}
	
	static inline function damnUploader(jq:js.JQuery, ?params:DamnUploaderOptions) : DamnUploader untyped
	{
		return jq.damnUploader(params);
	}
	
	/**
	 * Start queued files uploading
	 * If you prefer start upload immediately after file added, you doesn't need to call this method,
	 * you can call UploadItem.start() instead (see desc. below), for example, when 'du.add' event fired.
	 */
	function duStart() : Void;
	
	/**
	 * Cancel upload by it id.
	 * We recommend to use UploadItem.cancel() method instead.
	 */
	function duCancel(queueId:String) : Void;
	
	/**
	 * Cancel all queued files uploading and clear queue. Active uploads will be canceled too
	 */
	function duCancelAll() : Void;

	/**
	 * Adds some data (it may not be a File object necessarily, see duNewUploadItem() method desc.) to upload queue
	 * Use this method, if you want to add custom data to upload as file.
	 * Method can interpret not only File or File-compatible objects.
	 * In case of given argument is not File-compatible, will attempt to convert it into such,
	 * according to the rules described in duNewUploadItem() method description (see below).
	 */
	function duEnqueue(item:Dynamic) : Void;
	
	/**
	 * Returns all queued items in hash like {uploadID: uploadItemObject}
	 */
	function duGetQueue() : Dynamic;
	
	/**
	 * Returns count of queued items
	 */
	function duCount() : Int;
	
	/**
	 * Change some option value. name can be: 'url', 'fieldName', 'limit', 'dataType'.
	 */
	function duOption(name:String, value:Dynamic) : Void;
	
	/**
	 * Creates UploadItem object from some data, according to the following rules:
	 * 
	 * if arg is already instance of UploadItem, it will be returned as is;
	 * if arg is File-compatible object (window.File and window.Blob are), creates UploadItem with data & type contained inside it;
	 * if arg is dataURI, parses it and creates UploadItem with defined data & type;
	 * in other cases tries to call toString() method and create blob with type 'text/plain', then creates UploadItem from it.
	 * 
	 * UploadItem object, created by this method may be customized and then added to upload queue or uploaded instantly by calling it upload() method. duEnqueue() calls this method independently, if needed.	
	 */
	function duNewUploadItem(fileOrData:Dynamic) : UploadItem;
}