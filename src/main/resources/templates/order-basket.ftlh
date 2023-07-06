<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-4 g-4">
        <#list basket as basket>
            <div class="col" style="height: 500px">
                <a href="/product/${basket.product.id}" class="product-link" style="text-decoration: none">
                    <div class="card text-white  bg-info my-4 product" >

                        <div class="card-body">
                            <img class="card-img-bottom" src=
                            "/images/${basket.product.previewImageId}"
                                 alt="Card image" style="width: 100%;">
                            <h4 class="card-title">${basket.product.title}  | ${basket.size} размер</h4>
                            <h4 class="card-text">Цена: ${basket.product.price} BYN</h4>
                        </div>

                    </div>
                </a>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>