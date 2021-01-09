(function () {


    //code dealing with product index page loadMore ajaxCall and smooth scroll down
    $(function () {

        var loadCount = 1;
        var loading = $("#loading");
        $("#loadMore").on("click", function (e) {

            e.preventDefault();

            $(document).on({

                ajaxStart: function () {
                    loading.show();
                },
                ajaxStop: function () {
                    loading.hide();
                }
            });

            var url = "/Search/LoadMoreProduct/";
            var term = $('#txtSearch').val();
            $.ajax({
                url: url,
                data: { term,size: loadCount * 4 },
                cache: false,
                type: "POST",
                success: function (data) {

                    if (data.length !== 0) {
                        $(data.ModelString).insertBefore("#loadMore").hide().fadeIn(2000);
                    }

                    var ajaxModelCount = data.ModelCount - (loadCount * 4);
                    if (ajaxModelCount <= 0) {
                        $("#loadMore").hide().fadeOut(2000);
                    }

                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                    alert("message : \n" + "An error occurred, for more info check the js console" + "\n status : \n" + status + " \n error : \n" + error);
                }
            });

            loadCount = loadCount + 1;

        });

    });


})();