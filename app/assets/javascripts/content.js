$(function() {
  function buildHTML(content){
    var html = `<li class="list">
                  <a href=/genres/${content.genre_id}/contents/${content.id}/details>
                    ${content.title}
                  </a>
                  <div class="content-destroy">
                    <a data-confirm="本当に消しますか?" rel="nofollow" data-method="delete" href=/genres/${content.genre_id}/contents/${content.id}>
                      <i class="far fa-times-circle">
                      </i>
                    </a>
                </li>`
    return html;
  }

  $('#new_content').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html =buildHTML(data);
      $('.uk-list.uk-list-striped').prepend(html);
      $('.list').eq(9).remove();
      $('.form__content').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  });
});