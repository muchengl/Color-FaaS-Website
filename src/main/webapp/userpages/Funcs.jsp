
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.4.1.js"></script>
</head>
<body style="margin-left: 50px;margin-right: 50px">

<h2>Upload Func</h2>
<hr/>
<form method="post" action="./wasm"
      enctype="multipart/form-data">
    <label>Func Name:</label>
    <input type="text" name="filename"/>
    <br/>

    <label>Func Usage:</label>
    <input type="text" name="description"/>
    <br/>

    <label>Func Code File:</label>
    <input type="file" name="file"/>
    <br/>


    <button type="submit">Submit</button>
</form>

<br><br>
<h2>Func List</h2>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        id
                    </th>
                    <th>
                        Func name
                    </th>
                    <th>
                        Func description
                    </th>
                    <th>
                        Actions
                    </th>
                </tr>
                </thead>
                <tbody id="list">

                </tbody>

            </table>
        </div>
    </div>
</div>

<script>

    $.get({
        url: "/funcs",
        dataType: 'json',
        success: function (data) {
            //alert(data);
            for (i = 0; i < data.length; i++) {
                if(data[i].func_status==1) {
                    $("#list").append(
                        "<tr>"
                        + "<td>" + data[i].id + "</td>"
                        + "<td>" + data[i].func_name + "</td>"
                        + "<td>" + data[i].func_description + "</td>"
                        + "<td><a>删除</a>｜<a>修改</a></td>"
                        + "</tr>"
                    );

                }
            }

        }
    })


</script>




</body>
</html>