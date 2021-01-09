(function () {
    //code dealing with product index page loadMore ajaxCall and smooth scroll down
    $(function () {
        var url = "/Category/LoadMoreProduct/";
        var url1 = window.location.href;
        console.log(url1);
        var array = url1.split('/');
        var id = array[array.length - 1];
        id = parseInt(id);
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

            
            $.ajax({
                url: url,
                data: { id,size: loadCount * 4},
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
        $('#selectSort').change(function () {
            $(document).on({

                ajaxStart: function () {
                    loading.show();
                },
                ajaxStop: function () {
                    loading.hide();
                }
            });
            var sort = $("#selectSort").val();
            $.ajax({
                url: "/Category/SortProduct/",
                data: { id,sort },
                cache: false,
                type: "POST",
                success: function (data) {
                    //hiển thị sản phẩm đã sắp xêp
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