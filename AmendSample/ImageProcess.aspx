<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageProcess.aspx.cs" Inherits="AmendSample.ImageProcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Amend Options</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <style>
        .radio {
            display: inline-block;
            width: 10%;
        }
    </style>
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

        <div class="container" style="margin-top: 62px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-2">
                            <h2 class="page-header">Transform</h2>
                            <div class="form-group">
                                <label>Height</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtHeight"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Width</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtWidth"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Fit</label>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddFit">
                                    <asp:ListItem Value="0">Fit Option</asp:ListItem>
                                    <asp:ListItem Value="1">Fit XY</asp:ListItem>
                                    <asp:ListItem Value="2">Fit Width</asp:ListItem>
                                    <asp:ListItem Value="3">Fit Height</asp:ListItem>
                                    <asp:ListItem Value="4">Fit Fill</asp:ListItem>
                                    <asp:ListItem Value="5">Fit Inside</asp:ListItem>
                                    <asp:ListItem Value="6">Fit Face</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Align</label>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddAlign">
                                    <asp:ListItem Value="0">Align Option</asp:ListItem>
                                    <asp:ListItem Value="1">Align Left</asp:ListItem>
                                    <asp:ListItem Value="2">Align Right</asp:ListItem>
                                    <asp:ListItem Value="3">Align Center</asp:ListItem>
                                    <asp:ListItem Value="4">Align Top</asp:ListItem>
                                    <asp:ListItem Value="5">Align Bottom</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddListColor">
                                    <asp:ListItem Value="0">Select Color</asp:ListItem>
                                    <asp:ListItem Value="1">Red</asp:ListItem>
                                    <asp:ListItem Value="2">Violet</asp:ListItem>
                                    <asp:ListItem Value="3">Blue</asp:ListItem>
                                    <asp:ListItem Value="4">Green</asp:ListItem>
                                    <asp:ListItem Value="5">Yellow</asp:ListItem>
                                    <asp:ListItem Value="6">Sepia</asp:ListItem>
                                    <asp:ListItem Value="7">Aqua</asp:ListItem>
                                    <asp:ListItem Value="8">Gray</asp:ListItem>
                                    <asp:ListItem Value="9">White</asp:ListItem>
                                    <asp:ListItem Value="10">Azure</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Origin X</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtOriginX"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Origin Y</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtOriginY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <h2 class="page-header">Effects</h2>
                            <div class="form-group">
                                <label>Brightness</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtBright"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Contrast</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtContrast"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <h2 class="page-header">Overlay</h2>
                            <div class="form-group">
                                <label>Overlay Image</label>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtOverlayImage"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label style="width: 100%;">Desired Text</label>
                                <asp:TextBox runat="server" ID="txtOverlayText" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Position(X-Coordinate)</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtOverlayPosX"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Position(Y-Coordinate)</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtOverlayPosY"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Font Size</label>
                                <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtTextSize"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Text Color</label>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddTextColor">
                                    <asp:ListItem Value="0">Select Color</asp:ListItem>
                                    <asp:ListItem Value="1">Red</asp:ListItem>
                                    <asp:ListItem Value="2">Violet</asp:ListItem>
                                    <asp:ListItem Value="3">Blue</asp:ListItem>
                                    <asp:ListItem Value="4">Green</asp:ListItem>
                                    <asp:ListItem Value="5">Yellow</asp:ListItem>
                                    <asp:ListItem Value="6">Sepia</asp:ListItem>
                                    <asp:ListItem Value="7">Aqua</asp:ListItem>
                                    <asp:ListItem Value="8">Gray</asp:ListItem>
                                    <asp:ListItem Value="9">White</asp:ListItem>
                                    <asp:ListItem Value="10">Azure</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label style="width: 100%;">Font Style</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkBold" value="" />Bold</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkItalic" value="" />Italic</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <h2 class="page-header">Flip</h2>
                            <div class="form-group">
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkFlipX" value="" />Flip X</label>
                            </div>
                            <div class="form-group">
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkFlipY" value="" />Flip Y</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <h2 class="page-header">Extras</h2>
                            <div class="form-group">
                                <label>Radius(use 'Max' for max radius)</label>
                                <asp:TextBox ID="txtRadius" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Quality(Max :100, Min : 0)</label>
                                <asp:TextBox ID="txtQuality" TextMode="Number" runat="server" CssClass="form-control" max="100"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Rotate</label>
                                <asp:TextBox ID="txtAngle" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label style="width: 100%;"></label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkInvert" value="" />Invert</label>
                            </div>
                            <div class="form-group">
                                <label style="width: 100%;"></label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkGrayScale" value="" />Gray Scale</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <asp:Button CssClass="btn btn-primary" Style="width: 50%" Text="Get Image" ID="btnGet" runat="server" OnClick="btnGet_Click" />
                    </div>
                </div>
                <div class="row" style="margin-left:20px">
                    <h2 class="page-header">Image Preview</h2>
                    <div class="col-xs-12 col-md-12">
                        <a href="#" class="thumbnail">
                            <asp:Image ID="Image1" runat="server" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
