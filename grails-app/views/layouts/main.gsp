    <!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        Final
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>


    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>
    <div class="navbar navbar-inverse navbar-static-top" role="navigation">
        <ul class="nav navbar-nav">
            <li class="active">
                <a href="/carrito/ver">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                </a>
            </li>
            <li>
                <a href="/factura/ver_despachar">
                    <i class="fa fa-truck"></i> Despacho
                </a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Usuario <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/usuario/create">Crear</a></li>
                    <li><a href="/usuario/">Lista de Usuarios</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Producto <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/producto/create">Crear</a></li>
                    <li><a href="/producto/">Lista de Productos</a></li>
                </ul>
            </li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <g:if test="${!session.usuario}">
                <li><a href="/login/login"><i class="pe-7s-lock"  aria-hidden="true"></i>Iniciar Sesión</a></li>

            </g:if>
            <g:else>

                <li><a href="/login/logout"><i class="pe-7s-lock"  aria-hidden="true"></i>Cerrar</a></li>
            </g:else>
        </ul>
    </div>

    <g:layoutBody/>
    <asset:javascript src="application.js"/>

</body>
</html>
