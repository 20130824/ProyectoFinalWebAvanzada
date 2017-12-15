package ProyectoFinalWeb

import grails.converters.JSON

class FacturaController {

    def index() { }


    def ver_despachar(){

    }

    def service(){
        render Factura.list() as JSON
    }

    def despachar(){

        def factura = Factura.findById(params.factura)
        factura.despachada = true;
        factura.save()

        redirect action: "ver_despachar"
    }
}
