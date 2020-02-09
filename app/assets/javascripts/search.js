$(function() {
  var search_list = $(".contents_row");
  
  function appendHostUser(host_user) {
    console.log(host_user);
    
    var html = `<div class = "host_user_biglist">
                  <div class = "host_user_list">
                    <a href= "/host_users/${host_user.id}">
                      <span>ユーザー名:  </span>${host_user.name}
                    </a>
                  </div>
                </div>`

    search_list.append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/host_users/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(host_users) {
      search_list.empty();
      if (host_users.length !== 0) {
        host_users.forEach(function(host_user){
          appendHostUser(host_user);

        });
      }
      else {
        appendErrMsgToHTML("一致するユーザーがいません");
      }
    })
    .fail(function() {
      alert('error');
    });
  })
});
