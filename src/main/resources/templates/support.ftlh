<#import "blocks/template.ftlh" as t>
<@t.template user >
<table class="table table-hover table-outline-dark">
    <tr class="text-info">
        <th scope="col">Номер запроса</th>
        <th scope="col">Имя </th>
        <th scope="col">Телефон</th>
        <th scope="col">Номер заказа</th>
        <th scope="col">Статус запроса</th>
    </tr>
    <#list support as support>
        <tr class="text-info">
            <#if support.active>
            <th>${support.id}</th>
            <th>${support.name}</th>
            <th>${support.phone}</th>
            <th>${support.code}</th>
            <th>
                <form  action="/support/${support.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input class=" btn  text-info  btn-outline-light" type="submit" value="Закрыть запрос">
                </form>
            </th>
            </#if>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
</@t.template>