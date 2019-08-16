$(function(){
  $('.user_profile_create').click(function() {
    liff.init(
      data => {
        const userId = data.context.userId;
        $.ajax({
          url: '/users',
          type: 'POST',
          dataType: 'html',
          async: true,
          data: {
            line_id: userId
          },
        });
      },
      err => {
        // LIFF initialization failed
      }
      );
      alert("登録しました。右上の×ボタンで閉じて下さい。");
 });

  $('.user_profile_edit').click(function() {
    liff.init(
      data => {
        const userId = data.context.userId;
        $.ajax({
          url: '/users/edit_search',
          type: 'GET',
          dataType: 'html',
          async: true,
          data: {
            line_id: userId
          },
        });
      },
      err => {
        // LIFF initialization failed
      }
    );
  });
});