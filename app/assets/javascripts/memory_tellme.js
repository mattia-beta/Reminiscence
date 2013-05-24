/**
 * Created with JetBrains RubyMine.
 * User: mattia
 * Date: 03/05/13
 * Time: 22.39
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(function()
{

    num_char = 0;
    var foto_item;

    function draw_objects(data)
    {
        if(data != "")
        {
            var html = "";

            for(var i = 0; i < data.length; i++)
            {
                var name = data[i]["name"];
                var desc = data[i]["description"];
                var pic = data[i]["image"]["url"];

                html += "<img src='" + pic + "' width='250px' class='memory_item' indice='" + i + "'>";
            }

            $('#foto').html(html);

            foto_item = data;
        }
    }


    function get_name_by_id(id)
    {
        var result = null;
        var scriptUrl = "/getseniorname_by_id/" + id;

        $.ajax(
        {
            url: scriptUrl,
            type: 'get',
            dataType: 'json',
            async: false,
            success: function(data)
            {
                result = data;
            }
        });

        return result["name"] + " " + result["surname"];
    }

    function draw_friend(data)
    {
        if(data != "")
        {
            var html = "";

            for(var i = 0; i < data.length; i++)
            {
                var when = data[i]["data"].substring(0, 4);
                var where = data[i]["luogo"];
                var title = data[i]["titolo"];
                var who = get_name_by_id( data[i]["senior_id"] );


                html +=  '<div> <p>Anche il tuo amico ';
                html += '<a href="#">' + who + '</a> ha un ricordo che riguarda ';
                html += '<a href="#">' + title + " nel " + when + '</a></p>';
                html += '<p>Clicca <a href="#">qui</a> per leggerlo.</p> </div>';
                html += "<br/>";
            }

            $('#ricordi_amici').html(html);
        }
    }

    function send_text(keywords)
    {
        $.get('/tellme/text/' + keywords, function(data)
        {
            draw_objects(data);
        });
    }


    function send_data(year)
    {
        $.get('/tellme/data/' + year, function(data)
        {
            draw_objects(data);
        });
    }


    function send_title(title)
    {
        $.get('/tellme/friend/' + title, function(data)
        {
            draw_friend(data);
        });
    }


    function cleanWord(word)
    {
        word = word.replace(",", "").replace(".", "").replace("'", "");
        return word;
    }



    //*********** EVENTI ****************


    $("#memory_testo").keypress(function()
    {
        num_char++;

        var last = [];


        if(num_char % 5 == 0)
        {
            var parole = $("#memory_testo").val().split(' ');

            if(parole.length > 12)
            {
                for(var i = parole.length -12; i < parole.length-1; i++)
                {
                    if(parole[i].length > 3)
                    {
                        last.push(cleanWord(parole[i]));
                    }
                }
            }
            else
            {
                for(var i = 0; i < parole.length-1; i++)
                {
                    if(parole[i].length > 3)
                    {
                        last.push(cleanWord(parole[i]));
                    }
                }
            }

            console.log(last);

            send_text(last.join(","));
        }
    });


    $("#memory_data").focusout(function()
    {
        send_data($("#memory_data").val());
    });


    $("#memory_titolo").focusout(function()
    {
        send_title($("#memory_titolo").val());
    });

    $( document).on( 'click', '.memory_item', function()
    {
        var index = $(this).attr("indice");
        var item = foto_item[index];

        $('#modal-desc').html(item["description"]);
        $('#modal-title').html(item["name"]);
        $('#modal-foto').html(" <img src='" + item["image"]["url"] +"' title='' alt'' width='200px'> ");


        $('#myModal').modal('show');
    });
});



