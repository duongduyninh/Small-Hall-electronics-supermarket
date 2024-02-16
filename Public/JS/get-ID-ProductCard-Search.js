function viewProductSearch(productCard) {
    var productId = productCard.getAttribute('id');
    var productDetailUrl = '/MVC_LuanVan/Product/ProductDetail/' + productId;
    window.location.href = productDetailUrl;
}