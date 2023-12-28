$(document).ready(function () {
    var allRows = $("#record-table tr");

    $("#searchInput").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        allRows.hide();
        
        allRows.filter(function () {
            return $(this).text().toLowerCase().indexOf(value) > -1;
        }).show();
    });
});
