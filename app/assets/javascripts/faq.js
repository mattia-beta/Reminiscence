/**
 * Created with JetBrains RubyMine.
 * User: mattia
 * Date: 01/04/13
 * Time: 21.32
 * To change this template use File | Settings | File Templates.
 */


// e in due righe ho fatto quello che hai fatto in 136.. :P hahahah
// non si finisce mai di imparare! :D cosi' e' molto meglio! ;) grande!

$(document).ready(function ()
{
    $(".bottone").click(function()
    {
        $(".accordion").hide();
        $("#domande-" + $(this).attr("gruppo")).show();
    });
});

