<#import "blocks/template.ftlh" as t>
<@t.template user>
    <link rel="stylesheet" href="/static/css/menu.css">
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="container-fluid" >
            <div >
                <a href="/" class="navbar-brand text-white mb-0 h1">Список товаров</a>
            </div>
            <div style="margin-right: 40%">
                <ul id="firsul" class="menu"  >
                    <li>
                        <button class="btn btn-outline-info btn-light btn-lg " type="submit" >Ассортимент</button>
                        <ul >
                            <#list gender as gender >
                                <li>
                                    <form class="d-flex " method="get" action="/">
                                        <button class="btn btn-outline-info btn-light btn-lg"  value="${gender.id}" name="searchTypenameId" type="submit">${gender.name}</button>
                                    </form>
                                    <ul>
                                        <#list classname as classname >
                                        <#if gender.id==classname.gender.id>
                                        <li>
                                            <form class="d-flex " method="get" action="/">
                                                <button class="btn btn-outline-info btn-light btn-lg"  value="${classname.id}" name="searchClassId" type="submit">${classname.name}</button>
                                            </form>
                                            </#if>

                                            </#list>
                                        </li>
                                    </ul>
                                </li>
                            </#list>
                        </ul>
                    </li>
                </ul>
            </div>
            <div>
                <form class="d-flex " method="get" action="/">
                    <input <#if searchWord??>value="${searchWord}"</#if> name="searchWord" class="form-control me-2" type="search" placeholder="Поиск" aria-label="Поиск">
                    <button class="btn btn-outline-info btn-light" type="submit">Поиск</button>
                </form>
            </div>
        </div>
    </nav>
    <hr>

    <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-4 g-4">
                <#list products as product>
    <div class="col" style="height: 500px">
                    <a href="/product/${product.id}" class="product-link" style="text-decoration: none">
                        <div class="card text-white  bg-info my-4 product" >

                            <img  style="height: 230px" src="/images/${product.previewImageId}"
                                  class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text">${product.price} BYN</p>
                            </div>
                            <div class="card-footer">
                                ${product.description}
                            </div>
                        </div>
                    </a>
    </div>
                <#else>
                    <h1 style="text-align: center">Не найдено</h1>
                </#list>
    </div>
    <nav aria-label="Page navigation ">
        <ul class="pagination justify-content-center pagination-md ">
            <li class="page-item <#if currentpage==0> disabled</#if>">
                <a class="page-link text-info <#if currentpage==0> text-dark</#if> " href="/${currentpage-1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <#list 0..pagesize-1 as x>
            <li class="page-item     <#if currentpage==x> active </#if>"><a class="page-link text-info <#if currentpage==x> text-light  </#if>" href="/${x}">${x+1}</a></li>
            </#list>
            <li class="page-item <#if currentpage=pagesize-1> disabled</#if>" >
                <a class="page-link text-info <#if currentpage=pagesize-1> text-dark</#if> " href="/${currentpage+1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
</@t.template>