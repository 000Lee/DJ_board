<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/template/common.jsp" flush="true"></jsp:include>

<!DOCTYPE html>
<html>

<head>
    <c:set var="title" value=""/>
    <c:set var="modeText" value=""/>
    <c:choose>
        <c:when test="${gubun eq 'banner'}">
            <c:set var="title" value="배너정보"/>
        </c:when>
        <c:otherwise>
            <c:set var="title" value="팝업정보"/>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${mode eq 'update'}">
            <c:set var="modeText" value="수정"/>
        </c:when>
        <c:otherwise>
            <c:set var="modeText" value="등록"/>
        </c:otherwise>
    </c:choose>

    <jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
        <jsp:param value="${title}${modeText}" name="headerTitle"/>
    </jsp:include>
</head>

<style>
    .custom-tooltip {
        position: relative;
    }
    /* 툴팁 텍스트를 숨김 */
    .tooltip-text {
        display: none;
        position: absolute;
        top: 50%;
        left: calc(100% + 10px); /* 오른쪽으로 이동하도록 수정 */
        transform: translateY(-50%);
        background-color: white;
        color: #333;
        padding: 25px;
        border: 1px solid #ccc;
        border-radius: 5px;
        z-index: 1;
        max-width: 345px; /* 툴팁의 최대 너비 설정 */
    }
    /* 아이콘에 호버 시 툴팁 텍스트 표시 */
    .custom-tooltip:hover .tooltip-text {
        display: block;
    }
    /* 말풍선 모양 스타일 */
    .tooltip-text::before {
        content: "";
        position: absolute;
        top: 50%;
        right: 100%;
        margin-top: -5px; /* 말풍선 위치 조정 */
        border-width: 5px;
        border-style: solid;
        border-color: transparent;
        border-left-color: #ccc; /* 말풍선 색상 설정 */
    }

    .__red {color:#e82a3d !important;}

    .fa-lg {font-size: 1.33333333em;line-height: 0.75em;vertical-align: -5%;}

    #preview {max-width: 100%; max-height: 100%;}
</style>

<body>
<jsp:include page="/WEB-INF/jsp/mngr/template/top.jsp" flush="true"></jsp:include>
<div class="row">
    <jsp:include page="/WEB-INF/jsp/mngr/template/left.jsp" flush="true"></jsp:include>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h2 class="sub-header">${title}${modeText}</h2>
        <div class="form-inline text-right" style="width: 80%;">
            <img width="90" height="40" src="/asset/images/logo.png">
        </div>
        <div class="row">
            <div class="col-sm-12 pt-3">
                <table class="__tbl respond2 fix">
                    <tbody>
                    <tr>
                        <th>시작시간 <span class="__red">*</span></th>
                        <td class="tal" colspan="3">
                            <input type="hidden" id="returnStartDt" value="${map.bannerPopupStartDt}">
                            <input type="text" class="dateInput" id="startDt" name="startDt" style="width:16rem" value=""/>
                            <input type="hidden" id="returnStartDay" value="${map.startDay}" />
                            <input type="text" id="startTime" name="startTime" style="width: 12rem">
                            <input type="hidden" id="returnStartTime" value="${map.startTime}" />
                        </td>
                    </tr>
                    <tr>
                        <th>종료시간 <span class="__red">*</span></th>
                        <td class="tal" colspan="3">
                            <input type="hidden" id="returnEndDt" value="${map.bannerPopupEndDt}">
                            <input type="text" class="dateInput" id="endDt" name="endDt" style="width:16rem;" value="">
                            <input type="hidden" id="returnEndDay" value="${map.endDay}" />
                            <input type="text" id="endTime" name="endTime" style="width: 12rem">
                            <input type="hidden" id="returnEndTime" value="${map.endTime}" />
                        </td>
                    </tr>
                    <tr>
                        <th>출력여부 <span class="__red">*</span></th>
                        <td class="tal" colspan="3">
                            <label class="__lab">
                                <input type="radio" id="chkUseAt0" name="chkUseAt" value="0" checked/>
                                <i></i><span>출력</span>
                            </label>
                            <label class="__lab">
                                <input type="radio" id="chkUseAt1" name="chkUseAt" value="1">
                                <i></i><span>출력안함</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th>출력형식 <span class="__red">*</span></th>
                        <td class="tal" colspan="3">
                            <label class="__lab">
                                <input type="radio" id="chkGubun0" name="chkGubun" value="0">
                                <i></i><span>레이어형식</span>
                            </label>
                            <label class="__lab">
                                <input type="radio" id="chkGubun1" name="chkGubun" value="1" checked/>
                                <i></i><span>팝업형식</span>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <th>팝업창 크기
                            <a href='#' class="custom-tooltip">
                                <i class='fa fa-lg fa-info-circle'></i>
                                <span class="tooltip-text" style="width: 345px; text-align: left;">
                                    <strong>팝업 이미지 안내</strong><br>
                                    홈페이지는 1920x1080에 최적화 되어 있습니다.<br>
                                    세로는 500px의 이미지가 적당합니다.
                                </span>
                            </a>
                        </th>
                        <td class="tal" colspan="3">
                            <span>가로</span>
                            <input type="text" style="width: 20%; margin-left:5px; margin-right:5px;" class="__inp" id="bannerPopupWidth"
                                   name="bannerPopupWidth" value="${map.bannerPopupWidth}"
                                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"/>px
                            <span style="margin-left:20px;">세로</span>
                            <input type="text" style="width: 20%; margin-left:5px; margin-right:5px;" class="__inp" id="bannerPopupHeight"
                                   name="bannerPopupHeight" value="${map.bannerPopupHeight}"
                                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"/>px

                            <%--<a href='#' class="custom-tooltip" style="float:right;">
                                <i class='fa fa-lg fa-info-circle'></i>
                                <span class="tooltip-text">
                                    <strong>팝업 이미지 안내</strong><br>
                                    홈페이지는 1920x1080에 최적화 되어 있습니다.<br>
                                    세로는 500px의 이미지가 적당합니다.
                                </span>
                            </a>--%>
                        </td>
                    </tr>
                    <tr>
                        <th>팝업창 위치</th>
                        <td class="tal" colspan="3">
                            <span>위쪽여백</span>
                            <input type="text" style="width: 20%; margin-left:5px; margin-right:5px;" class="__inp" id="bannerPopupTop"
                                   name="bannerPopupTop" value="${map.bannerPopupTop}"
                                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"/>px
                            <span style="margin-left:20px;">왼쪽여백</span>
                            <input type="text" style="width: 20%; margin-left:5px; margin-right:5px;" class="__inp" id="bannerPopupLeft"
                                   name="bannerPopupLeft" value="${map.bannerPopupLeft}"
                                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"/>px
                        </td>
                    </tr>
                    <tr>
                        <th>링크주소</th>
                        <td class="tal" colspan="3">
                            <input type="text" class="__inpLink" id="bannerPopupLink" name="bannerPopupLink"
                                   value="${map.bannerPopupLink}"
                                   maxlength="200"/>
                            <select class="__inp" name="bannerPopupTarget" id="bannerPopupTarget">
                                <option value="0" selected>새창</option>
                                <option value="1">현재창</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>팝업창 제목 <span class="__red">*</span></th>
                        <td class="tal" colspan="3">
                            <input type="text" class="__inp" id="bannerPopupTitle" name="bannerPopupTitle"
                                   value="${map.bannerPopupTitle}" maxlength="30"/>
                        </td>
                    </tr>
                    <tr>
                        <th>팝업내용 <span class="__red">*</span><br>
                        <button class="btn btn-default" style="margin-top:5px;width:160px;height:70px;font-size:15px;" onclick="previewPopup()">미리 보기</button>
                        </th>
                        <td colspan="3">
                            <div class="__file">
                                <c:choose>
                                    <c:when test="${!empty fileMap}">
                                        <input type="text" id="inputFile" class="__inp" name="inputFile"
                                               style="height: 3.4rem; line-height: 21px;display: flex;flex-direction: column;"
                                               onclick="fileDown('${fileMap.BANNER_POPUP_FILE_PATH}${fileMap.BANNER_POPUP_FILE_MASK}','${fileMap.BANNER_POPUP_FILE_NAME}.${fileMap.BANNER_POPUP_FILE_EXTENTION}')"
                                               value="${fileMap.BANNER_POPUP_FILE_NAME}.${fileMap.BANNER_POPUP_FILE_EXTENTION}" readonly />
                                        <span class="__btn3 black" onclick="$('#files').click()" style="cursor:pointer"><span>파일선택</span></span>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" id="inputFile" class="__inp" name="inputFile"
                                               style="height: 3.4rem; line-height: 21px;display: flex;flex-direction: column;"
                                               placeholder="팝업이미지는 미리 크기를 정해주세요. jpg/png 확장자만 가능" value="" readonly />
                                        <span class="__btn3 black" onclick="$('#files').click()" style="cursor:pointer"><span>파일선택</span></span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <input type="file" id="files" name="files" onchange="readURL(this);" style="display: none"><br/>
                            <div id="previewDiv" style="width: 200px; height: 200px; border: 1px solid #acacac;">
                            <c:choose>
                                <c:when test="${!empty fileMap}">
                                    <img id="preview" src="${fileMap.BANNER_POPUP_FILE_PATH}${fileMap.BANNER_POPUP_FILE_MASK}"/>
                                </c:when>
                                <c:otherwise>
                                    <img id="preview"/>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="__btWrap cen __mt40" style="margin-right:300px;">
                    <button class="__btn1 blue" id="btnSave">
                        <c:choose>
                            <c:when test="${mode eq 'update'}">
                                <span>수정</span>
                            </c:when>
                            <c:otherwise>
                                <span>등록</span>
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <button class="__btn1 black" id="btnList">
                        <span>목록</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var gubun = '${gubun}';
    var mode = '${mode}';
    var url = "";
    var popupFile;
    var previewInput;
    if(mode == 'write'){
        var state = 'new';
    }else{
        var state = 'old';
    }

    if (gubun == 'banner') {
        url = "/mngr/bannerpopup/bannerList.do";
    } else {
        url = "/mngr/bannerpopup/popupList.do";
    }
    var returnStartTime = '${map.startTime}';
    var returnEndTime = '${map.endTime}';
    var returnGubun = '${map.bannerPopupGubun}';
    var returnTarget = '${map.bannerPopupTarget}';
    var returnUseAt = '${map.useAt}';
    var uuid = '${map.uuid}'

    var retrunFilePath = '${fileMap.BANNER_POPUP_FILE_PATH}';
    var retrunFileMask = '${fileMap.BANNER_POPUP_FILE_MASK}';
    var imgSrc = retrunFilePath + retrunFileMask;


    if (returnStartTime.length == 1) {
        returnStartTime = "0" + returnStartTime;
    }

    if (returnEndTime.length == 1) {
        returnEndTime = "0" + returnEndTime;
    }

    $(function () {
        var today = new Date();
        var tomorrow = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
        var defalutStartTime = "09시";
        var defalutEndTime = "18시";

        var finalStartDt;
        var finalStartTime;
        var finalEndDt;
        var finalEndTime;

        if(!$("#returnStartDt").val()){
            finalStartDt = today;
            finalEndDt = tomorrow;
            finalStartTime = defalutStartTime;
            finalEndTime = defalutEndTime;
        }else{
            finalStartDt = $("#returnStartDt").val();
            finalEndDt = $("#returnEndDt").val();
            finalStartTime = returnStartTime + "시";
            finalEndTime = returnEndTime + "시";
        }
        $("#startDt").kendoDatePicker({
            depth: "",
            start: "",
            culture: "ko-KR",
            format: "yyyy-MM-dd",
            value: finalStartDt
        });
        $("#endDt").kendoDatePicker({
            depth: "",
            start: "",
            culture: "ko-KR",
            format: "yyyy-MM-dd",
            value: finalEndDt
        });
        $("#startTime").kendoTimePicker({
            culture : "ko-KR",
            format: "HH시",
            interval : 60,
            value: finalStartTime
        });
        $("#endTime").kendoTimePicker({
            culture : "ko-KR",
            format: "HH시",
            interval : 60,
            value: finalEndTime
        });
        $("#btnSave").on("click", function (e) {
            e.preventDefault();
            fn_save();
        });
        $("#btnList").on("click", function (e) {
            e.preventDefault();
            fn_list();
        });
        if (returnUseAt != "") {
            $("#chkUseAt" + returnUseAt).prop("checked", true);
        }
        if (returnGubun != "") {
            $("#chkGubun" + returnGubun).prop("checked", true);
        }
        if (returnTarget != "") {
            $("#bannerPopupTarget").val(returnTarget);
        }

        $("[data-toggle='tooltip']").tooltip();

        if(retrunFilePath != "" && retrunFileMask != "") {
            setImage();
        }
    });

    //첨부파일 이미지 미리보기 팝업
    function previewPopup(){
        var reader = new FileReader();

        if(state == "new") {
            if ($("#files").val() != "") {
                reader.readAsDataURL(previewInput.files[0]);
                reader.onload = function (e) {
                    var base64URL = e.target.result;
                    var img = new Image();

                    //base64 URL을 직접 열기 위한 우회
                    img.src = base64URL;
                    img.onload = function () {
                        var imgWidth = img.width;
                        var imgHeight = img.height;
                        var win = window.open('', '미리보기', 'width=' + imgWidth + ', height=' + imgHeight + ', location=no, scrollbars=no');
                        var html = '';

                        html += '<title>';
                        html += '이미지 미리보기';
                        html += '</title>';
                        html += '<div style="overflow-x: hidden;">';
                        html += '<img src="' + base64URL + '" style="border:0;" allowfullscreen />';
                        html += '</div>';

                        win.document.write(html);
                    };
                };
            } else {
                alert("이미지가 없습니다.");
            }
        }else{
            var img = document.getElementById("preview");
            var src = $("#preview").attr("src");
            var host = $(location).attr("host");

            var url = "http://" + host + src;

            //base64 URL을 직접 열기 위한 우회
            var imgWidth = img.naturalWidth; // 이미지의 너비
            var imgHeight = img.naturalHeight; // 이미지의 높이
            var win = window.open('', '미리보기', 'width=' + imgWidth + ', height=' + imgHeight + ', location=no, scrollbars=no');
            var html = '';

            html += '<title>';
            html += '이미지 미리보기';
            html += '</title>';
            html += '<div style="overflow-x: hidden;">';
            html += '<img src="' + url + '" style="border:0;" allowfullscreen />';
            html += '</div>';

            win.document.write(html);
        }
    }

    function setImage(){
        var img = document.getElementById("preview");
        var imgWidth = img.naturalWidth / 3; // 이미지의 너비
        var imgHeight = img.naturalHeight / 3; // 이미지의 높이

        // 이미지의 width 및 height 속성을 변경
        $("#previewDiv").css("width", imgWidth);
        $("#previewDiv").css("height", imgHeight);
    }

    //첨부파일 이미지 미리보기
    function readURL(input) {
        state = 'new';

        $("#tempView").hide();
        previewInput = input;
        $("#inputFile").val($("#files")[0].files[0].name);

        var ext = $('#files').val().split('.').pop().toLowerCase();

        if ($.inArray(ext, ['jpg', 'png']) == -1) {
            alert("jpg/png 확장자만 업로드 가능합니다.");
            $("#inputFile").val("");
            $("#files").val("");
            $("#preview").removeAttr('src');
            return false;
        }

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                /*document.getElementById('preview').src = e.target.result;*/

                var originalImage = new Image();
                originalImage.src = e.target.result;
                originalImage.onload = function() {
                    // 이미지 크기를 1/3으로 조절
                    var canvas = document.createElement('canvas');
                    var context = canvas.getContext('2d');
                    canvas.width = originalImage.naturalWidth / 3;
                    canvas.height = originalImage.naturalHeight / 3;
                    context.drawImage(originalImage, 0, 0, canvas.width, canvas.height);

                    // 조절된 이미지를 미리보기에 출력 (png 또는 jpg로 출력)
                    if (ext === 'jpg') {
                        document.getElementById('preview').src = canvas.toDataURL('image/jpeg');
                    } else if (ext === 'png') {
                        document.getElementById('preview').src = canvas.toDataURL('image/png');
                    }

                    $("#previewDiv").css("width", canvas.width);
                    $("#previewDiv").css("height", canvas.height);
                }
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
        popupFile = input.files[0];
    }

    // 목록으로 이동
    function fn_list() {
        location.href = "/mngr/bannerpopup/popupList.do";
    }

    // 저장
    function fn_save() {

        var startDate = $("#startDt").val();
        var startTime = $("#startTime").data("kendoTimePicker").value().getHours();

        if(startTime < 10){
           startTime = "0" + startTime;
        }
        var endDate = $("#endDt").val();
        var endTime = $("#endTime").data("kendoTimePicker").value().getHours();

        if(endTime < 10){
            endTime = "0" + endTime;
        }

        // date와 time을 DATETIME(6) 형식으로 조합
        var startDateTime = startDate + " " + startTime + ":00.000000";
        var endDateTime = endDate + " " + endTime + ":00.000000";

        var useAt = $("input[name='chkUseAt']:checked").val();

        //출력형식 구분
        var cGubun = $("input[name='chkGubun']:checked").val();
        var bannerPopupGubun;
        if (cGubun != null && cGubun != undefined) {
            bannerPopupGubun = Number(cGubun);
        }

        if (!$("#bannerPopupWidth").val()) {
            $("#bannerPopupWidth").val(500);
        }
        if (!$("#bannerPopupHeight").val()) {
            $("#bannerPopupHeight").val(500);
        }
        if (!$("#bannerPopupTop").val()) {
            $("#bannerPopupTop").val(0);
        }
        if (!$("#bannerPopupLeft").val()) {
            $("#bannerPopupLeft").val(0);
        }
        if (!$("#bannerPopupTitle").val()) {
            alert('제목을 입력해주십시오.');
            $("#bannerPopupTitle").focus();
            return false;
        }
        if(mode == 'write'){
            if (!popupFile) {
                alert('파일 첨부는 필수입니다.');
                return false;
            }
        }

        if (startDate || endDate ) {
            startDate = startDate.replace(/(-)/g, '');
            endDate = endDate.replace(/(-)/g, '');

            if(!startDate){
                alert("시작시간을 입력해주세요.");
                return false;
            }
            if(!endDate){
                alert("종료시간을 입력해주세요.");
                return false;
            }
            if (endDate < startDate && endDate) {
                alert("종료일이 잘못 입력되었습니다.");
                $("#endDt").val('');
                $("#endDt").focus();
                return false;
            }
        }

        //배너 팝업 구분
        var cGroup = '${gubun}';
        var bannerPopupGroup = 0;
        if (cGroup == 'popup') {
            bannerPopupGroup = 1;
        }

        var formData = new FormData();

        if (gubun == 'popup') {
            formData.append("bannerPopupGroup", bannerPopupGroup);
            formData.append("bannerPopupGubun", bannerPopupGubun);
            formData.append("bannerPopupWidth", $("#bannerPopupWidth").val());
            formData.append("bannerPopupHeight", $("#bannerPopupHeight").val());
            formData.append("bannerPopupTop", $("#bannerPopupTop").val());
            formData.append("bannerPopupLeft", $("#bannerPopupLeft").val());
            formData.append("bannerPopupLink", $("#bannerPopupLink").val());
            formData.append("bannerPopupTarget", $("#bannerPopupTarget").val());
            formData.append("bannerPopupStartDt", startDateTime);
            formData.append("bannerPopupEndDt", endDateTime);
            formData.append("bannerPopupTitle", $("#bannerPopupTitle").val());
            formData.append("id", "admin");
            formData.append("useAt", useAt);
            formData.append("popupFile", popupFile);
            formData.append("gubun", mode);
            formData.append("menuCd", "popup");

            if (uuid == "") {
            } else {
                formData.append("uuid", uuid);
            }
        }

        if (mode == 'write') {
            $.ajax({
                url: "/mngr/bannerpopup/save",
                type: 'POST',
                data: formData,
                dataType: "json",
                contentType: false,
                processData: false,
                enctype: 'multipart/form-data',
                async: false,
                success(result) {
                    alert("저장 완료");
                    location.href = url;
                }
            });
        } else {
            $.ajax({
                url: "/mngr/bannerpopup/save",
                type: 'POST',
                data: formData,
                dataType: "json",
                contentType: false,
                processData: false,
                enctype: 'multipart/form-data',
                async: false,
                success(result) {
                    alert("수정 완료");
                    location.href = url;
                }
            });
        }
    }

    function fileDown(filePath, fileName) {
        kendo.saveAs({
            dataURI: "/common/fileDownload.do?filePath=" + filePath + "&fileName=" + encodeURIComponent(fileName),
        });
    }

</script>
</body>
</html>