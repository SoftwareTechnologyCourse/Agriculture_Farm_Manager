var n=document.getElementById&&!document.all;

function go()
{
im = document.getElementById('limg');
im.src="gd/graph.php?xx="+le.xx.value+"&yy="+le.yy.value+"&ec1="+le.mess.value+"&ec2="+le.mess2.value+"&ec3="+le.mess3.value;
}

function ds_getel(id) {
	return document.getElementById(id);
}

// Get the left and the top of the element.
function ds_getleft(el) {
	var tmp = el.offsetLeft;
	el = el.offsetParent
	while(el) {
		tmp += el.offsetLeft;
		el = el.offsetParent;
	}
	return tmp;
}
function ds_gettop(el) {
	var tmp = el.offsetTop;
	el = el.offsetParent
	while(el) {
		tmp += el.offsetTop;
		el = el.offsetParent;
	}
	return tmp;
}

function ds_ob_clean() {
	ds_ob = '';
}
function ds_ob_flush() {
	ds_oe.innerHTML = ds_ob;
	ds_ob_clean();
}
function ds_echo(t) {
	ds_ob += t;
}

// Calendar template
function ds_template_main_above(t,tt) {

	return '<table cellpadding="3" cellspacing="1" class="ds_tbl">'
	     + '<tr>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_py();">&lt;&lt;</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_pm();">&lt;</td>'
		 + '<td colspan="3" class="ds_head">' + t+'<br/>'+tt+ '</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_nm();">&gt;</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_ny();">&gt;&gt;</td>'
		 + '</tr>'
		 + '<tr>';
}

function ds_template_day_row(t) {
	return '<td class="ds_subhead">' + t + '</td>';
}

function ds_template_new_week() {
	return '</tr><tr>';
}

function ds_template_blank_cell(colspan) {
	return '<td colspan="' + colspan + '"></td>'
}

function ds_template_day(d, m, y, we) {
if(we) infsup="style=\"background-color: #DDB\";";else infsup="";
if((d==1&&m==1)||(d==16&&m==4)||(d==1&&m==5)||(d==24&&m==5)||(d==4&&m==6)||(d==14&&m==7)||(d==15&&m==8)||(d==1&&m==11)||(d==11&&m==11)||(d==25&&m==12))
infsup="style=\"background-color: #777;color:fff\";"
if(d==joua&&m==moia) infsup="style=\"background-color: #eaa\";"
	return '<td class="ds_cell" '+infsup+' onclick="ds_onclick(' + d + ',' + m + ',' + y + ')">' + d + '</td>';
}

function ds_template_main_below() {
	return '</tr>'
	     + '</table>';
}


function ds_draw_calendar(m, y) {
	ds_ob_clean();
	ds_echo (ds_template_main_above(ds_monthnames[m - 1] , y));
	for (i = 0; i < 7; i ++) {
		ds_echo (ds_template_day_row(ds_daynames[i]));
	}
	var ds_dc_date = new Date();
	ds_dc_date.setMonth(m - 1);
	ds_dc_date.setFullYear(y);
	ds_dc_date.setDate(1);
	if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
		days = 31;
	} else if (m == 4 || m == 6 || m == 9 || m == 11) {
		days = 30;
	} else {
		days = (y % 4 == 0) ? 29 : 28;
	}
	var first_day = ds_dc_date.getDay();
	if (first_day==0) first_day=7;

	// Start the first week
	ds_echo (ds_template_new_week());
		var j = first_day;
		if(j!=1)ds_echo (ds_template_blank_cell(j-1));
		j-=1;
		for (i = 0; i < days; i ++) {
			if(j==5||j==6) we=1;else we=0
		
			ds_echo (ds_template_day(i + 1, m, y,we));
		
			if (j == 6) ds_echo (ds_template_new_week());

			j ++;
			j %= 7;
		}

	// Do the footer
	ds_echo (ds_template_main_below());
	// And let's display..
	ds_ob_flush();
	// Scroll it into view.
	ds_ce.scrollIntoView();
}


function ds_sh(t) {
	ds_element = t;
	var ds_sh_date = new Date();
	ds_c_month = ds_sh_date.getMonth() + 1;
	ds_c_year = ds_sh_date.getFullYear();
	ds_draw_calendar(ds_c_month, ds_c_year);
	ds_ce.style.display = '';
	the_left = ds_getleft(t)-24;
	the_top = ds_gettop(t) + t.offsetHeight;
	ds_ce.style.left = the_left + 'px';
	ds_ce.style.top = the_top + 'px';
	ds_ce.scrollIntoView();
}

function ds_hi() {
	ds_ce.style.display = 'none';
}


function ds_nm() {
	ds_c_month ++;
	if (ds_c_month > 12) {
		ds_c_month = 1; 
		ds_c_year++;
	}
	ds_draw_calendar(ds_c_month, ds_c_year);
}

function ds_pm() {
	ds_c_month = ds_c_month - 1; // Can't use dash-dash here, it will make the page invalid.
	if (ds_c_month < 1) {
		ds_c_month = 12; 
		ds_c_year = ds_c_year - 1; // Can't use dash-dash here, it will make the page invalid.
	}
	ds_draw_calendar(ds_c_month, ds_c_year);
}
function ds_ny() {
	ds_c_year++;
	ds_draw_calendar(ds_c_month, ds_c_year);
}


function ds_py() {
	ds_c_year = ds_c_year - 1; 
	ds_draw_calendar(ds_c_month, ds_c_year);
}


function ds_format_date(d, m, y) {
	m2 = '00' + m;
	m2 = m2.substr(m2.length - 2);
	d2 = '00' + d;
	d2 = d2.substr(d2.length - 2);
	return d2 + '-' + m2 + '-' + y;
}

function ds_onclick(d, m, y) {
	ds_hi();
	if (typeof(ds_element.value) != 'undefined') {
		ds_element.value = ds_format_date(d, m, y);
	} else if (typeof(ds_element.innerHTML) != 'undefined') {
		ds_element.innerHTML = ds_format_date(d, m, y);
		} else {
		alert (ds_format_date(d, m, y));
	}
}

function selectmouse(e) 
{
  var fobj       = n ? e.target : event.srcElement;
  atouc=fobj.className;
  if(fobj.nodeName=="INPUT") return;
  if(!(atouc.indexOf("ds_")==0)) ds_hi();
}


var ds_monthnames = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];
var ds_daynames = ['Lun', 'Mar', 'Me', 'Jeu', 'Ven', 'Sam','Dim'];
var ds_ob = ''; 

