function deleteProductEntry(products) {
    console.log("deleting product...")
    var $products = $(products)
    $products.parent().remove()
    var idProduct = $products.data('pk')
    console.log(idProduct)
    /*$.ajax({
        url: 'Product/product_delete' + idProduct,
        method: 'DELETE',
        beforeSend: function (xhr) {
            xhr.sendRequestHeader('X-CSRFToken', csrf_token)
        }
    })*/
}
