var tagBody = '(?:[^"\'>]|"[^"]*"|\'[^\']*\')*';

var tagOrComment = new RegExp(
    '<(?:'
    // Comment body.
    + '!--(?:(?:-*[^->])*--+|-?)'
    // Special "raw text" elements whose content should be elided.
    + '|script\\b' + tagBody + '>[\\s\\S]*?</script\\s*'
    + '|style\\b' + tagBody + '>[\\s\\S]*?</style\\s*'
    // Regular name
    + '|/?[a-z]'
    + tagBody
    + ')>',
    'gi');
function removeTags(html) {
  var oldHtml;
  do {
    oldHtml = html;
    html = html.replace(tagOrComment, '');
  } while (html !== oldHtml);
  return html.replace(/</g, '&lt;');
}

function imposeMaxLength(Object, MaxLen) {
  return (Object.value.length < MaxLen);
}

function prependListItem(listName, listItemHTML){
  $(listItemHTML).hide().prependTo('#' + listName).slideDown('slow');
}

function appendListItem(listName, listItemHTML){
  $(listItemHTML).hide().appendTo('#' + listName).slideDown('slow');
}

function removeDuplicates(arr) {
  var dataMap = {};
  for (var i = arr.length - 1; i >= 0; i--) {
    dataMap[arr[i]] = 1;
  };

  var results = [];
  for(var k in dataMap) {
    results.push(k);
  }
  return results;
}