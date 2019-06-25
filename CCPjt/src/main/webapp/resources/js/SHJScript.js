/*SHJ4359 개인 스크립트*/

$(document).ready(function() {
		
	// 서머노트
    $('#summernote').summernote({
		lang: 'ko-KR',
        height: 350,
        minHeight: null,
        maxHeight: null,
        focus: true  
    });
    var postForm = function() {
    	var content = $('textarea[name="b_content"]').html($('#summernote').code());
    }
		
});