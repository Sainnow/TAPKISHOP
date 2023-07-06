<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
            <img src="/static/images/avatar.png"
                 style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Имя: <b>${user.name}</b>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br>
        Почта: <b>${user.email}</b>
        <br>
        Статус: <b><#if user.active!=true>Заблокирован</#if><#if user.active==true>Активный</#if></b>
    </div>
    <br>
    <hr>

</@t.template>