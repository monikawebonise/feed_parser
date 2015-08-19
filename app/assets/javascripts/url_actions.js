$(function(){
  var parsed_data;
  $('#parse_btn').click(function(e){
    e.preventDefault()

    $.ajax({
      url: '/url_actions/parse',
      data: {url: $('#url').val()},
      dataType: 'JSON',
      type: 'POST',
      complete: function(data){
              $('#ResultFeeds').html('')
               parsed_data = $.parseJSON(data.responseText);
              $.each(parsed_data, function(index,value) {
                $("#ResultFeeds").append(index)
                $("#ResultFeeds").append("<div>")
                $("#ResultFeeds").append(value)
                $("#ResultFeeds").append("</div>")
              });
      }
    });
  });


$('#sort_btn').click(function(e){
    e.preventDefault();
    sorted_data = sort(parsed_data);
    $('#ResultFeeds').html('')
    $.each(sorted_data, function(index,value) {
      $("#ResultFeeds").append(index)
      $("#ResultFeeds").append("<div>")
      $("#ResultFeeds").append(value)
      $("#ResultFeeds").append("</div>")
   });
  });

  $('#search_btn').click(function(e){
    e.preventDefault()
    searched_data = search(parsed_data,$('#query').val());
    $('#ResultFeeds').html('')
    $.each(searched_data, function(index,value) {
      $("#ResultFeeds").append(index)
      $("#ResultFeeds").append("<div>")
      $("#ResultFeeds").append(value)
      $("#ResultFeeds").append("</div>")
   });
  });
    // $.ajax({
    //   url: '/url_actions/search',
    //   data: {query: $('#query').val(), url: $('#url').val()},
    //   dataType: 'JSON',
    //   type: 'GET',
    //   complete: function(data){
    //     $('#ResultFeeds').html('')
    //     response = JSON.parse(data.responseText)
    //     $('#ResultFeeds').html(response)
    //   }
    // });

  function sort(data)
  {
    // initializing an array with all the keys. //
    var keys = [];
    var values = [];
    // populating it with all the keys in the hashtable. //
    for (var key in data) {
      if (data.hasOwnProperty(key)) {
          keys.push(key);
      }
    }
    // Alphabetically sorting the array populated with hash table keys. //
    keys.sort();
    for (var i in keys){
      values.push(data[keys[i]])
    }
    var map = {};
    keys.forEach(function (key,index) {
        map[key] = values[index];
    });
    return map;
  }

  function search(data,query)
  {
    for (var i in data){
      //console.log(data);
      for ( var key in data[i]){
        if (data[key].search(/query/i)>=0|| data) {
            return data[i];
        }
      }
    }

  }



});

