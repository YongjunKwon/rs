var error = "#_error_";

$.extend($.validator, {
    messages: {
        ext: $.validator.format("허용된 업로드 파일이 아닙니다. 업로드 가능한 확장자는 [{0}] 입니다."),
        rrn: "올바른 주민등록번호형식이 아닙니다.",        
        maxByteLength: "{0}자({1}byte) 이하로 입력 가능합니다."
    }
});

$.validator.setDefaults({
    debug: false,
    ignore: "input:hidden",
    onkeyup: false,
    onclick: false,
    onfocusout: false,
    showErrors: function(messages, elements) {
        $(":input", this.currentForm).parent().removeClass("form_invalid");
        if (elements.length > 0) {
            var messageType = $(this.currentForm).data("message");
            var messageMap = new Map();
            var index = 0;

            $.each(messages, function (name, message) {
                $(elements[index++].element).parent().addClass("form_invalid");

                // 동일한 에러 메시지 filtering
                var errorKey = (name.indexOf(".") > -1) ? name.split(".")[1] : name;
                if (!messageMap.containsKey(errorKey)) {
                    messageMap.put(errorKey, message);
                }
            });

            if (messageType == "alert") {
            	var alertMessages = "";
            	$.each(messageMap.values(), function(index, message) {
            		alertMessages += message + "\n";
            	});
                alert(alertMessages);
            } else {
                $("#errorContainer").empty();
            	$.each(messageMap.values(), function(index, message) {
            		$("#errorContainer").append($("<li>", {text: message}));
            	});
                $(".section_required").show();

                if ($(error).length) {
                    $("body").animate({scrollTop: $(error).offset().top}, 10);
                }
            }
        }
    }
});

$.fn.addRules = function (options) {
    this.each(function () {
        $(this).rules("add", options);
    });
};

$.validator.addMethod("maxByteLength", function(value, element, param) {
	var totCnt = 0;
	for(var i = 0; i < value.length; i++) {
        var byteStr = value.charAt(i);
        if(escape(byteStr).length > 4){
        	totCnt += 3;
        }else{
            totCnt += 1;
        }
    }
	if(totCnt > param[1]) {
		return false;
	}
	return true;	
});

$.validator.addMethod("ext", function(value, element, param) {
    var valid = false;
    var uploadExtension = value.split(".").pop().toLowerCase();
    if (value != "" && uploadExtension) {
        $.each(param.split(", "), function(index, allowedExtension) {
            if ($.trim(uploadExtension) == $.trim(allowedExtension)) {
                valid = true;
                return false;
            }
        });
    } else {
        valid = true;
    }
    return valid;
});

$.validator.addMethod("rrn", function(value, element, params) {
    if ($.isArray(params)) {
        for (var i = 0; i < params.length; i++) {
            value += $(params[i]).val();
        }
    }
    value = value.replace(/-/g,"");

    if (value.length != 13) {
        return false;
    }
    var tempGbCd = value.substr(7, 1);
    if (tempGbCd == "A" || tempGbCd == "B") {
        return true;
    }
    var sum = 0;

    if (this.optional(element) || value.match(/\d{2}[0-1]\d{1}[0-3]\d{1}\d{7}/)) {
        if (value.substr(6, 1) >= 5 && value.substr(6, 1) <= 8) { //외국인
            if (Number(value.substr(7, 2)) % 2 != 0) return false;
            for (var i = 0; i < 12; i++) {
                sum += Number(value.substr(i, 1)) * ((i % 8) + 2);
            }
            if ((((11 - (sum % 11)) % 10 + 2) % 10) == Number(value.substr(12, 1))) {
                return true;
            }
            return false;

        } else { //내국인
            for (var i = 0; i < 12; i++) {
                sum += Number(value.substr(i, 1)) * ((i % 8) + 2);
            }
            if (((11 - (sum % 11)) % 10) == Number(value.substr(12, 1))) {
                return true;
            }
            return false;
        }
    } else {
        return false;
    }
});

/**
 * 필수입력 미입력 안내 내용을 초기화 시키후 숨긴고,
 * invalid class가 추가된 것들을 없애준다.
 */
$.resetInvalid = function (){
    $(".lst_square").empty();
    $(".section_required").hide();

    $(".form_invalid").each(function (index) {
        $(this).removeClass("form_invalid");
    });
};

function getAllowedExtensions() {
    var allowedExtensions = "";

    $.ajax({
        url: "comm/syst/file/findUploadConst.do",
        type: "get",
        dataType: "json",
        async: false
    }).done(function (data) {
        //console.log(data.uploadConst.extention);
        allowedExtensions = data.uploadConst.extention;
    }).fail(function (xhr, textStatus, errorThrown) {
    });
    return allowedExtensions;
}