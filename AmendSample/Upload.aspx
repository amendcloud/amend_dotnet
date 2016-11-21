<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Async="true" Inherits="AmendSample.Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Image</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <style>
        .check {
            background: url(Images/ic_check.png);
            display: inline-block;
            height: 24px;
            width: 24px;
            cursor: pointer;
        }

            .check:hover {
                background: url(Images/checked-hover.png);
                display: inline-block;
                height: 24px;
                width: 24px;
                cursor: pointer;
            }

        .active {
            background: url(Images/checked-hover.png);
            display: inline-block;
            height: 24px;
            width: 24px;
            cursor: pointer;
        }

        .caption {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.check').click(function () {
                $('.check').removeClass('active');
                $(this).addClass('active');
                $('#hfImgId').val($(this).parent().parent().find('img').attr('id'));
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top" style="min-height: 62px !important">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="Images/amend-logo.png" style="margin-top: -30px; height: 90px; padding: 5px" />
                    </a>
                </div>
            </div>
        </nav>
        <div class="jumbotron">
            <div class="container">
                <h3>Please choose any one option for image processing : </h3>
                <div class="row">
                    <div class="col-md-4">
                        <h3>Upload Your Image</h3>
                        <div class="form-group">
                            <label for="exampleInputFile"></label>
                            <asp:FileUpload ID="fileUpload" runat="server" />
                            <%--<input type="file" id="exampleInputFile">--%>
                        </div>
                        <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" CssClass="btn btn-primary" />
                    </div>
                    <div class="col-md-4">
                        <h3>Fetch Image From Url</h3>
                        <div class="form-group">
                            <label for="url">Image Url</label>
                            <asp:TextBox TextMode="Url" runat="server" CssClass="form-control" ID="txtUrl" />
                        </div>
                        <asp:Button ID="btnUploadUrl" runat="server" Text="Upload" OnClick="btnUploadUrl_Click" CssClass="btn btn-primary" />
                    </div>
                    <div class="col-md-4">
                        <h3>Choose Image</h3>
                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="Images/sample-image1.jpg" runat="server" id="sample1" alt="" />
                                    <div class="caption">
                                        <a class="check"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="Images/sample-image2.jpg" runat="server" id="sample2" alt="" />
                                    <div class="caption">
                                        <a class="check"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="Images/sample-image3.jpg" runat="server" id="sample3" alt="" />
                                    <div class="caption">
                                        <a class="check"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:HiddenField runat="server" ID="hfImgId" />
                        <asp:Button ID="btnUploadChoose" runat="server" Text="Upload" OnClick="btnUploadChoose_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
