function sendLineNotify(message) {
 var token = "ใส่ token";
 var msg = "ข้อความที่ต้องการ" ;
  var imageLink = "ลิ้งค์รูป";
  var messages = {
        message: msg ,
        imageThumbnail: imageLink,
        imageFullsize: imageLink
      };
  
  var url = "https://notify-api.line.me/api/notify";
   var options = {
      "method": "post",
      "payload": messages,
      "headers": {
        "Authorization": "Bearer " + token
       }
  };
  
  UrlFetchApp.fetch(url, options);
}
