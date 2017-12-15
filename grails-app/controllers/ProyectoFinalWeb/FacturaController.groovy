package ProyectoFinalWeb

import grails.converters.JSON

class FacturaController {

    def index() { }


    def ver_despachar(){

    }

    def graficos(){

        def facturas = Factura.findAll()

        def despachadas = Factura.findAllByDespachada(true)
        def noDespachadas =  Factura.findAllByDespachada(false)


        println "despachadas: " + despachadas.size() + ". No despachadas: " + noDespachadas.size()
        def mapa = ["despachadas": despachadas.size(), "noDespachadas": noDespachadas.size(), "comprasRealizadas": facturas.size() ]

        def datos = ["datos" : mapa]
        respond datos

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
