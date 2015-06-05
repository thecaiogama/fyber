$("#submit").click(function(){
  if ( $('#userId').val().length === 0 || $('#customParamenter').val().length === 0 || $('#pageNumber').val().length === 0) {
    alert("Please, provide all the information required");
  } else {
    getOffers();
  }
});

$("#pageNumber").keydown(function (e) {
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
        (e.keyCode == 65 && e.ctrlKey === true) ||
        (e.keyCode == 67 && e.ctrlKey === true) ||
        (e.keyCode == 88 && e.ctrlKey === true) ||
        (e.keyCode >= 35 && e.keyCode <= 39)) {
             return;
    }

    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});

function getOffers(){
  $("#contentTarget").html("<img id='loadingGif' src='https://d13yacurqjgara.cloudfront.net/users/12755/screenshots/1037374/hex-loader2.gif' />");
  var url = "/offers/"+  $('#userId').val() +"/"+ $('#customParamenter').val() +"/"+ $('#pageNumber').val();

  $.get( url, function(data) {
    if(data.count > 0) {
      buildTable(data.count, data.offers)
    } else {
      $("#contentTarget").html("<b>No data was found, try another search :(</b>");
    }

  });
}

function buildTable(count, offers){
  var table ="<table class='table' id='offers'><thead><th colspan='4'>Total of offers found: {{amount}}</th><th class='nextPage'><a href='#' class='next'>next page</a></th></thead><thead><tr><th>Offer id</th><th>Title</th><th>Teaser</th><th>Payout</th><th>Thumb</th></tr></thead></table>";

  var offersData = {
      amount: count
  }

  var offerHtml = Mustache.render(table, offersData);
  $("#contentTarget").html(offerHtml);

  buildData(offers)

}

function buildData(offers){
  var line = "<tr><td>{{offer_id}}</td><td><a href='{{link}}'>{{title}}</a></td><td>{{teaser}}</td><td>{{payout}}</td><td><img src='{{thumb}}'/></td></tr>"

  $.each(offers, function(index, offer) {
    item = {
      offer_id: offer.offer_id,
      title: offer.title,
      link: offer.link,
      teaser: offer.teaser,
      payout: offer.payout,
      thumb: offer.thumbnail.lowres
    }

    var row = Mustache.render(line, item);
    $("#offers").append(row);
  });

  $(".next").click(function(){
      $("#pageNumber").val('2');
      $("#submit").click();
  })
}
