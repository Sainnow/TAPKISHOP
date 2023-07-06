<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div style="text-align: center">
        <#assign num = 0>
            <#list basket as basket>
                <#if user.id == basket.user.id>
                    <#if basket.status == 1>
                        <div class="col"  >
                            <div class="card " id="cardproduct" style="width: 19rem;display: none">
                            </div>
                        </div>


                        <#assign num=num+basket.product.price>

                    </#if>

                </#if>
            </#list>

        <br>
        <h4 style="text-align: center;display: none" id="noorder">Корзина пуста</h4>
        <div style="display:none" id="order">
            <h1 style="text-align: center">Оформление заказа</h1>
            <hr>
            <form  action="/order/add" method="post" enctype="multipart/form-data">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <div  class="form-group ">
                                 <label for="payment">Способ оплаты </label>
                                     <br>
                                         <select id="payment"  required name="payment" class="form-control"  >
                        <option value="">Способ оплаты не выбран</option>
                        <option value="Наличные">Наличные</option>
                        <option value="По карте">По карте</option>
                    </select>
                </div>
                <div  id="payments" name="По карте" style="display: none">
                    <div class="form-group">
                        <label for="card_number">Номер карты</label>
                        <input type="number" class="form-control"
                               id="card_number" name="card_number">
                    </div>
                    <div class="form-group">
                        <label for="cvc">CVC</label>
                        <input type="number"  class="form-control"
                               id="cvc" name="cvc">
                    </div>
                    <div class="form-group">
                        <label for="owner">Владелец карты</label>
                        <input type="text"  class="form-control"
                               id="owner" name="owner">
                    </div>
                </div>
                        </div>
                        <div class="col-sm">
                <div  class="form-group">
                    <label for="delivery">Способ доставки </label>
                    <br>
                    <select id="delivery"  required name="delivery" class="form-control"  >
                        <option value="">Способ доставки не выбран</option>
                        <option value="Самовывоз">Самовывоз</option>
                        <option value="Курьером">Курьером</option>
                    </select>
                </div>
                <div id="delivers" name="Курьером" style="display: none">
                    <div class="form-group">
                        <label for="area">Область</label>
                        <input type="text"  class="form-control"
                               id="area" name="area">
                    </div>
                    <div class="form-group">
                        <label for="city">Город</label>
                        <input type="text"  class="form-control"
                               id="city" name="city">
                    </div>
                    <div class="form-group">
                        <label for="address">Адрес</label>
                        <input type="text"  class="form-control"
                               id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label for="postal_code">Почтовый индекс</label>
                        <input type="number"  class="form-control"
                               id="postal_code" name="postal_code">
                    </div>
                </div>
                    </div>
                </div>
                </div>
                <br>
                <#list basket as basket>
                    <#if user.id == basket.user.id>
                        <#if basket.status == 1>
                            <div  style="display: none" >
                                <label for="basket"></label>
                                <input type="number" class="form-control" id="basket" name="basket" value="${basket.id}" >
                            </div>
                        </#if>
                    </#if>
                </#list>



                <h4 class="card-title"  type="text" id="productprice" value="${num}">Сумма заказа: ${num} BYN</h4>
                <h4 class="card-title" name="delivers" style="display: none">Сумма доставки: 20 BYN</h4>

                <h4 class="card-title" id="total" name="totalprice" >Итого: ${num} BYN</h4>

                <div style="display: none">
                    <label for="price">CVC</label>
                    <input type="number" class="form-control"
                           id="price" name="price" value="${num}">
                </div>

                <script src="/static/jQuery/jquery-3.6.4.js"></script>
                <script src="/static/js/payment.js"></script>
                <script src="/static/js/delivery.js"></script>
                <script src="/static/js/order.js"></script>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <br>

                <button type="submit" style="width: 50%" class="btn btn-info">Заказать</button>
            </form>
            <br>
        </div>
    </div>
</@t.template>