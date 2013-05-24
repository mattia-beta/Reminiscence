/**
 * Created with JetBrains RubyMine.
 * User: mattia
 * Date: 10/05/13
 * Time: 18.39
 * To change this template use File | Settings | File Templates.
 */


if (!String.prototype.format)
{
    String.prototype.format = function ()
    {
        var args = arguments;
        return this.replace(/{(\d+)}/g, function (match, number)
        {
            return typeof args[number] != 'undefined'
                ? args[number]
                : match
                ;
        });
    };
}


$(document).ready(function()
{
    function person(nome, cognome)
    {
        this.nome = nome;
        this.cognome = cognome;
        this.fratelli = new Array();
        this.figli = new Array();
        this.genitori = new Array();

        this.addFratello=addFratello;
        function addFratello(val)
        {
            this.fratelli.push(val);
            console.log("Aggiunto fratello " + val.nome)
        }

        this.addFiglio=addFiglio;
        function addFiglio(val)
        {
            this.figli.push(val);
            console.log("Aggiunto figlio " + val.nome)
        }
        this.addGenitore=addGenitore;
        function addGenitore(val)
        {
            this.genitori.push(val);
            console.log("Aggiunto genitore " + val.nome)
        }
    }





    var me = new person("Mattia","S");
    var padre = new person("Massimo", "S");
    var madre = new person("Meri", "B");
    var nonno_pat = new person("Stefano","S");
    var nonna_pat = new person("Viola", "S");
    var bisnonno_pat1 = new person("Ezio", "S");
    var bisnonna_pat1 = new person("Margherita","S");
    var bisnonno_pat2 = new person("Silvio", "S");
    var bisnonna_pat2 = new person("Giada","S");
    var nonno_mat = new person("Franco","B");
    var nonna_mat = new person("Laura","B");
    var bisnonno_mat3 = new person("Livio", "G");
    var bisnonna_mat3 = new person("Margherita","F");
    var bisnonno_mat4 = new person("Mario", "B");
    var bisnonna_mat4 = new person("Lidia","G");


    /*
     me.addFratello(new person("BUS", "BUS"));
     me.addFiglio(new person("Son", "Doe"));
     me.addFiglio(new person("Jimmy", "Doe"));
     me.addFiglio(new person("Sasha", "Doe"));


     // padre - madre
     padre.addFratello(new person("Jimmy","Bus"));
     padre.addFratello(new person("Beppe","Bus"));


     // nonno - nonna --> parte paterna
     nonno_pat.addFratello(new  person("Simona","S"));


     // nonno - nonna --> parte materna
     nonno_mat.addFratello(new  person("Giorgio","B"));
     */




    me.addGenitore(padre);
    me.addGenitore(madre);
    padre.addGenitore(nonno_pat);
    padre.addGenitore(nonna_pat);
    //bisnonno - bisnonna --> parte paterna ( nonno )
    nonno_pat.addGenitore(bisnonno_pat1);
    nonno_pat.addGenitore(bisnonna_pat1);
    //bisnonno - bisnonna --> parte paterna ( nonna )
    nonna_pat.addGenitore(bisnonno_pat2);
    nonna_pat.addGenitore(bisnonna_pat2);

    madre.addGenitore(nonno_mat);
    madre.addGenitore(nonna_mat);
    //bisnonno - bisnonna --> parte materna ( nonno )
    nonno_mat.addGenitore(bisnonno_mat3);
    nonno_mat.addGenitore(bisnonna_mat3);
    //bisnonno - bisnonna --> parte materna ( nonna )
    nonna_mat.addGenitore(bisnonno_mat4);
    nonna_mat.addGenitore(bisnonna_mat4);


    /*
     //i miei nonni
     var miei_nonni = Array();
     for(var i = 0; i < me.genitori.length; i++)
     {
     for(var k = 0; k < me.genitori[i].genitori.length; k++)
     {
     miei_nonni.push(me.genitori[i].genitori[k]);
     }
     } */

    //console.log("HEY HEY HO " + miei_nonni.length + " NONNI");

    // tmp la riempio per mandare dentro l'html nella pagina
    var tmp = "<div class='bus'>";



    function esplora(person)
    {
        this.person = person;

        if (person.genitori.length != 0)
        {
            for (var i=0; i<person.genitori.length; i++)
            {
                tmp += "<li><a href='#'>"+person.genitori[i].nome+"  "+person.genitori[i].cognome+"</a>";

                // controllo sui genitori che abbiano anch'essi genitori (nonni)
                if (person.genitori[i].genitori.length != 0)
                {
                    tmp += "<ul>"
                    for (var k=0; k<person.genitori[i].genitori.length;k++)
                    {
                        tmp += "<li><a href='#'>"+person.genitori[i].genitori[k].nome+"  "+person.genitori[i].genitori[k].cognome+"</a>";

                        // controllo sui 4 bisnonni per parte dell'albero

                        if(person.genitori[i].genitori[k].genitori.length != 0)
                        {

                            tmp += "<ul>";
                            for ( var j=0; j<person.genitori[i].genitori[k].genitori.length; j++)
                            {
                                tmp += "<li><a href='#'>"+person.genitori[i].genitori[k].genitori[j].nome +"  "+person.genitori[i].genitori[k].genitori[j].cognome +"</a></li>";

                            }
                            tmp += "</ul>";     // chiudo il blocco bisnonno/bisnonna
                        }

                    }
                    tmp += "</li></ul>";        // chiudo il blocco del nonno/nonna

                }

            }
            tmp += "</li>";   // chiudo il blocco riferito al padre, poi madre
        }


    }


    //stampo ME
    tmp += "<ul><li><a href='#'>"+me.nome+" "+me.cognome+"</a><ul>";

    // chiamo esplora su ME
    esplora(me);



    tmp += "</ul></li></ul>";   // chiudo il blocco riferito a ME
    tmp += "</div>" +
        "</div>";

    $(".span12").html(tmp);

});