var govMngDcs = {
    global : {
        boardList   : "",
        params      : "",
        queryParams : "",
        categoryKey : "",
    },

    fnDefaultScript : function (queryParams) {
        $("#categoryUl li").removeClass("active");
        $("#categoryUl li." + queryParams.categoryKey).addClass("active");

        if($("#categoryUl li.active").length == 0){
            $("#categoryUl li.mng_noamal").addClass("active");
        }

        govMngDcs.global.categoryKey = queryParams.categoryKey;
        if (govMngDcs.global.categoryKey == "mngdcs") {
            govMngDcs.global.categoryKey = "mng_noamal";
        }

        queryParams.searchCategory = govMngDcs.global.categoryKey

        $("#drop_box_txt").text("경영공시");
        $("#titleName").text("경영공시");

        govMngDcs.load(queryParams)
    },

    load : function (queryParams) {
        var ajaxOpt = {
            url       : "/government/getGovernmentList.do?" + new URLSearchParams(queryParams).toString(),
            async     : false,
            data      : {},
            successFn : function (data) {
                govMngDcs.global.boardList = data.rs;
                govMngDcs.global.params    = data.params;

                const pagination = govMngDcs.global.boardList.pagination;
                const params= govMngDcs.global.params;

                govMngDcs.drawTable(data.rs.list, pagination);

                govMngDcs.drawPage(pagination, params);
            },
            failFn    : function (request, status, error) {
                alert("오류가 발생하였습니다. 관리자에게 문의하세요.\n errorCode :" + request.responseText + "\n");
            }
        };
        acUtil.ajax.call(ajaxOpt);
    },

    drawTable : function (data, pagination) {
        $("#tableBody").html('');

        let html = "";

        data.forEach((item, index) => {

            html += "<tr>";
            html += '<td>' + (pagination.totalRecordCount - index) + '</td>';
            html += '<td class="subject" style="text-align: left;"><a href="#" onclick="govMngDcs.fn_detailBoard(' + item.board_ARTICLE_ID + ')">' + item.board_ARTICLE_TITLE + '</a></td>';
            html += '<td>' + item.reg_EMP_NAME + '</td>';
            html += '<td>' + item.write_DATE + '</td>';

            if (item.file_YN != 'N') {
                html += '<td><a class="icon-upload"></a></td>';
            } else {
                html += '<td></td>';
            }

            html += '<td>' + item.board_ARTICLE_VIEW_COUNT + '</td>';
            html += "</tr>";
        });

        $("#tableBody").append(html);
    },


    drawPage : function (pagination, params) {
        if (!pagination || !params) {
            document.querySelector('.paging-box').innerHTML = '';
            $("#thisPage").text(0);
            $("#lastPage").text(0);
            $("#totalCnt").text(0);
            // throw new Error('Missing required parameters...');
            return;
        }

        $("#totalCnt").text(pagination.totalRecordCount);
        $("#thisPage").text(params.page);
        $("#lastPage").text(pagination.totalPageCount);

        let html = '';
        html += "<ul>";
        html += '<li class="paging-btn first"><a href="javascript:void(0);" onclick="govMngDcs.movePage(' + 1 + ')" >첫 페이지</a></li>';
        html += '<li class="paging-btn prev"><a href="javascript:void(0);" onclick="govMngDcs.movePage(' + (params.page - 1) + ')" >이전</a></li>';

        for (let i = pagination.startPage; i <= pagination.endPage; i++) {
            html += (i !== params.page)
                ? '<li><a href="javascript:void(0);" class="num" onclick="govMngDcs.movePage(' + i + ');">' + i + '</a><li>'
                : '<li class="active"><a>' + i + '</a></li>'
        }

        html += '<li class="paging-btn next"><a href="javascript:void(0);" onclick="govMngDcs.movePage(' + (params.page + 1) + ');" >다음</a></li>';
        html += '<li class="paging-btn last"><a href="javascript:void(0);" onclick="govMngDcs.movePage(' + pagination.totalPageCount + ');" >마지막 페이지</a></li>';
        html += "</ul>"

        $(".paging-box").html(html);
    },

    movePage : function (page) {
        const queryParams = {
            page       : (page) ? page : 1,
            recordSize : 10,
            pageSize   : 10,
            categoryId : govMngDcs.global.categoryKey,
            searchCategory : govMngDcs.global.categoryKey,
        }

        govMngDcs.load(new URLSearchParams(queryParams).toString());
    },

    fn_searchInput : function () {
        const queryParams = {
            page           : 1,
            recordSize     : 10,
            pageSize       : 10,
            searchCategory : govMngDcs.global.categoryKey,
            searchInput    : $("#inputText").val()
        }

        govMngDcs.load(queryParams);
    },

    fn_goList : function (key) {
        const queryParams = {
            page           : 1,
            recordSize     : 10,
            pageSize       : 10,
            searchCategory : $(key).attr("listId"),
            searchInput    : $("#inputText").val()
        }

        govMngDcs.global.categoryKey = $(key).attr("listId")
        govMngDcs.load(queryParams);

    },

    fn_writeBoard : function(){
        location.href = '/government/write.do?category=' + govMngDcs.global.categoryKey;
    },

    fn_detailBoard(key){
        location.href="/government/view.do?boardArticleId=" + key + "&category=" + govMngDcs.global.categoryKey;
    }

}