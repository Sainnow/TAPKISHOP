<#import "blocks/template.ftlh" as t>
<@t.template user>
<div class="mb-3" id="collapseExample" >
    <form  method="post" enctype="multipart/form-data">
        <br>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="form-group">
                        <label for="productName">Название товара</label>
                        <input type="text" required class="form-control"
                               id="productName" name="title" value="${product.title}">
                    </div>
                    <div class="form-group">
                        <label for="price">Цена товара</label>
                        <div class="input-group mb-3">
                            <input type="number" required class="form-control" id="price" name="price" value="${product.price}">
                            <div class="input-group-append">
                                <span class="input-group-text">BYN</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="uppermaterial">Материал верха</label>
                        <input type="text" required class="form-control"
                               id="uppermaterial" name="uppermaterial" value="${product.uppermaterial}">
                    </div>
                    <div class="form-group">
                        <label for="liningmaterial">Материал подкладки</label>
                        <input type="text" required class="form-control"
                               id="liningmaterial" name="liningmaterial" value="${product.liningmaterial}">
                    </div>
                </div>
                <div class="col-sm">
                    <div class="form-group">
                        <label for="solematerial">Материал подошвы</label>
                        <input type="text" required class="form-control"
                               id="solematerial" name="solematerial" value="${product.solematerial}">
                    </div>
                    <div class="form-group">
                        <label for="heel">Тип каблука</label>
                        <input type="text" required class="form-control"
                               id="heel" name="heel" value="${product.heel}">
                    </div>
                    <div  class="form-group">
                        <label for="description">Описание товара</label>
                        <textarea required class="form-control" id="description" name="description">${product.description}</textarea>
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

        <button type="submit" style="width: 50%;margin-left: 25%" class="btn btn-info">Изменить</button>
    </form>
</div>
</@t.template>