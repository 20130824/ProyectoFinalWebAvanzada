<%@ page import="ProyectoFinalWeb.TipoUsuario" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Tienda Something </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/favicon.png">
    <asset:stylesheet src="application.css"/>

</head>
<body>

<!-- PRELOADER -->
<div id="preloader">
    <div class="preloader-area">
        <div class="preloader-box">
            <div class="preloader"></div>
        </div>
    </div>
</div>


<section class="header-top-section">
    <div class="container">
        <div class="row">
            <div  class="col-md-6">
                <div class="header-top-content">
                    <ul class="nav nav-pills navbar-left">
                        <li><a href="#"><i class="pe-7s-call"></i><span>123-123456789</span></a></li>
                        <li><a href="#"><i class="pe-7s-mail"></i><span> info@mart.com</span></a></li>
                        <li><a href="/"><i ></i><span>Inicio</span></a></li>

                        <g:if test="${session.usuario}">
                            <g:if test="${session.usuario.tipo in [TipoUsuario.ADMIN]}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        Usuario <span class="caret"></span>
                                    </a>
                                    <ul style="background-color: #1abc9c; padding-left: 3px" class="dropdown-menu">
                                        <li><a href="/usuario/create">Crear</a></li>
                                        <li><a href="/usuario/">Lista de Usuarios</a></li>
                                    </ul>
                                </li>

                            </g:if>
                        </g:if>


                        <g:if test="${session.usuario}">
                            <g:if test="${session.usuario.tipo in [TipoUsuario.ADMIN]}">

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        Producto <span class="caret"></span>
                                    </a>
                                    <ul style="background-color: #1abc9c; padding-left: 3px" class="dropdown-menu">
                                        <li><a href="/producto/create">Crear</a></li>
                                        <li><a href="/producto/">Lista de Productos</a></li>
                                    </ul>
                                </li>
                            </g:if>
                        </g:if>

                    </ul>
                </div>
            </div>
            <div  class="col-md-6">
                <div class="header-top-menu">
                    <ul class="nav nav-pills navbar-right">

                        <g:if test="${session.usuario}">
                            <g:if test="${session.usuario.tipo in [TipoUsuario.ADMIN, ProyectoFinalWeb.TipoUsuario.ALMACEN]}">

                                <li>
                                    <a href="/factura/ver_despachar">
                                        <i class="fa fa-truck"></i> Despacho
                                    </a>
                                </li>

                            </g:if>
                        </g:if>
                        <g:if test="${!session.usuario}">
                            <li><a href="/login/login"><i class="pe-7s-lock"  aria-hidden="true"></i>Iniciar Sesión</a></li>

                        </g:if>
                        <g:else>

                            <li><a href="/login/logout"><i class="pe-7s-lock"  aria-hidden="true"></i>Cerrar Sesión</a></li>
                        </g:else>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<header class="header-section">
    <nav class="navbar navbar-default">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><b>T</b>ienda</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Inicio</a></li>
                    <li><a href="/producto">Productos</a></li>

                </ul>
                <ul class="nav navbar-nav navbar-right cart-menu">
                    <li><a  href="/carrito/ver" style="cursor: pointer;" data-target="#cart-modal" data-toggle="modal"><span> Carrito&nbsp;</span> <span class="shoping-cart"  >T</span></a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container -->
    </nav>
</header>



<div class="container" role="main">
    <div class="row">
        <div class="col col-md-12">
            <h1>${accion}</h1>
            <br>
            <g:if test="${flash.error}">
                <div class="alert alert-danger" role="status">${flash.error}</div>
                <br>
            </g:if>
            <g:form action="processForm" method="post" enctype="multipart/form-data">
                <g:field type="hidden" name="id" value="${producto?.id}" />
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <g:field id="nombre" type="text" class="form-control" name="nombre" value="${producto?.nombre}" />
                </div>
                <div class="form-group">
                    <label for="desc">Descripcion</label>
                    <g:field id="desc" type="text" class="form-control"  name="descripcion" value="${producto?.descripcion}" />
                </div>
                <div class="form-group">
                    <label for="desc">Precio</label>
                    <g:field type="text" name="precio" class="form-control"  value="${producto?.precio}" />
                </div>
                <div class="form-group">
                    <label for="desc">Existencia</label>
                    <g:field type="number" name="existencia" class="form-control"  value="${producto?.existencia}" />
                </div>
                <div class="form-group">
                    <label for="foto">Imagen</label>
                    <g:if test="${producto?.imagen}">
                        <img class="thumbnail"
                             src="data:image/jpeg;base64,${producto.imagen.encodeBase64()}"
                             alt="No hay imagen" style="height: 200px" />
                    </g:if>

                    <g:field id="foto"   type="file" name="imagen" />
                </div>

                <div class="form-group">
                    <g:submitButton name="Crear"  class="btn btn-info form-control" />
                </div>
            </g:form>
        </div>
    </div>
</div>



<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p class="center">Made with <i class="fa fa-heart"></i> by <a href="https://revolthemes.net/" target="_blank">Revolthemes</a>. All Rights Reserved</p>

            </div>
        </div>
    </div>
</footer>

<div class="modal fade" id="cart-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" >&times;</button>
                <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-shopping-cart"></span>Mi Carro de Compras</h4>
            </div>
            <div class="modal-body">
                <table class="table table-hover table-responsive" id="carTable"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Facturar</button>
            </div>
        </div>
    </div>
</div>

<!-- JQUERY -->
<asset:javascript src="application.js"/>
</body>
</html>
