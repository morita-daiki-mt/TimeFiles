$(document).on('turbolinks:load', function() {
  $('#action_at').datetimepicker({
      format: 'YYYY-MM-DD',
      pickTime : false,
  });
});

