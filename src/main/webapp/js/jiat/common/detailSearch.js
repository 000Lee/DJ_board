var detailSearch = {
    global : {
        searchAjaxData : "",
        createHtmlStr : "",
        nowPage : "",
        boardList : "",
        params : "",
        searchParams : "",
        searchCategory : "",
    },

    fnDefaultScript : function(params, articlePage){
        detailSearch.global.nowPage = articlePage.page;
        detailSearch.global.searchCategory = articlePage.searchCategory;
        detailSearch.global.searchParams = params;
        detailSearch.load(new URLSearchParams(articlePage).toString(), params);
    },

    load(data, params) {
        detailSearch.global.searchAjaxData = params
        delete detailSearch.global.searchAjaxData.searchCategory;
        delete detailSearch.global.searchAjaxData.inSearchContent;


        var result = fn_customAjax("/integrated/detailSearchList.do?" + data, detailSearch.global.searchAjaxData);
        if(result.flag){
            detailSearch.drawTable(result);

            detailSearch.global.boardList = result.data.list;
            detailSearch.global.params = result.articlePage;

            const pagination = detailSearch.global.boardList.pagination;
            const params = detailSearch.global.params;
            detailSearch.drawPage(pagination, params);
        }
    },

    drawTable : function(rs){
        $("#searchText").text(rs.params.inSearchContent);
        $("#board_name").text(rs.params.board_name);
        $("#totalCount").text(rs.data.totalCount - 1);

        var boardList = rs.data.boardDetail;
        $("#listUl li").remove();

        detailSearch.global.createHtmlStr = "";
        for(var i = 0; i < boardList.length; i++){
            if(boardList[i].category == ""){
                detailSearch.global.createHtmlStr += "" +
                    "<li style='position:relative;'>" +
                        '<a href="#" onclick="detailSearch.moveToBoardView(this, \'' + boardList[i].URL + '\',\'' + boardList[i].BOARD_ARTICLE_ID + '\',\'' + boardList[i].BOARD_CATEGORY_ID + '\')">' +
                        "<div style='position:absolute; width:100%;'>" +
                            "<div class='txt'>" +
                                "<p class='listit'>" +
                                    "<em>" + boardList[i].BOARD_NAME + "</em>" + boardList[i].TITLE +
                                "</p>" +
                                "<p class='liststit' style=\"overflow: hidden; text-overflow: ellipsis; max-width:1280px; max-height:27;  white-space: nowrap;\">" + boardList[i].FIX_CONTENT + "</p>" +
                                "<p class='listday'>" + boardList[i].REG_DATE + "</p>" +
                            "</div>" +
                        "</div>" +
                        "</a>" +
                    "</li>";
            }
        }

        $("#listUl").append(detailSearch.global.createHtmlStr);
    },

    drawPage : function(pagination, params){
        if ( !pagination || !params ) {
            document.querySelector('#pagingUl').innerHTML = '';
            throw new Error('Missing required parameters...');
        }

        let html = '';
        html += '<li class="paging-btn first"><a href="javascript:void(0);" onclick="detailSearch.movePage('+ 1 +')" >첫 페이지</a></li>';
        html += '<li class="paging-btn prev"><a href="javascript:void(0);" onclick="detailSearch.movePage('+ (params.page - 1) +')" >이전</a></li>';
        for (let i = pagination.startPage; i <= pagination.endPage; i++) {
            html += (i !== params.page)
                ? '<li><a href="javascript:void(0);" class="num" onclick="detailSearch.movePage(' + i + ');">'+ i +'</a><li>'
                : '<li class="active"><a>' + i + '</a></li>'
        }
        html += '<li class="paging-btn next"><a href="javascript:void(0);" onclick="detailSearch.movePage('+ (params.page + 1) +');" >다음</a></li>';
        html += '<li class="paging-btn last"><a href="javascript:void(0);" onclick="detailSearch.movePage('+ pagination.totalPageCount +');" >마지막 페이지</a></li>';
        $("#pagingUl").html(html);
    },

    movePage : function (page){
        detailSearch.global.nowPage = page;
        const queryParams = {
            page: (page) ? page : 1,
            recordSize : 10,
            pageSize: 10,
            inSearchContent : $("#inSearchContent").val(),
            searchCategory : detailSearch.global.searchCategory
        }

        detailSearch.load(new URLSearchParams(queryParams).toString(), detailSearch.global.searchParams);
    },

    moveToBoardView : function(e, url, id, category){
        if(category == 'em'){
            location.href= url + "?emBoardId=" + id + "&searchFlag=true";
        }else{
            location.href= url + "?boardArticleId=" + id + "&category=" + category;
        }
    }
}

function fn_customAjax(url, data){
    var result;

    $.ajax({
        url : url,
        data : data,
        type : "post",
        dataType : "json",
        async : false,
        success : function(rs) {
            result = rs;
            result.flag = true;
        },
        error :function (e) {
            result.flag = false;
            console.log('error : ', e);
        }
    });

    return result;
}