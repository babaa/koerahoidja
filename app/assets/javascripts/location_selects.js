$('.county-select').on('change', function() {
  $.get('/locations/parishes_and_towns', {name: $('option:selected', this).text()}, function(data) {
    $('.parish-select').empty();
    populateSelect($('.parish-select'), data);
    $('.parish-select').change();
  });
});

function populateSelect(obj, data) {
  for(var i in data) {
    var alreadyExists = false;
    $('option:selected', obj).each(function(_, v) {
      if($(v).val() == data[i][1]) {
        alreadyExists = true;
        return false;
      }
    });
  
  if(!alreadyExists) {
      obj.append('<option value="'+data[i][1]+'">'+data[i][0]+'</option>');
    }
  }
}