﻿//Load Data in Table when documents is ready  

function getbyID(OrderID) {
    //$('#CreateDate').css('border-color', 'lightgrey');
    //$('#ShipName').css('border-color', 'lightgrey');
    //$('#ShipMobile').css('border-color', 'lightgrey');
    //$('#ShipAddress').css('border-color', 'lightgrey');
    //$('#ShipEmail').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
    //$('#UserID').css('border-color', 'lightgrey');
    //$('#TongTien').css('border-color', 'lightgrey');
    $.ajax({
        url: "/Order/GetbyID/" + OrderID,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#OrderID').val(result.OrderID);
            //$('#CreateDate').val(result.CreateDate);
            //$('#ShipName').val(result.ShipName);
            //$('#ShipMobile').val(result.ShipMobile);
            //$('#ShipAddress').val(result.ShipAddress);
            //$('#ShipEmail').val(result.ShipEmail);
            $('#Status').val(result.Status);
            //$('#UserID').val(result.UserID);
            //$('#TongTien').val(result.TongTien);
           
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//function for updating sanployee's record  
function Update(ID) {
   // //var res = validate();
   // //if (res == false) {
   // //    return false;
   // //}
   //// var e = document.getElementById("Status");
   // var strUser = e.options[e.selectedIndex].value;
   // var orderObj = {
   //     OrderID: $('#OrderID').val(),
   //     //CreateDate: $('#CreateDate').val(),
   //     //ShipName: $('#ShipName').val(),
   //     //ShipMobile: $('#ShipMobile').val(),
   //     //ShipAddress: $('#ShipAddress').val(),
   //     //ShipEmail: $('#ShipEmail').val(),
   //     Status: strUser,
   //     //UserID: $('#UserID').val(),
   //     //TongTien: $('#TongTien').val()
   // };
   // $.ajax({
   //     url: "/Order/Update",
   //     type: "POST",
   //     contentType: "application/json;charset=utf-8",
   //     dataType: "json",
   //     success: function (result) {
   //         location.reload();
   //         //$('#myModal').modal('hide');
   //         $('#OrderID').val("");
   //         //$('#CreateDate').val("");
   //         //$('#ShipName').val("");
   //         //$('#ShipMobile').val("");
   //         //$('#ShipAddress').val("");
   //         //$('#ShipEmail').val("");
   //         $('#Status').val("");
   //         //$('#UserID').val("");
   //         //$('#TongTien').val("");
   //     },
   //     error: function (errormessage) {
   //         alert(errormessage.responseText);
   //         console.log(strUser);
   //     }
   // });
    var ans = confirm("Đơn hàng đã giao ?");
    if (ans) {
        $.ajax({
            url: "/Order/Update/" + ID,
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
function Delete(ID) {
    var ans = confirm("Bạn có muốn xóa không ?");
    if (ans) {
        $.ajax({
            url: "/Order/Delete/" + ID,
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
    $('#OrderID').val("");
    $('#CreateDate').val("");
    $('#ShipName').val("");
    $('#ShipMobile').val("");
    $('#ShipAddress').val("");
    $('#ShipEmail').val("");
    $('#Status').val("");
    $('#UserID').val("");
    $('#TongTien').val("");
    
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#CreateDate').css('border-color', 'lightgrey');
    $('#ShipName').css('border-color', 'lightgrey');
    $('#ShipMobile').css('border-color', 'lightgrey');
    $('#ShipAddress').css('border-color', 'lightgrey');
    $('#ShipEmail').css('border-color', 'lightgrey');
    $('#Status').css('border-color', 'lightgrey');
    $('#UserID').css('border-color', 'lightgrey');
    $('#TongTien').css('border-color', 'lightgrey');
    
}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    if ($('#CreateDate').val == null) {
        $('#CreateDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#CreateDate').css('border-color', 'lightgrey');
    }
    if ($('#ShipName').val().trim() == "") {
        $('#ShipName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ShipName').css('border-color', 'lightgrey');
    }
    if ($('#ShipMobile').val().trim() == "") {
        $('#ShipMobile').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ShipMobile').css('border-color', 'lightgrey');
    }
    if ($('#ShipAddress').val().trim() == "") {
        $('#ShipAddress').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ShipAddress').css('border-color', 'lightgrey');
    }
    if ($('#ShipEmail').val().trim() == "") {
        $('#ShipEmail').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ShipEmail').css('border-color', 'lightgrey');
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