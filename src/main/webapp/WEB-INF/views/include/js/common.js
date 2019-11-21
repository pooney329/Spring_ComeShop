/*views/include/js/common.js*/
/*이미지 파일인지 확인

/정규표현식/

*/
//이미지 파일인 지 아닌지 체크
function checkImageType(fileName){
	var pattern=/jpg|gif|png|jpeg/;
	return fileName.match(pattern);
}

//파일정보  , spring02를 직접 써야한다 자바가아니고 자바스크립트여서 ${path}인식못함
function getFileInfo(fullName){
	var fileName, imgsrc, getLink, fileLink;
	if(checkImageType(fullName)){ //이미지 파일인 경우
		imgsrc="/computer/upload/displayFile?fileName="
			+fullName;
		fileLink=fullName.substr(14); //14 인덱스~끝   
		//파일의 확장자와 앞부분을 구분하는 코드
		var front=fullName.substr(0,12); //0~11   
		var end=fullName.substr(14);
		getLink="/computer/upload/displayFile?fileName="
				+front+end;
	}else{ //이미지가 아닌 경우
		fileLink=fullName.substr(12);
		getLink="/computer/upload/displayFile?fileName="
				+fullName;
	}
	// uuid_filename
	fileName=fileLink.substr(fileLink.indexOf("_")+1);
	return {fileName: fileName, imgsrc: imgsrc,
			getLink: getLink, fullName:fullName };
}



