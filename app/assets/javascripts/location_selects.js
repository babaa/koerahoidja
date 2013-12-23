$('.county-select').on('change', function() {
  $.get('/locations/parishes_and_towns', {name: $('option:selected', this).text()}, function(data) {
    $('.parish-town-select').empty();
    populateSelect($('.parish-town-select'), data);
    $('.parish-town-select').change();
  });
});

function populateSelect(obj, data) {
  for(var i in data) {
    var group = data[i];
    var ap = '<optgroup label="'+i+'">';
    for(var j in group) {
      ap += '<option value="'+group[j][1]+'">'+group[j][0]+'</option>';
    }
    ap += '</optgroup>';
    obj.append(ap);
  }
  
  
}