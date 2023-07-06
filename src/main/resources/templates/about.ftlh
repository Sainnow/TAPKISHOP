<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div>
    <br>
    <h1 style="text-align: center">Контактные данные</h1>
    <hr>
    <a class="btn btn-info mt-3 mb-3" style=" width: 50%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Обратная связь
    </a>
    <div class="collapse mb-3" id="collapseExample" style="width: 50%">
    <div class="modal-body">
        <form action="/help" method="post" >
            <div class="form-group">
                <label for="name">Имя</label>
                <input type="text" required class="form-control"
                       id="name" name="name">
            </div>
            <br>
            <div class="form-group">
                <label for="phone">Номер телефона</label>
                <input type="text" required class="form-control"
                       id="phone" name="phone">
            </div>
            <br>
            <div class="form-group">
                <label for="code">Код заказа</label>
                <input type="text"  class="form-control"
                       id="code" name="code">
            </div>
            <br>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="width: 100%" class="btn btn-info">Заказать обратную связь</button>
        </form>
        <p style="padding: 15px;margin: 0">Cлужба поддержки свяжется с вами в ближайшее время.</p>
    </div>
    </div>
    <h4>МТС:      +375 29 5998403</h4>
    <h4>Viber:    +375 29 5998403</h4>
    <h4>Telegram: @TEAGIShop</h4>
    <h4>Почта: admin@TEAGIShop.by</h4>
    <br>
    <h1 style="text-align: center">Магазина</h1>
    <hr>
    <h4>Адрес: г.Гродно</h4>
    <h4>График работы: с 10:00 до 22:00 (пн - вс)</h4>
    <br>


</@t.template>