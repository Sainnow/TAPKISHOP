<#macro template user>
    <!doctype html>
    <html xmlns:th="http://www.thymeleaf.org"></html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
        <link rel="stylesheet" href="/static/css/avatarmenu.css">
        <link rel="stylesheet" href="/static/css/style.css">
        <title>TEAGIShop</title>
    </head>
    <body>
    <nav class="navbar navbar-light  bg-info ">
        <div class="container-fluid" >
            <a href="/" style="text-decoration: none;display: flex;position: relative;left: 10%;">
                <span class="navbar-brand text-white mb-0 h1">TEAGIShop</span>
            </a>

            <#if user.email??>
                <div class="dropdown text-end "  style="    display: flex;position: relative;left: 40%;">
                    <a href="/profile">
                        <img src="/static/images/avatar.png" alt="mdo"
                             width="32" height="32" class="rounded-circle">
                    </a>
                </div>
                <div style="   display: flex;position: relative;right: 28%;">
                    <a href="/about" style="text-decoration: none;color:white;display: inline;margin-top: 2px">
                        <span style="margin-left: 20px" >Контакты</span>
                    </a>
                    <a href="/basket" style="text-decoration: none;color:white;display: inline">
                        <span style="margin-left: 40px" >Корзина</span>
                        <img src="/static/images/basket.png" alt="mdo"
                             width="32" height="32" class="rounded-circle">
                    </a>
        </div>
            <#else>
                <a href="/about" style="text-decoration: none;color:white;display: inline;margin-left: 22%">
                    <span style="margin-left: 205px" >Контакты</span>
                </a>
                <button style="margin-right: 10%" class="btn btn-light my-2 my-sm-0" type="button"
                        onclick="window.location.href = '/login'">
                    Войти
                </button>
            </#if>
        </div>
    </nav>
    <div class="container mt-4">
        <#nested/>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>