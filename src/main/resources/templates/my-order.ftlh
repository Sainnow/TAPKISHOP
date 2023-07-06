<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-4 g-4">
        <#list order as order>
            <div class="col" style="height: 500px">
                <a href="/my/order/${order.id}" class="product-link" style="text-decoration: none">
                    <div class="card text-white  bg-info my-4 product" >

                        <div class="card-body">
                            <h5 class="card-title">Код заказа: ${order.code}</h5>
                            <p class="card-text">${order.price} BYN</p>
                        </div>

                    </div>
                </a>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>