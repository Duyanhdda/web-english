$("#form-add-khoahoc").submit(function (e) {
    e.preventDefault();
    //Write code to check if student id is existed!
    //Camel case
    var khoahocId = $("input[name='MaKH']").val();
    var form = $(this);

    $.post("/khoahoc/checkId", { id: khoahocId }, function (data) {
        console.log(data);
        if (data.status == "FOUND") {
            //alert("Đã tồn tại mã số sinh viên này!");
            $(document).Toasts('create', {
                class: 'bg-danger',
                title: 'Quản lý Sinh viên',
                subtitle: 'Library',
                body: 'Đã tồn tại sinh viên này! Hãy nhập lại.'
            })
        }
        else {
            $(document).Toasts('create', {
                class: 'bg-success',
                title: 'Quản lý Sinh viên',
                subtitle: 'Library',
                body: 'Successfully. Have a nice day!',
              });
              setTimeout(function () {
                form.unbind("submit").submit();
              }, 1000);
            // console.log("NOT FOUND");

        }
    });
});