<%@ Page Title="" Language="C#" MasterPageFile="~/master2.master" AutoEventWireup="true" CodeFile="LooksNice.aspx.cs" Inherits="LooksNice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="jquery.peelback.js" type="text/javascript"></script>

<script type = "text/javascript">
    $(document).ready(function () {

        $('#test').peelback({
            adImage     : 'Images/car185.png',
            peelImage   : 'Images/peel-image.png',
            clickURL    : 'http://www.google.com/',
            smallSize   : 70,
            bigSize     : 185
        });

        $("#nav > li a").hover(function (e) {
            $this = $(this)
            $this.stop().animate({
                paddingLeft: '45px'
            }, { queue: false, duration: 300 });
        }, function () {
            $this = $(this)
            $this.animate({
                paddingLeft: '12px'
            }, { queue: false, duration: 300 });
        }).click(function () {
        });

    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id = "divHeader" class= "header">
    <span id = "spanMenu" class = "menu">
        This is my span
    </span>
</div>

<div id="leftcontent" style="position:relative; background-color:Yellow;";>
    <ul id="nav" style="position:absolute">
	    <li><a href="jqSimple.aspx">Jquery examples</a></li>
	    <li><a href="#">Link #2</a></li>
	    <li><a href="#">Link #3</a></li>
	    <li><a href="#">Link #4</a></li>
        <li><a href="#">Link #5</a></li>
    </ul>
</div>

<div id="centercontent">
    <div style="position:relative";>
        <div id= "test" style="display:block; height:180px; background-color:Blue;">
        </div>
    </div>
</div>

<div id="rightcontent">
</div>
</asp:Content>

