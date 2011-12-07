$(document).ready ->
  $("#job_begin_date, #job_end_date").datepicker({
    dateFormat: "yy-mm-dd"
  })
  $(".show_applicant").click ->
    id = $(this).attr("id").split("_")[1]
    $("#applicants_" + id).slideToggle 'fast'
#    $("#applicants_" + id).toggle showOrHide

