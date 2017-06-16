$(document).ready(function() {
  memberSearchListener();
});

var memberSearchListener = function () {
  $("#member-search").on('submit', function (e) {
    e.preventDefault();

    var $memberSearchForm = $(this);
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    })
    // console.log(data);
    .done(function(response) {
      $('#search-result-holder').html(response);
      console.log("success");
    })
    .fail(function(r) {
      console.log("error ajaxing in the politician", r);
    });


  })
}
