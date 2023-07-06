<#import "blocks/template.ftlh" as t>
<@t.template user>
    <a class="btn-lg  btn-info mt-3 mb-3" style="margin-left: 39%; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый товар
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/product/create" method="post" enctype="multipart/form-data">
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-sm">
            <div class="form-group">
                <label for="productName">Название товара</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group">
                <label for="price">Цена товара</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">BYN</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="typename">Категория покупателя</label>
                <select id="typename"  required name="typename" class="form-control"  >
                    <option value="">Категория не выбрана</option>
                    <#list gender as gender >
                        <option value="${gender.id}">${gender.name}</option>
                    </#list>
                </select>
            </div>
                 <div class="form-group">
                <label for="classname">Подкатегория</label>
                <select id="classname"  required name="classname" class="form-control">
                    <option value="">Подкатегория не выьбрана</option>
                    <#list classname as classname >
                        <option id="${classname.gender.id}" value="${classname.id}">${classname.name}</option>
                    </#list>
                </select>
                </div>
            <#list property as property>
                <div id="inputP" name="${property.classname.id}" class="inputP" style="display: none" value="${property.classname.id}">
                    <label id="${property.classname.id}"  for="${property.title}">Количество ${property.title} размера</label>
                    <input type="number" required class="form-control"
                           id="${property.title}" name="value">
                </div>
                <input type="text" required class="form-control"
                       id="${property.classname.id}" name="property" value="${property.id}" style="display: none">
            </#list>
                    </div>
            <br>
                            <div class="col-sm">
                 <div class="form-group">
                <label for="uppermaterial">Материал верха</label>
                <input type="text" required class="form-control"
                       id="uppermaterial" name="uppermaterial">
                </div>
                 <div class="form-group">
                <label for="liningmaterial">Материал подкладки</label>
                <input type="text" required class="form-control"
                       id="liningmaterial" name="liningmaterial">
                 </div>
                 <div class="form-group">
                <label for="solematerial">Материал подошвы</label>
                <input type="text" required class="form-control"
                       id="solematerial" name="solematerial">
                 </div>
                <div class="form-group">
                <label for="heel">Каблук</label>
                <input type="text" required class="form-control"
                       id="heel" name="heel">
                  </div>
                 <div  class="form-group">
                <label for="description">Описание товара</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
                  </div>
                            </div>
            </div>
            </div>
            <div class="form-group" style="margin-top: 20px">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография к товару</label>
                </div>
            </div>
            <br>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <script src="/static/jQuery/jquery-3.6.4.js"></script>
            <script src="/static/js/subcategory.js"></script>
            <script src="/static/js/property.js"></script>
            <script src="/static/js/propel.js"></script>

            <button type="submit" style="width: 50%;margin-left: 25%" class="btn btn-info">Добавить</button>
        </form>
    </div>
    <div class="container" style="margin-top: 10px">
    <div class="row">
        <div class="col-sm">
    <a class="btn btn-info mt-3 mb-3  " style="margin-left: 10%"
       data-toggle="collapse" href="#collapseExample1" role="button"
       aria-expanded="true" aria-controls="collapseExample1">
        Добавить категорию покупателей
    </a>
    <div class="collapse mb-3 " id="collapseExample1" >
        <form action="/gender" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Категория покупателей</label>
                <input type="text" required class="form-control"
                       id="name" name="name">
            </div>
            <br>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 50%;margin-left: 25%" class="btn btn-info">Добавить</button>
        </form>
    </div>
        </div>
        <div class="col-sm">
    <a class="btn btn-info mt-3 mb-3 " style="margin-left: 15%"
       data-toggle="collapse" href="#collapseExample2" role="button"
       aria-expanded="true" aria-controls="collapseExample2">
        Добавить категорию товара
    </a>
    <div class="collapse mb-3 " id="collapseExample2" >
        <form action="/classname" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Категория продукта</label>
                <input type="text" required class="form-control"
                       id="name" name="name">
            </div>
            <br>
            <div class="form-group">
                <label for="gender">Категория покупателей</label>
                <select id="gender" required name="gender" class="form-control">
                    <option value="">Категория не выбран</option>
                    <#list gender as gender >
                        <option value="${gender.id}">${gender.name}</option>
                    </#list>
                </select>
            </div>
            <br>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 50%;margin-left: 25%" class="btn btn-info">Добавить</button>
        </form>
    </div>
        </div>
        <div class="col-sm">
    <a class="btn btn-info mt-3 mb-3" style="margin-left: 18%"
       data-toggle="collapse" href="#collapseExample3" role="button"
       aria-expanded="true" aria-controls="collapseExample3">
        Добавить размеры товара
    </a>
    <div class="collapse mb-3 " id="collapseExample3">
        <form action="/size" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Названия свойства</label>
                <input type="text" required class="form-control"
                       id="title" name="title">
            </div>
            <br>
            <div class="form-group">
                <label for="searchCity">Размеры</label>
                <select id="classname" required name="classname" class="form-control">
                    <option value="">Подкатегория не выбран</option>
                    <#list classname as classname >
                        <option value="${classname.id}">${classname.gender.name} ${classname.name}</option>
                    </#list>
                </select>
            </div>
            <br>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 50%;margin-left: 25%" class="btn btn-info">Добавить</button>
        </form>
    </div>
        </div>
    </div>
    </div>
    <h1 style=" text-align: center ">Товары магазина</h1>
    <hr>
    <div style="margin-left: 20%;margin-bottom: 20px">
    <div class="row">
    <div class="col-sm">

    </div>
    <div class="col-sm">
        <form class="d-flex " method="get" action="/my/products">
            <input <#if searchWord??>value="${searchWord}"</#if> name="searchWord" class="form-control me-2" type="number" placeholder="Поиск по id" aria-label="Поиск">
            <button class="btn btn-outline-info btn-light" type="submit">Поиск</button>
        </form>
    </div>
    </div>
    </div>
    <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-4 g-4">
        <#list products as product>
            <div class="col" style="height: 500px">
                <a href="/product/${product.id}" class="product-link" style="text-decoration: none">
                    <div class="card text-white  bg-info my-4 product" >
                        <div class="row">
                            <div class="col">
                                    <form action="/product/edit/${product.id}" method="get" style="margin: 5px"  >
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-warning ">
                                            Редактировать
                                        </button>
                                    </form>
                            </div>
                                <div class="col">
                                    <form action="/product/delete/${product.id}" method="post" style="margin: 5px"  >
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger ">
                                            Удалить
                                        </button>
                                    </form>
                        </div>
                    </div>
                        <img  style="height: 230px" src="/images/${product.previewImageId}"
                              class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">${product.title}</h5>
                            <p class="card-text">${product.price} BYN</p>
                        </div>
                        <div class="card-footer">
                            Количество в наличии: ${product.number}
                        </div>
                    </div>
                </a>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>