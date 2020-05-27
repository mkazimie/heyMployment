// FUNCTION FOR SORTING TABLES

$('.fa-sort').click(function () {
    var table = $(this).parents('table').eq(0);
    var rows = table.find('tr.sort-me').toArray().sort(comparer($(this).index()));
    this.asc = !this.asc;
    if (!this.asc) {
        rows = rows.reverse()
    }
    for (var i = 0; i < rows.length; i++) {
        table.append(rows[i])
    }
});

function comparer(index) {
    return function (a, b) {
        var valA = getCellValue(a, index), valB = getCellValue(b, index);
        return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.toString().localeCompare(valB)
    }
}

function getCellValue(row, index) {
    return $(row).children('td').eq(index).text()
}
