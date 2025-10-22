var search = {
    global : {

    },

    fnDefaultScript : function(){
        $(".tab_content").hide();
        $("#ctab1").show();

        $(".tabs li").click(function () {
            $(".tabs li").removeClass("active");
            $(this).addClass("active");
            $(".tab_content").hide()
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn()
        });

        $("#fileMore").on('click',function(){
            $(".file_accordion").slideToggle(200);
            $('#fileMore').toggleClass("open");
        });
    },

    detailSearch : function(e){
        var formId = $(e).parent().find("input[name='board_kor']").val()
        var form = $("#" + formId );
        form.submit();
    },

    moveToBoardView : function(url, id, category){
        location.href= url + "?boardArticleId=" + id + "&category=" + category;
    }
}