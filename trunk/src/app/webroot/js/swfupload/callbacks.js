/**
 * Callbacks Script for SWFUpload
 * This file sets up most of the callbacks for a common
 * installation of SWFUpload.  Works best with the css 
 * files and initialization file that accompanied it 
 * in the package you downloaded. 
 *
 * This script is not copyrighted, but please leave
 * my name and link in the header 
 * so others can learn how to achieve this look and feel
 * for SWFUpload from my website. Thanks.
 * 
 * CakePHP Users: to integrate with cakephp, 
 * see http://bakery.cakephp.org/articles/view/296
 * 
 * @author James Revillini http://james.revillini.com
 * @version 1.0
 */

function fileQueued(file, queuelength) {
	var listingfiles = document.getElementById('SWFUploadFileListingFiles');

	if(!listingfiles.getElementsByTagName('ul')[0]) {
		var info = document.createElement('h4');
		info.appendChild(document.createTextNode('File queue'));
		listingfiles.appendChild(info);
		var ul = document.createElement('ul')
		listingfiles.appendChild(ul);
	}
	
	listingfiles = listingfiles.getElementsByTagName('ul')[0];
	var li = document.createElement('li');
	li.id = file.id;
	li.className = 'SWFUploadFileItem';
	li.innerHTML = '<div class="fileInfo">' + file.name + ' <a id="' + file.id + 'deletebtn" class="swfuploadbtn cancelbtn" href="javascript:swfu.cancelFile(\'' + file.id + '\');">Cancel</a></div><div class="progressBar" id="' + file.id + 'progress"><div class="progressMeter" style="display:none;" id="' + file.id + 'meter"></div></div>';
	listingfiles.appendChild(li);
	
	var queueinfo = document.getElementById('queueinfo');
	queueinfo.innerHTML = queuelength + ' files queued';
	document.getElementById(swfu.movieName + 'UploadBtn').style.display = 'block';
	document.getElementById('cancelqueuebtn').style.display = 'block';
}

function uploadFileCancelled(file, queuelength) {
	var li = document.getElementById(file.id);
	li.innerHTML = file.name + ' - cancelled';
	li.className = 'SWFUploadFileItem uploadCancelled';
	var queueinfo = document.getElementById('queueinfo');
	queueinfo.innerHTML = queuelength + ' files queued';
}

function uploadFileStart(file, position, queuelength) {
	var div = document.getElementById('queueinfo');
	div.innerHTML = 'Uploading file ' + position + ' of ' + queuelength;

	var li = document.getElementById(file.id);
	li.className += ' fileUploading';
	
	var meter = document.getElementById(file.id + 'meter');
	meter.style.display = 'block';
}

function uploadProgress(file, bytesLoaded) {
	var meter = document.getElementById(file.id + 'meter');
	var percent = Math.ceil((bytesLoaded / file.size) * 100);
	meter.style.width = percent + '%';
}

function uploadError(errno) {
	// SWFUpload.debug(errno);
}

function uploadFileComplete(file) {
	var li = document.getElementById(file.id);
	li.className = 'SWFUploadFileItem uploadCompleted';
}

function cancelQueue() {
	swfu.cancelQueue();
	document.getElementById(swfu.movieName + 'UploadBtn').style.display = 'none';
	document.getElementById('cancelqueuebtn').style.display = 'none';
}

function uploadQueueComplete(file) {
	var div = document.getElementById('queueinfo');
	div.innerHTML = 'All files have been uploaded.'
	document.getElementById('cancelqueuebtn').style.display = 'none';
}