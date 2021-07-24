<%-- 
    Document   : upload
    Created on : Mar 19, 2021, 7:39:19 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<form method="POST" name="fileinfo" enctype="multipart/form-data" id="fileUploadForm">
    <div class="form-group">
        <label>Cover image</label>
        <div class="form-group">
            <input class="form-control" type="file" name="file" id="file" />
        </div>
    </div>
</form>
<div class="form-group has-success">
    <input type="text" class="form-control" id="imagecover" name="imagecover" disabled>
</div>


<script>
    $(document).ready(function () {
        $("input[name='file']").change(function () {
            //stop submit the form, we will post it manually.
            event.preventDefault();
            // Get form
            var form = $('#fileUploadForm')[0];
            // Create an FormData object 
            var data = new FormData(form);
            // disabled the submit button
            $("#btnSubmit").prop("disabled", true);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/UploadServlet",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    $("#imagecover").text(data);
                    console.log("SUCCESS : ", data);
                    $("#btnSubmit").prop("disabled", false);
                    document.getElementById('imagecover').value = data;
                },
                error: function (e) {
                    $("#imagecover").text(e.responseText);
                    console.log("ERROR : ", e);
                    $("#btnSubmit").prop("disabled", false);
                }
            });
        });
    });
</script>
