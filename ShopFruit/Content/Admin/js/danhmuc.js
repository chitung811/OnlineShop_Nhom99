
//Add Data Function   
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var status = 1;
    var dmObj = {
        DanhMucID: $('#SanPhamID').val(),
        TenDanhMuc: $('#TenDanhMuc').val(),
        MetaKeyword: $('#MetaKeyword').val(),
        Status: status
    };
    $.ajax({
        url: "/DanhMuc/Add",
        data: JSON.stringify(dmObj),
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
function getbyID(DanhMucID) {
    $('#TenDanhMuc').css('border-color', 'lightgrey');
    $('#MetaKeyword').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
    $.ajax({
        url: "/DanhMuc/getbyID/" + DanhMucID,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#DanhMucID').val(result.DanhMucID);   
            $('#TenDanhMuc').val(result.TenDanhMuc);
            $('#MetaKeyword').val(result.MetaKeyword);        
            $('#Status').val(result.Status);

            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            console.log(errormessage.responseText);
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
    var status = 1;
    var dmObj = {
        DanhMucID: $('#DanhMucID').val(),
        TenDanhMuc: $('#TenDanhMuc').val(),
        MetaKeyword: $('#MetaKeyword').val(),
        Status: status
    };
    $.ajax({
        url: "/DanhMuc/Update",
        data: JSON.stringify(dmObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            location.reload();
            $('#myModal').modal('hide');
            $('#DanhMucID').val("");
            $('#TenDanhMuc').val("");
            $('#MetaKeyword').val("");
            $('#Status').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function Delete(ID) {
    var ans = confirm("Bạn có muốn xóa không?");
    if (ans) {
        $.ajax({
            url: "/DanhMuc/Delete/" + ID,
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

//function for deleting sanployee's record  
//function Delele(ID) {
//    var ans = confirm("Bạn có muốn xóa không?");
//    if (ans) {
//        $.ajax({
//            url: "/DanhMuc/Delete/" + ID,
//            type: "POST",
//            contentType: "application/json;charset=UTF-8",
//            dataType: "json",
//            success: function (result) {
//                location.reload();
//            },
//            error: function (errormessage) {
//                alert(errormessage.responseText);
//            }
//        });
//    }
//}
//Function for clearing the textboxes  
function clearTextBox() {
    $('#DanhMucID').val("");
    $('#TenDanhMuc').val("");
    $('#MetaKeyword').val("");
    $('#Status').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#TenDanhMuc').css('border-color', 'lightgrey');
    $('#MetaKeyword').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    if ($('#TenDanhMuc').val().trim() == "") {
        $('#TenDanhMuc').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#TenDanhMuc').css('border-color', 'lightgrey');
    }
    if ($('#MetaKeyword').val().trim() == "") {
        $('#MetaKeyword').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#MetaKeyword').css('border-color', 'lightgrey');
    }
    return isValid;
}
