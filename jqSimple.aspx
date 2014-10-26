<%@ Page Title="" Language="C#" MasterPageFile="~/master1.master" AutoEventWireup="true" CodeFile="jqSimple.aspx.cs" Inherits="jqExamples" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<link rel="stylesheet" type="text/css" href="screen.css" media="all" />
<script src="execute.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function () {

        //slide panel
        $('.btn-slide').click(function () {
            $('#panel').slideToggle('slow');
        });
        $('.btn-slide').hover(function () {
            $(this).css({ 'background-color': 'black', 'color': 'red' });
        }, function () {
            $(this).css({ 'background-color': 'red', 'color': 'black' });
        });

        //sliding div up...slide(up or down)/fade(in or out)/show or hide
        $('#div1').click(function () {
            $(this).slideUp('slow');
        });

        //animate div...can use many properties
        $('#div2').click(function () {

            $(this).animate({
                'left': '+=200px'
            }, 1000);
        });

        //toggle class
        $('#toggleit').click(function () {
            $('#div3').toggleClass('toggle');
        });

        //add and remove list items
        var i = $('#u1 li').size() + 1;
        $('a#add').click(function () {
            if ($('#u1').has('li').length != 0) {
                $('<li> Item ' + i + '</li>').appendTo($('#u1'));
                i++;
            }
            else {
                i = 1;
                $('<li> Item ' + i + '</li>').appendTo($('#u1'));
                i++;
                $('#spanL').html('');
            }
            return false;
        });
        $('a#remove').click(function () {
            $('#u1 li:last').remove();
            if ($('#u1').has('li').length == 0) {
                $('#spanL').html('Empty List');
            }
            else {
                $('#spanL').html('');
                i--;
            }
            return false;
        });

        //Show Large pic on hover
        $('#container5 img').hover(function (e) {
            //mouseEnter
            var src = $(this).attr('id');
            $('<img id="largeImage" src="' + src + '"alt="img" />')
            .css('top', e.pageY - 200).css('left', e.pageX + 20)
            .appendTo('#container5');
        }, function () {
            //mouseExit
            $('#largeImage').remove();
        });

        $('#container5 img').mousemove(function (e) {
            $('#largeImage').css('top', e.pageY - 200).css('left', e.pageX + 20);
        });

        //links to make text larger or smaller
        $('#divp a').click(function () {
            var os = $('#p1').css('font-size');
            var num = parseFloat(os);
            var uom = os.slice(-2);
            $('#p1').css('font-size', num / 1.4 + uom);
            if (this.id == 'larger') {
                $('#p1').css('font-size', num * 1.4 + uom);
            }
            return false;
        });

        //hover effect
        $('#container2 div').animate({ 'opacity': .5 });

        $('#container2 div').hover(function () {
            $(this).stop().animate({ 'opacity': 1 });
        }, function () {
            $(this).stop().animate({ 'opacity': .5 });
        });

        //picture slide down to show a picture behind effect
        $('#pic1').hover(function () {
            $(this).children('#front').stop().animate({
                'top': '260px'
            }, 700);
        }, function () {
            $(this).children('#front').stop().animate({
                'top': '0'
            }, 400);
        });

        //ajax: load 
        $('#aGames').click(function () {
            $('<div id="info" />').load('gameList.aspx #ulGames', function () {
                $(this).hide().appendTo('#container4').slideDown(1000);
                $('#aGames').hide();
            });
            return false;
        });

        //tooltips
        $('#container6 img').mousemove(function (e) {
            $('#1').data('description', 'apple made white cars cool!');
            $('#2').data('description', 'charger what? Oh, cool sky.');
            $('#3').data('description', 'cool car, never heard of it.');
            $('#pToolTip').text($(this).data('description'));
            $('#pToolTip').css({ left: e.pageX + 5, top: e.pageY + 5, display: 'block' });
        });
        $('#container6 img').mouseout(function () {
            $('#pToolTip').css({ display: 'none' });
        });

        //moves list items out when you hover over them
        $("#nav > li a").hover(function (e) {
            $this = $(this)
            $this.stop().animate({
                paddingLeft: '44px'
            }, { queue: false, duration: 300 });
        }, function () {
            $this = $(this)
            $this.animate({
                paddingLeft: '12px'
            }, { queue: false, duration: 300 });
        }).click(function () {
            return false;
        });

    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="panel">
    <p>Welcome to my site...I'm learning jQuery!</p>
