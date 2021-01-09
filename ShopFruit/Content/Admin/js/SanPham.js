//Load Data in Table when documents is ready  
//Add Data Function   
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var sanpObj = {
        SanPhamID: $('#SanPhamID').val(),
        Image: $('#Image').val(),
        TenSanPham: $('#TenSanPham').val(),
        DonGia: $('#DonGia').val(),
        PromotionPrice: $('#PromotionPrice').val(),
        TomTat: $('#TomTat').val(),
        Description: $('#Description').val(),
        MetaKeyword: $('#MetaKeyword').val(),
        Quantity: $('#Quantity').val(),
        DanhMucSanPhamID: $('#DanhMucSanPhamID').val(),
        Status: $('#Status').val()
    };
    $.ajax({
        url: "SanPham/Add",
        data: JSON.stringify(sanpObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            location.reload();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getbyID(SanPhamID) {
    $('#Image').css('border-color', 'lightgrey');
    $('#TenSanPham').css('border-color', 'lightgrey');
    $('#DonGia').css('border-color', 'lightgrey');
    $('#PromotionPrice').css('border-color', 'lightgrey');
    $('#TomTat').css('border-color', 'lightgrey');
    $('#Description').css('border-color', 'lightgrey');
    $('#MetaKeyword').css('border-color', 'lightgrey');
    $('#Quantity').css('border-color', 'lightgrey');
    $('#DanhMucSanPhamID').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
    $.ajax({
        url: "/SanPham/getbyID/" + SanPhamID,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#SanPhamID').val(result.SanPhamID);
            $('#Image').val(result.Image);
            $('#TenSanPham').val(result.TenSanPham);
            $('#DonGia').val(result.DonGia);
            $('#PromotionPrice').val(result.PromotionPrice);
            $('#TomTat').val(result.TomTat);
            $('#Description').val(result.Description);
            $('#MetaKeyword').val(result.MetaKeyword);
            $('#Quantity').val(result.Quantity);
            $('#DanhMucSanPhamID').val(result.DanhMucSanPhamID);
            $('#Status').val(result.Status);

            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//function for updating sanployee's record  
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var sanpObj = {
        SanPhamID: $('#SanPhamID').val(),
        Image: $('#Image').val(),
        TenSanPham: $('#TenSanPham').val(),
        DonGia: $('#DonGia').val(),
        PromotionPrice: $('#PromotionPrice').val(),
        TomTat: $('#TomTat').val(),
        Description: $('#Description').val(),
        MetaKeyword: $('#MetaKeyword').val(),
        Quantity: $('#Quantity').val(),
        DanhMucSanPhamID: $('#DanhMucSanPhamID').val(),
        Status: $('#Status').is(":checked") ? true : false
    };
    $.ajax({
        url: "/SanPham/Update",
        data: JSON.stringify(sanpObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            location.reload();
            $('#myModal').modal('hide');
            $('#SanPhamID').val("");
            $('#Image').val("");
            $('#TenSanPham').val("");
            $('#DonGia').val("");
            $('#PromotionPrice').val("");
            $('#TomTat').val("");
            $('#Description').val("");
            $('#MetaKeyword').val("");
            $('#Quantity').val("");
            $('#DanhMucSanPhamID').val("");
            $('#Status').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//function for deleting sanployee's record  
function Delete(ID) {
    var ans = confirm("Bạn có muốn xóa không ?");
    if (ans) {
        $.ajax({
            url: "/SanPham/Delete/" + ID,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                location.reload();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

//Function for clearing the textboxes  
function clearTextBox() {
    $('#SanPhamID').val("");
    $('#Image').val("");
    $('#TenSanPham').val("");
    $('#DonGia').val("");
    $('#PromotionPrice').val("");
    $('#TomTat').val("");
    $('#Description').val("");
    $('#MetaKeyword').val("");
    $('#Quantity').val("");
    $('#DanhMucSanPhamID').val("");
    $('#Status').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#Image').css('border-color', 'lightgrey');
    $('#TenSanPham').css('border-color', 'lightgrey');
    $('#DonGia').css('border-color', 'lightgrey');
    $('#PromotionPrice').css('border-color', 'lightgrey');
    $('#TomTat').css('border-color', 'lightgrey');
    $('#Description').css('border-color', 'lightgrey');
    $('#MetaKeyword').css('border-color', 'lightgrey');
    $('#Quantity').css('border-color', 'lightgrey');
    $('#DanhMucSanPhamID').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    if ($('#Image').val().trim() == "") {
        $('#Image').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Image').css('border-color', 'lightgrey');
    }
    if ($('#TenSanPham').val().trim() == "") {
        $('#TenSanPham').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#TenSanPham').css('border-color', 'lightgrey');
    }
    if ($('#DonGia').val().trim() == "") {
        $('#DonGia').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#DonGia').css('border-color', 'lightgrey');
    }
    if ($('#PromotionPrice').val().trim() == "") {
        $('#PromotionPrice').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#PromotionPrice').css('border-color', 'lightgrey');
    }
    if ($('#TomTat').val().trim() == "") {
        $('#TomTat').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#TomTat').css('border-color', 'lightgrey');
    }
    if ($('#Description').val().trim() == "") {
        $('#Description').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Description').css('border-color', 'lightgrey');
    }
    if ($('#MetaKeyword').val().trim() == "") {
        $('#MetaKeyword').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#MetaKeyword').css('border-color', 'lightgrey');
    }
    if ($('#Quantity').val().trim() == "") {
        $('#Quantity').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Quantity').css('border-color', 'lightgrey');
    }
    if ($('#DanhMucSanPhamID').val().trim() == "") {
        $('#DanhMucSanPhamID').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#DanhMucSanPhamID').css('border-color', 'lightgrey');
    }
    if ($('#Status').val().trim() == "") {
        $('#Status').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Status').css('border-color', 'lightgrey');
    }
    return isValid;
}