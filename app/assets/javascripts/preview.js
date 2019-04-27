$(function(){
  $('#new_coordinate').on('change', function(e){
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
        // t = this

    // if(file.type.index0f("image") < 0){
    //   return false;
    // }

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: '361px',
          class: "mt-5 mb-4 img-fluid",
          title: file.name
        }));
      }
    })(file);

    reader.readAsDataURL(file);
  })
})
