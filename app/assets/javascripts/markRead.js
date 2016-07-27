function updateLinkById(id,data){
  $.ajax({
    url: "api/v1/links/" + id,
    method: "PATCH",
    data: data
  });
}

function markAsRead(e) {
  var
    data = {read: true},
    id = e.data.id;

  updateLinkById(id,data);

  $('#' + id + '-li').addClass('read-link');
  $(this).toggleClass('hide');
  $(this).next().toggleClass('hide');
}

function markAsUnread(e) {
  var
    data = {read: false},
    id = e.data.id;

  updateLinkById(id,data);

  $('#' + id + '-li').removeClass('read-link');
  $(this).toggleClass('hide');
  $(this).prev().toggleClass('hide');
}
