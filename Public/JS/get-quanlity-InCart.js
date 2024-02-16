window.onload = function () {
    GetQuanlityInCart();
};

function GetQuanlityInCart() {

    $.ajax({
        type: "GET", 
        url: "/MVC_LUANVAN/home/GetQualityInCart", 
        data: { },
        success: function (response) {
           
                $("#cartQuantity").text(response);
        }
    });
    
}
