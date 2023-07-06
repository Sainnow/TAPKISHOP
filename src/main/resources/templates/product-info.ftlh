<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container">
    <div class="row">
        <div class="col-10">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <#list images as image>
                <li data-target="#myCarousel" data-slide-to="0" class=""></li>
            </#list>
        </ol>
        <div class="carousel-inner" >
            <#list images as image>
                <div class="carousel-item <#if image.previewImage>active</#if>" style="height: 635px;width: 100%">
                    <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                         role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title></title>
                        <rect width="100%" height="100%" fill="#fff"></rect>
                        <text x="50%" y="50%" fill="#17a2b8" dy=".3em"></text>
                    </svg>

                    <div class="container">
                        <div class="carousel-caption" style="height: 600px;width: 80%;left: 90px">
                            <a href="/images/${image.id}">
                                <img class="product" style="height: 100%;width: 100%" src="/images/${image.id}">
                            </a>
                        </div>
                    </div>
                </div>
            </#list>

        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev" style="width: 50px">
            <span class="carousel-control-prev-icon " aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next" style="width: 50px">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
        </div>
        <div class="col form-check" style="padding: 0">
            <#if user.email??>
            <br>
            <h3 style="text-align: center">Добавить в корзину</h3>
                <p style="text-align: center;font-weight: bolder">Размеры в наличии:</p>
        <#list value as value>
            <form  action="/product/basket/${product.id}" method="post"  style="float:left;margin-top: 10px;display: inline-block">
                <#if value.value=="0">

                <#else>
                    <div class="form-group" style="display:none;">
                        <label for="size"></label>
                        <input type="text" required class="form-control"
                               id="size" name="size" value="${value.size.title}">
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit"  class="btn btn-outline-info btn-light btn-lg">
                        ${value.size.title}
                    </button>
                </#if>

            </form>
        </#list>
            <#if product.number == 0>
                <p style="font-size: 1.2em;margin-left:5px;margin-bottom: 5px;font-weight: bolder">Нет в наличии  </p>

            </#if>
            <#else>
                <h4 style="text-align: center">Для совершения покупки требуется авторизация</h4>
                <button style="margin-left: 30%" class="btn btn-info " type="button"
                        onclick="window.location.href = '/login'">
                    Войти
                </button>
            </#if>
        </div>
    </div>
    </div >
    <hr>

    <p><h2 style="text-align: center">${product.title} | Цена товара: ${product.price} BYN</h2>
    <div style="margin-left:0">
    <p style="text-align: left;font-size: 1.2em;margin-left:10px;margin-bottom: 5px;font-weight: bolder"> Вид обуви: ${product.classname.name}</p>
    <p style="text-align: left;font-size: 1.2em;margin-left:10px;margin-bottom: 5px;font-weight: bolder"> Информация о товаре</p>
    <p style="text-align: left;font-size: 1.2em;margin-left:10px;margin-bottom: 5px;font-weight: bolder">Материал верха:  ${product.uppermaterial}</p>
    <p style="text-align: left;font-size: 1.2em;margin-left:10px;margin-bottom: 5px;font-weight: bolder">Материал подкладки: ${product.liningmaterial}</p>
    <p style="text-align: left;font-size: 1.2em;margin-left:10px;margin-bottom: 5px;font-weight: bolder">Материал подошвы : ${product.solematerial}</p>
    <p style="text-align: left;font-size: 1.2em;margin-left:10px;margin-bottom: 5px;font-weight: bolder">Каблук: ${product.heel}</p>
    <p style="font-size: 1.2em;text-align: center"> ${product.description}</p>
    <p style="text-align: center">Номер телефона продавца: <b>${authorProduct.phoneNumber}</b></p>
    </div>
    <hr>

</@t.template>