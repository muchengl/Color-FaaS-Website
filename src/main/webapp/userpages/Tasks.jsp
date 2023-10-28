<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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


<h2>Tasks</h2>
<hr/>
<div class="container-fluid" style="width: 950px">
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
                        Task Status
                    </th>
                    <th>
                        Task input
                    </th>
                    <th>
                        Task output
                    </th>
                    <th>
                        Begin time
                    </th>
                    <th>
                        End time
                    </th>
                    <th>
                        Task Host
                    </th>
                </tr>
                </thead>
                <tbody id="listTasks">

                <tr>
                    <td>0</td>
                    <td>Hello world</td>
                    <td>Finish</td>
                    <td>2023 - 10 - 1</td>
                    <td>Helloworld</td>
                    <td>na</td>
                    <td>na</td>
                    <td>127.0.0.1</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>Hello world</td>
                    <td>Finish</td>
                    <td>2023 - 10 - 1</td>
                    <td>Helloworld</td>
                    <td>na</td>
                    <td>na</td>
                    <td>127.0.0.1</td>
                </tr>

                </tbody>

            </table>
        </div>
    </div>
</div>

<script>

    $.get({
        url: "/tasks",
        dataType: 'json',
        success: function (data) {
            //alert(data);
            for (i = data.length-1; i >=0 ; i--) {
                var status=(data[i].task_status==1)?"<span style='color: green'>PASS</span>":"<span style='color:coral'>Pending</span>"

                $("#listTasks").append(
                    "<tr>"
                    + "<td>" + i + "</td>"
                    + "<td>" + data[i].task_name + "</td>"
                    + "<td>" + status + "</td>"
                    + "<td>" + data[i].task_data + "</td>"
                    + "<td>" + data[i].task_output + "</td>"
                    + "<td>" + data[i].task_begin_time + "</td>"
                    + "<td>" + data[i].task_end_time + "</td>"
                    + "<td>" + data[i].task_host_ip + "</td>"
                    + "</tr>"
                );


            }

        }
    })


</script>



</body>
</html>