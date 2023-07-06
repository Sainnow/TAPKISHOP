<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Корзина</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <#assign num = 0>
        <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-4 g-4">
            <#list basket as basket>
                <#if user.id == basket.user.id>
                    <#if basket.status == 1>
                        <div class="col"  >
                            <div class="card " id="cardproduct" style="width: 17rem">
                                <div class="card-body " >
                                    <form action="/basket/delete/${basket.id}" method="post" >
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger ">
                                            Удалить из корзины
                                        </button>
                                    </form>
                                    <img class="card-img-bottom" src=
                                    "/images/${basket.product.previewImageId}"
                                         alt="Card image" style="width: 100%;">
                                    <h4 class="card-title">${basket.product.title}  | ${basket.size} размер</h4>
                                    <h4 class="card-text">Цена: ${basket.product.price} BYN</h4>
                                </div>
                            </div>
                        </div>


                        <#assign num=num+basket.product.price>

                    </#if>

                </#if>
            </#list>

        </div>
        <br>
        <h4 style="text-align: center;display: none" id="noorder">Корзина пуста</h4>
        <div style="display:none" id="order">
            <h1 style="text-align: center">Оформление заказа</h1>
            <hr>
            <form action="/order" method="get" enctype="multipart/form-data">
                <h4 class="card-title"  type="text" name="producrtprice" id="productprice" value="${num}">Сумма заказа: ${num} BYN</h4>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <br>

                <button type="submit" style="width: 50%" class="btn btn-info">Оформить заказ</button>
            </form>
            <br>
        </div>
    </div>
    <script src="/static/jQuery/jquery-3.6.4.js"></script>
    <script src="/static/js/order.js"></script>
</@t.template>