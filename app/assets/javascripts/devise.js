$(function(){
  function buildHTML(detail){
    if (detail.image) {
      var html =
        `<li class="detail">
          <strong class="detail_name">
            ${detail.detail}
          </strong>
          <div class="detail_image">
            <img src=${detail.image} alt="Default">
          </div>
          <p class="detail_text">
            ${detail.text}
          </p>
          <div class="detail_destroy">
            <a data-confirm="本当に消しますか?" rel="nofollow" data-method="delete" href=/genres/${detail.genre_id}/contents/${detail.content_id}/details/${detail.id}>
              <i class="far fa-times-circle">
              </i>
            </a>
          </div>
        </li>`
      return html;
    } else {
        var html = 
        `<li class="detail">
        <strong class="detail_name">
          ${detail.detail}
        </strong>
        <div class="detail_image">
          <img src="/assets/default-565b88a8c2fade1693a3bcaf71d4ec98c88c56b1a1ec7d2d725880225333d61b.jpg" alt="Default">
        </div>
        <p class="detail_text">
          ${detail.text}
        </p>
        <div class="detail_destroy">
          <a data-confirm="本当に消しますか?" rel="nofollow" data-method="delete" href=/genres/${detail.genre_id}/contents/${detail.content_id}/details/${detail.id}>
            <i class="far fa-times-circle">
            </i>
          </a>
        </div>
      </li>`
      return html;
    };
  }

  $('#new_detail').on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      console.log(html);
      $('.main').prepend(html); 
      $('.new_detail')[0].reset();
      $('.input-box__bottom__send-btn').prop('disabled', false);     
    })
    .fail(function(){
      alert('error');
    })
  });
});