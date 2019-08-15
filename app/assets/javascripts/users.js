$(function(){
  $('.user_profile').click(function() {
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
});