<%@ Page Title="" Language="C#" MasterPageFile="~/master1.master" AutoEventWireup="true" CodeFile="jqAjax.aspx.cs" Inherits="jqAjax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">

    $(document).ready(function () {
        $('#btnFirstTry').click(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "WebService.asmx/HelloWorld",
                data: "{}",
                dataType: "json",
                success: function (msg) {
                    $('#divMessage').html(msg.d);
                }
            });
        });
    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:Button ID="btnFirstTry" runat="server" Text="Hello" ClientIDMode="Static" OnClientClick="return false"/>
<div id="divMessage" runat="server" ClientIDMode="Static"></div>

</asp:Content>

