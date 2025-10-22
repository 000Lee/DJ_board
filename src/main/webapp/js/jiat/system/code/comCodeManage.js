var codeM = {
    global : {
        createHtmlStr : "",
        createRadioHtmlStr : "",
        ajaxOpt : "",
        selectCode : "",

        searchAjaxData : "",
        gridDataItem : "",
    },

    fn_defaultScript : function() {
        codeM.load();
    },

    load : function(){
        codeM.global.searchAjaxData = {};
        codeM.global.ajaxOpt = {
                url : _g_contextPath_ + "/system/code/getCmGroupCodeList.do",
                async: false,
                data : codeM.global.searchAjaxData,
                successFn : function(data){
                    var main = data.groupCodeList;

                    $("#groupCodeDiv").empty();
                    $("#groupCodeRadioDiv").empty();

                    codeM.global.createRadioHtmlStr = "";
                    codeM.global.createHtmlStr = "<ul>";
                    if(main.length > 0){
                        for(var i = 0; i < main.length; i++){
                            codeM.global.createHtmlStr += "<li id='groupCode_" + main[i].CM_GROUP_CODE_ID + "'>" + main[i].CM_GROUP_CODE_NM;

                            if(main[i].childrenCode != null){
                                codeM.childrenCodeSet(main[i].childrenCode);
                            }

                            codeM.global.createHtmlStr += "</li>";

                            codeM.global.createRadioHtmlStr += "<input type='radio' id='groupCodeRadio_" + main[i].CM_GROUP_CODE_ID + "' name='groupCodeRadio' class='groupCodeRadio' value='" + main[i].CM_GROUP_CODE_ID + "'>" +
                                "<label for='groupCodeRadio_" + main[i].CM_GROUP_CODE_ID + "'>" + main[i].CM_GROUP_CODE_NM + "</label>"
                        }

                        $("#groupCodeDiv").append(codeM.global.createHtmlStr);
                        $("#groupCodeRadioDiv").append(codeM.global.createRadioHtmlStr);

                    }
                    codeM.global.createHtmlStr = "</ul>";

                    $($("input[name='groupCodeRadio']")[0]).prop("checked", true);
                },
                failFn : function (request,status,error) {
                    alert("오류가 발생하였습니다. 관리자에게 문의하세요.\n errorCode :"+request.responseText+"\n");
                }
        };
        acUtil.ajax.call(codeM.global.ajaxOpt);

        $(".codeIdCla").click(function(){
            codeM.onDataBound(this.getAttribute("groupCodeId"), this.getAttribute("cmCodeId"));
        })

        $('input[type=radio][name=groupCodeRadio]').change(function(){
            codeM.onDataReset(this.getAttribute("id"));
        });
    },

    childrenCodeSet : function(childrenCode){
        codeM.global.createHtmlStr += "<ul>";

        for(var j = 0; j < childrenCode.length; j++){
            codeM.global.createHtmlStr += "<li id='codeId_" + childrenCode[j].CM_CODE_ID + "' class='codeIdCla' groupCodeId='" + childrenCode[j].CM_GROUP_CODE_ID + "' cmCodeId='" + childrenCode[j].CM_CODE_ID + "'>";
            codeM.global.createHtmlStr +=   childrenCode[j].CM_CODE_NM;
            codeM.global.createHtmlStr += "</li>"
        }

        codeM.global.createHtmlStr += "</ul>";
    },

    onDataBound : function(g, c){
        codeM.global.searchAjaxData = {
            cmGroupCodeId : g,
            cmCodeId : c
        }

        codeM.global.ajaxOpt = {
            url : _g_contextPath_ + "/system/code/getCmCodeInfo.do",
            async: false,
            data : codeM.global.searchAjaxData,
            successFn : function(data){
                var data = data.result;
                var radioBtn = $("input[type=radio][name='groupCodeRadio'][value=" + data.CM_GROUP_CODE_ID + "]");
                radioBtn.prop("checked", true);

                $("#groupCodeText").text($("label[for=" + radioBtn.attr("id") + "]").text());
                $("#cmCodeId").val(data.CM_CODE_ID);
                $("#cmCode").val(data.CM_CODE);
                $("#cmCodeNm").val(data.CM_CODE_NM);
                $("#active"+ data.ACTIVE).prop("checked", true);

                codeM.global.selectCode = data.CM_CODE;

                var num = data.SORT;
                if(Number(num) < 1){
                    num = 1;
                }
                var val = "00000000" + num;

                $("#sort").val(val.slice(-8, val.length));
            },
            failFn : function (request,status,error) {
                alert("오류가 발생하였습니다. 관리자에게 문의하세요.\n errorCode :"+request.responseText+"\n");
            }
        };
        acUtil.ajax.call(codeM.global.ajaxOpt);
    },

    sortUpDown : function(e, t){
        if(t == "up"){
            var val = "00000000" + (Number($(e).val()) + 1);
            $(e).val(val.slice(-8, val.length));
        }else{
            var num = 1;
            if(Number($(e).val()) < 2){
                num = 1;
            }else{
                num = Number($(e).val()) - 1;
            }
            var val = "00000000" + num;
            $(e).val(val.slice(-8, val.length));
        }
    },

    onDataReset : function(e){
        codeM.global.selectCode = "";

        $("#groupCodeText").text($("label[for=" + e + "]").text());
        $("#cmCodeId").val("");
        $("#cmCode").val("");
        $("#cmCodeNm").val("");
        $("#activeY").prop("checked", true);
        $("#sort").val("00000001");
    },

    setCmCode : function(){
        if(!$("#cmCodeNm").val()){
            alert($("#groupCodeText").text() + "을(를) 입력해주세요.");
            $("#cmCodeNm").focus()
            return;
        }else if(!$("#cmCode").val()){
            alert("구분코드를 입력해주세요.");
            $("#cmCode").focus()
            return;
        }

        if(codeM.global.selectCode != $("#cmCode").val()){
            if(codeM.getCodeValidationChk()){
                alert("중복된 코드가 있습니다.\n구분코드를 다시 입력해주세요.");
                $("#cmCode").focus()
                return;
            }
        }

        if(confirm("코드를 등록하시겠습니까?")){
            codeM.global.searchAjaxData = {
                cmGroupCodeId : $('input[type=radio][name=groupCodeRadio]:checked').val(),
                cmCodeId : $("#cmCodeId").val(),
                cmCode : $("#cmCode").val(),
                cmCodeNm : $("#cmCodeNm").val(),
                empSeq : "1"
            }

            codeM.global.ajaxOpt = {
                url : _g_contextPath_ + "/system/code/setCmCodeSave.do",
                async: false,
                data : codeM.global.searchAjaxData,
                successFn : function(data){
                    alert("등록되었습니다.");
                    codeM.load();
                    codeM.onDataReset($('input[type=radio][name=groupCodeRadio]:checked').attr('id'));
                },
                failFn : function (request,status,error) {
                    alert("오류가 발생하였습니다. 관리자에게 문의하세요.\n errorCode :"+request.responseText+"\n");
                }
            }
            acUtil.ajax.call(codeM.global.ajaxOpt);
        }
    },

    getCodeValidationChk : function(){
        var result = false;

        codeM.global.searchAjaxData = {
            cmGroupCodeId : $('input[type=radio][name=groupCodeRadio]:checked').val(),
            cmCode : $("#cmCode").val()
        }

        codeM.global.ajaxOpt = {
            url : _g_contextPath_ + "/system/code/getCodeValidationChk.do",
            async: false,
            data : codeM.global.searchAjaxData,
            successFn : function(data){
                result = data.rs;
            },
            failFn : function (request,status,error) {
                alert("오류가 발생하였습니다. 관리자에게 문의하세요.\n errorCode :"+request.responseText+"\n");
            }
        }
        acUtil.ajax.call(codeM.global.ajaxOpt);
        return result;
    },

    setCmCodeDel : function(){
        if(!$("#cmCodeId").val()){
            alert("삭제할 코드를 선택해주세요.");
            return;
        }

        if(confirm("코드 삭제시 하위 코드를 사용하실 수 없습니다.\n삭제하시겠습니까?")){
            codeM.global.searchAjaxData = {
                cmCodeId : $("#cmCodeId").val()
            }

            codeM.global.ajaxOpt = {
                url : _g_contextPath_ + "/system/code/setCmCodeDel.do",
                async: false,
                data : codeM.global.searchAjaxData,
                successFn : function(data){
                    alert("삭제되었습니다.");
                    codeM.load();
                    codeM.onDataReset($('input[type=radio][name=groupCodeRadio]:checked').attr('id'));
                },
                failFn : function (request,status,error) {
                    alert("오류가 발생하였습니다. 관리자에게 문의하세요.\n errorCode :"+request.responseText+"\n");
                }
            }
            acUtil.ajax.call(codeM.global.ajaxOpt);
        }
    },
}