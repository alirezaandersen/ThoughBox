function toLowerCase(val){
  if(typeof val === "string"){
    return val.toLowerCase();
  }
  return val;
}

function updateLinkById(id,data){
  $.ajax({
    url: "api/v1/links/" + id,
    method: "PATCH",
    data: data
  });
}

function stripHtml(str){
  return str.replace(/<(?:.|\n)*?>/gm, '');
}
