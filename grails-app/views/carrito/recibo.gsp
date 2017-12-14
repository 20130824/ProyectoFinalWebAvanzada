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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Usuario <span class="caret"></span>
                            </a>
                            <ul style="background-color: #1abc9c; padding-left: 3px" class="dropdown-menu">
                                <li><a href="/usuario/create">Crear</a></li>
                                <li><a href="/usuario/">Lista de Usuarios</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Producto <span class="caret"></span>
                            </a>
                            <ul style="background-color: #1abc9c; padding-left: 3px" class="dropdown-menu">
                                <li><a href="/producto/create">Crear</a></li>
                                <li><a href="/producto/">Lista de Productos</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div  class="col-md-6">
                <div class="header-top-menu">
                    <ul class="nav nav-pills navbar-right">
                        <li>
                            <a href="/factura/ver_despachar">
                                <i class="fa fa-truck"></i> Despacho
                            </a>
                        </li>
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
                    <li class="active"><a href="">Inicio</a></li>
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
            <br>
            <a href="/producto/catalogo" target="" class="btn btn-primary btn-large">
                Seguir comprando
            </a>
            <br>
            <div class="jumbotron">
                <p>
                    <a href="/reporting/factura_reporte?factura=${factura.id}" target="_blank" class="btn btn-primary btn-large">
                        <i class="fa fa-file-pdf-o"></i>
                    </a>
                </p>
                <h1>Reporte de factura: ${factura.comprobante}</h1>
                <p><b>${factura.fecha}</b></p>
                <p>Direccion: ${factura.direccion}</p>
                <p>A nombre de: ${factura.cliente.nombre}</p>
                <p>Monto: RD$ <span class="badge">${factura.total()}</span></p>
            </div>
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
<script src="/webjars/jquery/3.1.0/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7-1/js/bootstrap.js"></script>
<script>
    $(document).ready(
        function () {
            $.get( "/reporting/despacho_reporte?factura="+ ${factura.id}, function( data ) {
                $( ".result" ).html( data );
            });
        }
    );

</script>
</body>
</html>
