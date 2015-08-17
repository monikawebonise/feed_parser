$(function(){
  $('#parse_btn').click(function(e){
    e.preventDefault()

    $.ajax({
      url: '/url_actions/parse',
      data: {url: $('#url').val()},
      dataType: 'JSON',
      type: 'POST',
      complete: function(data){
              $('#ResultFeeds').html('')
              var parsed_data = $.parseJSON(data.responseText);
              $.each(parsed_data, function(index,value) {
                $("#ResultFeeds").append("<div>")
                $("#ResultFeeds").append(index)
                $("#ResultFeeds").append("</div>")
                $("#ResultFeeds").append("<div>")
                $("#ResultFeeds").append(value)
                $("#ResultFeeds").append("</div>")
              });
      }
    });
  });


  $('#sort_btn').click(function(e){
    e.preventDefault()
    $.ajax({
      url: '/url_actions/sort',
      data: {},
      dataType: 'JSON',
      type: 'GET',
      complete: function(data){
        // var response = JSON.parse(data.responseText).html_safe
        // $('#ResultFeeds').html(response)
        $('#ResultFeeds').html('')
         var parsed_data = $.parseJSON(data.responseText);
              $.each(parsed_data, function(index,value) {
                $("#ResultFeeds").append("<div>")
                $("#ResultFeeds").append(index)
                $("#ResultFeeds").append("</div>")
                $("#ResultFeeds").append("<div>")
                $("#ResultFeeds").append(value)
                $("#ResultFeeds").append("</div>")
              });
      }
    });
  });

  $('#search_btn').click(function(e){
    e.preventDefault()
    $.ajax({
      url: '/url_actions/search',
      data: {query: $('#query').val(), url: $('#url').val()},
      dataType: 'JSON',
      type: 'GET',
      complete: function(data){
        $('#ResultFeeds').html('')
        response = JSON.parse(data.responseText)
        $('#ResultFeeds').html(response)
      }
    });
  });

});