</div>
<p class="slide">
    <a href="#" class="btn-slide">Slide Panel</a>
</p>

<div id="container">
    <div id="div1"></div>
    <div id="div2"></div>
    <div id="div3"><a href="#" id="toggleit">Click Me!</a></div>
</div><br /><br />

<h4>Click below to Add or Remove Items from the list</h4>
<ul id="u1">
    <li>Item 1</li>
</ul><span id="spanL"></span><br /><br />
<a href="#" id="add">Add List Item</a><br />
<a href="#" id="remove">Remove List Item</a><br /><br />

<div id="container5">
    <img id="Images/computer1.jpg" src="Images/computer1tn.jpg" alt="img"/>
    <img id="Images/computer2.jpg" src="Images/computer2tn.jpg" alt="img"/>
    <img id="Images/computer3.jpg" src="Images/computer3tn.jpg" alt="img"/>
</div>

<div id="divp">
<a href="#" id="larger">Larger Text</a>
<a href="#" id="smaller">Smaller Text</a>
<br />

<p id="p1">
Degressus Appennino Hannibal ad Placentiam castra movit et decem 
milia passuum progressus consedit. Postero die duodecim milia peditum, 
quinque equitum contra hostem ducit; nec Sempronius consul fugit proelium. 
Atque eo die tria milia passuum inter duo castra fuerunt; postero die magnis 
animis pugnaverunt. Primo vis Romanorum ita superior fuit ut non solum 
vincerent, sed pulsos hostes in castra sequerentur et castra oppugnarent. 
Iam nona diei hora erat, cum Romanus dux, cum nulla spes esset capiendorum 
castrorum, militibus imperavit ut omnino se reciperent. Hoc ubi Hannibal 
accepit, extemplo, equitibus emissis, in hostem ipse cum peditibus e mediis 
castris erupit. Acriter pugnatum est, sed nox proelium diremit. Ab utraque 
parte sescenti pedites et trecenti equites ceciderunt; sed maior Romanis 
iactura fuit, quod equestris ordinis tot viri et tribuni militum quinque et 
praefecti sociorum tres sunt interfecti.
</p>
</div>

<div id="container3">
    <div id="pic1">        
        <img id="back" class="img" src="Images/ylBack.png" alt="image"/>
        <img id="front" class="img" src="Images/youngLink.png" alt="image"/>
    </div>
</div><br /> 

<div id="container2">
    <div id="div4"></div>
    <div id="div5"></div>
    <div id="div6"></div>
    <div id="div7"></div>
    <div id="div8"></div>
</div><br /><br /><br />

<div id="container4">
    <h1>My Favorite Games</h1>
</div>
<a href="#" id="aGames">Load Games</a><br /><br />

<div id="container6">
    <span class="spacer"><img id="1" src="Images/car1.jpg" alt="img"/>                            </span>
    <span class="spacer"><img id="2" src="Images/car2.jpg" alt="img"/>                            </span>
    <img id="3" src="Images/car3.jpg" alt="img"/>
    <p id="pToolTip">this is tooltip</p>
</div>

<ul id="nav">
	<li><a href="#">Link #1</a></li>
	<li><a href="#">Link #2</a></li>
	<li><a href="#">Link #3</a></li>
	<li><a href="#">Link #4</a></li>
	<li><a href="#">Link #5</a></li>
	<li><a href="#">Link #6</a></li>
	<li><a href="#">Link #7</a></li>
	<li><a href="#">Link #8</a></li>
	<li><a href="#">Link #9</a></li>
	<li><a href="#">Link #10</a></li>
</ul>

<div id="content">
	<h1>Reflection</h1>
	<ul id="nav-reflection">
		<li class="button-color-1"><a href="#" title="My fancy link">Link Text</a></li>
		<li class="button-color-2"><a href="#" title="My fancy link">Link Text</a></li>
		<li class="button-color-3"><a href="#" title="My fancy link">Link Text</a></li>
		<li class="button-color-4"><a href="#" title="My fancy link">Link Text</a></li>
	</ul>
	<h1>Shadow</h1>
	<ul id="nav-shadow">
		<li class="button-color-1"><a href="#" title="My fancy link">Link Text</a></li>
		<li class="button-color-2"><a href="#" title="My fancy link">Link Text</a></li>
		<li class="button-color-3"><a href="#" title="My fancy link">Link Text</a></li>
		<li class="button-color-4"><a href="#" title="My fancy link">Link Text</a></li>
	</ul>
</div>

</asp:Content>

