var calendarElement, calendarDestruct = false, preventDouble = true;
	document.onclick = function(e){
		var source=window.event?window.event.srcElement:e.target;
		if(!source.calendrier && calendarDestruct && preventDouble){
			calendarDestruct = false;
			calendarElement.calendarActive = false;
			while (document.getElementById('Calendrier').childNodes.length>0) {
				document.getElementById('Calendrier').removeChild(document.getElementById('Calendrier').firstChild);
			}
			document.body.removeChild(document.getElementById('Calendrier'));
		}
		else if(!preventDouble){preventDouble = true}
	}
	function calendar(element){
		var regTest = /Debut|Fin$/;
		if(regTest.test(element.id)){
			this.allowFullMonth = true;
			this.destinations = [element.id.replace(regTest, 'Debut'), element.id.replace(regTest, 'Fin')];
		}
		if(document.getElementById('Calendrier') && element != calendarElement){
			while (document.getElementById('Calendrier').childNodes.length>0) {
				document.getElementById('Calendrier').removeChild(document.getElementById('Calendrier').firstChild);
			}
			document.body.removeChild(document.getElementById('Calendrier'));
			calendarElement.calendarActive = false;
			preventDouble = false;
		}
		else{preventDouble = true;}
		calendarElement = element;
		if(!element.calendarActive){
		this.monthCurrent = null;
		this.yearCurrent = null;
		this.dayCurrent = null;
		this.dateCurrent = null;
		this.timer = null;
		this.calendar = null;
		
		this.bugFrame = null;
		this.contentMonth = null;
		this.currMonth = null;
		this.pMonth = null;
		this.MonthLeft = null;
		this.MonthRight = null;
		
		this.contentYear = null;
		this.pYear = null;
		this.YearTop = null;
		this.YearBottom = null;
		
		this.contentNameDay = null;
		
		this.contentListDay = null;
		
		this.from = null;
		this.to = null;
		
		this.opacite = 0 ;
		this.direction = null;
		this.inMove = false;
		this.elementToSlide = new Array();
		this.currentIndex = 0;
		this.timePause = 0 ; 
		this.auto = false ; 
	
	
		this.element = (element) ? element: null;
		element.calendarActive = true;
	
		this.monthListName = new Array('Janvier', 'F�vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao�t', 'Septembre', 'Octobre', 'Novembre', 'D�cembre');
		this.dayListName = new Array('Lu','Ma','Me','Je','Ve','Sa','Di');
		this.dayFullName = new Array('Lun','Mar','Mer','Jeu','Ven','Sam','Dim');
			
		this.IsIE=!!document.all;
		
		this.init();
		}
	}
	
	calendar.prototype.init = function (){
		var me = this;
	
		this.calendar = this.newElement({"typeElement":"div","classeCss":"calendar","parent":null});
		this.calendar.id = 'Calendrier';
	     if(this.IsIE)
	      {
	        this.calendar.style.filter='alpha(opacity=0)';
	        this.calendar.filters[0].opacity=0;
	      }
	      else
	      {
	        this.calendar.style.opacity='0';
	      }
		this.bugFrame = this.newElement({"typeElement":"iframe","classeCss":"bugFrame","parent":this.calendar});

		var temp = this.newElement({"typeElement":"div","classeCss":"bugFrame","parent":this.calendar});
		

		this.contentDay = this.newElement({"typeElement":"div","classeCss":"contentDay","parent":this.calendar});
		this.contentMonth = this.newElement({"typeElement":"div","classeCss":"contentMonth","parent":this.calendar});
		this.currMonth = this.newElement({"typeElement":"div","classeCss":"currMonth","parent":this.contentMonth});
		this.pMonth = this.newElement({"typeElement":"span","classeCss":"pMonth","parent":this.currMonth});
		this.contentYear = this.newElement({"typeElement":"div","classeCss":"contentYear","parent":this.calendar});
		this.pYear = this.newElement({"typeElement":"span","classeCss":"pYear","parent":this.contentYear});
		this.contentNameDay = this.newElement({"typeElement":"ul","classeCss":"contentNameDay","parent":this.calendar});
		this.contentListDay = this.newElement({"typeElement":"div","classeCss":"contentListDay","parent":this.calendar});
		
		
		this.MonthLeft = this.newElement({"typeElement":"div","classeCss":"MonthLeft","parent":this.contentMonth});
		this.MonthRight = this.newElement({"typeElement":"div","classeCss":"MonthRight","parent":this.contentMonth});
	
		this.MonthLeft.onclick = function(){me.updateMonthBefNexCur("before");me.SlideToRight();return false};
		this.MonthRight.onclick = function(){me.updateMonthBefNexCur("next");me.SlideToLeft();return false};
		if(this.allowFullMonth){
			this.currMonth.style.cursor = 'pointer';
			this.currMonth.onclick = function(){
				document.getElementById(me.destinations[0]).value = "1/"+ ((me.monthCurrent+1 == 13) ? 1:me.monthCurrent+1)+"/"+me.yearCurrent;
				document.getElementById(me.destinations[1]).value = me.day_number[me.monthCurrent]+ '/' + ((me.monthCurrent+1 == 13) ? 1:me.monthCurrent+1)+"/"+me.yearCurrent;
				calendarDestruct = false;
				calendarElement.calendarActive = false;
				while (document.getElementById('Calendrier').childNodes.length>0) {
					document.getElementById('Calendrier').removeChild(document.getElementById('Calendrier').firstChild);
				}
				document.body.removeChild(document.getElementById('Calendrier'));
			}
		}
		
		this.YearTop = this.newElement({"typeElement":"div","classeCss":"YearTop","parent":this.contentYear});
		this.YearBottom = this.newElement({"typeElement":"div","classeCss":"YearBottom","parent":this.contentYear});
		
		this.YearTop.onclick = function(){me.updateYearBefNexCur("next");me.SlideToTop();return false};
		this.YearBottom.onclick = function(){me.updateYearBefNexCur("before");me.SlideToBottom();return false};
		if(this.allowFullMonth){
			this.pYear.style.cursor = 'pointer';
			this.pYear.onclick = function(){
				document.getElementById(me.destinations[0]).value = "1/1/"+me.yearCurrent;
				document.getElementById(me.destinations[1]).value = "31/12/"+me.yearCurrent;
				calendarDestruct = false;
				calendarElement.calendarActive = false;
				while (document.getElementById('Calendrier').childNodes.length>0) {
					document.getElementById('Calendrier').removeChild(document.getElementById('Calendrier').firstChild);
				}
				document.body.removeChild(document.getElementById('Calendrier'));
			}
		}
		
		
		this.MonthLeft.onmouseover = function(){this.className = "MonthLeftOver"};
		this.MonthLeft.onmouseout = function(){this.className = "MonthLeft"};
		this.MonthLeft.onmousedown = function(){this.className = "MonthLeftClick"};
		this.MonthLeft.onmouseup = function(){this.className = "MonthLeftOver"};
		
		this.MonthRight.onmouseover = function(){this.className = "MonthRightOver"};
		this.MonthRight.onmouseout = function(){this.className = "MonthRight"};
		this.MonthRight.onmousedown = function(){this.className = "MonthRightClick"};
		this.MonthRight.onmouseup = function(){this.className = "MonthRightOver"};
		
		this.YearTop.onmouseover = function(){this.className = "YearTopOver"};
		this.YearTop.onmouseout = function(){this.className = "YearTop"};
		this.YearTop.onmousedown = function(){this.className = "YearTopClick"};
		this.YearTop.onmouseup = function(){this.className = "YearTopOver"};
		
		this.YearBottom.onmouseover = function(){this.className = "YearBottomOver"};
		this.YearBottom.onmouseout = function(){this.className = "YearBottom"};
		this.YearBottom.onmousedown = function(){this.className = "YearBottomClick"};
		this.YearBottom.onmouseup = function(){this.className = "YearBottomOver"};
		
		if(this.element != null && this.element.value != ""){
			var reg=new RegExp("/", "g");
			var dateOfField = this.element.value;
			var dateExplode = dateOfField.split(reg);
			this.dateCurrent = this.getDateCurrent(dateExplode[0], dateExplode[1] - 1,dateExplode[2]);
		}
		else{
			this.dateCurrent = this.getDateCurrent();
		}
		
		this.monthCurrent = this.dateCurrent.getMonth();
		this.yearCurrent = this.dateCurrent.getFullYear();
		this.dayCurrent = this.dateCurrent.getDate();
		
		this.from = this.createContentDay(0,"left");
		this.createMonth({"CurrentDay":this.dayCurrent,"CurrentMonth":this.monthCurrent,"CurrentYear":this.yearCurrent,"conteneur":this.from});
		this.to = this.createContentDay(parseInt(this.calendar.offsetWidth),"left");
		this.createMonth({"CurrentDay":this.dayCurrent,"CurrentMonth":this.monthCurrent,"CurrentYear":this.yearCurrent,"conteneur":this.to});
		
		this.AddElements(Array(this.from,this.to));
		
		this.createHeader();
		this.updateDateHeader();
		
		this.getPosition();
		
		this.fadePic(0,true);
	}
	
	calendar.prototype.getDateCurrent = function (day,month,year){
			
			if(year == null || month == null){
				return (new Date());
			}
			
			else{
				return (new Date(year, month , day));
			}
	}
	
	calendar.prototype.newElement = function (parameter){
		var typeElement = parameter['typeElement'];
		var classToAffect = parameter['classeCss'];
		var parent = parameter['parent'];
		
		var newElement = document.createElement(typeElement);
		newElement.className = classToAffect;
		newElement.calendrier = true;
		if(parent == null){
			document.body.appendChild(newElement);
		}
		else{
			parent.appendChild(newElement);
		}
		return newElement;
	}

	calendar.prototype.createMonth = function(parameter){
		var CurrentDay = parameter["CurrentDay"];
		var CurrentMonth = parameter["CurrentMonth"];
		var CurrentYear = parameter["CurrentYear"];
		var conteneur = parameter["conteneur"];
		
		while (conteneur.childNodes.length>0) {
			conteneur.removeChild(conteneur.firstChild);
		}
		
		var dateCurrent = this.getDateCurrent(CurrentDay,CurrentMonth,CurrentYear);
		
		var monthCurrent = dateCurrent.getMonth()
		
		var yearCurrent = dateCurrent.getFullYear();
		
		var dayCurrent = dateCurrent.getDate();
		
		var dateTemp = new Date(yearCurrent, monthCurrent,1);
		
		this.current_day_since_start_week = (( dateTemp.getDay()== 0 ) ? 6 : dateTemp.getDay() - 1);
		
		var nbJoursfevrier = (yearCurrent % 4) == 0 ? 29 : 28;
		this.day_number = new Array(31,nbJoursfevrier,31,30,31,30,31,31,30,31,30,31);
		
		
		var dayBeforeMonth = ((this.day_number[((monthCurrent == 0) ? 11:monthCurrent-1)]) - this.current_day_since_start_week)+1;
	
		for(i  = dayBeforeMonth ; i <= (this.day_number[((monthCurrent == 0) ? 11:monthCurrent-1)]) ; i ++){
			
			this.createDayInContent(i,false,false,conteneur);
		}
		
		for(var nbjours = 0 ; nbjours < (this.day_number[monthCurrent] + this.current_day_since_start_week) ; nbjours++){
			if(nbjours < this.day_number[monthCurrent]){
				if(dayCurrent == (nbjours+1)){
					this.createDayInContent(nbjours+1,true,true,conteneur);
				}
				else{
					this.createDayInContent(nbjours+1,false,true,conteneur);
				}
			}
		}
		
		var nbCelRest = 42 - (this.day_number[monthCurrent]+this.current_day_since_start_week);
		
		for(i  = 0 ; i <  nbCelRest ; i ++){
			
			this.createDayInContent(i+1,false,false,conteneur);
		}

	}
	
	calendar.prototype.createDayInContent = function (dateDay,CurrentDay,active,conteneur){
		var me = this;
		var liDay = document.createElement("li");
		liDay.calendrier = true;
		var TextContent = document.createTextNode(dateDay);
		liDay.className = (CurrentDay) ? "dayCurrent":"liOut";
		liDay.className = (!active) ? "liInactive":liDay.className;
		liDay.appendChild(TextContent);
		if(active){
			liDay.onmouseover = function(){this.className = (this.className == "dayCurrent") ? this.className : "liHover";};
			liDay.onmouseout = function(){this.className = (this.className == "dayCurrent") ? this.className : "liOut";};
			liDay.onclick = function(){me.dayCurrent = this.innerHTML ; me.fillField()};
		}
	
		conteneur.appendChild(liDay);
	}
	
	calendar.prototype.createContentDay = function (positionTo,position){
		var ulDays = document.createElement("ul");
		ulDays.calendrier = true;
		ulDays.className = "dayCal";
		
		if(position != "top"){
			if(positionTo != null){ulDays.style.left = positionTo + "px";}
			ulDays.style.top = 0 + "px";
		}
		else{
			if(positionTo != null){ulDays.style.top = positionTo + "px";}
			ulDays.style.left = 0 + "px";
		}
		this.contentListDay.appendChild(ulDays);
		return ulDays;
	}
	
	calendar.prototype.createCalendar = function (){
		
		var divContent = document.createElement("div");
		divContent.calendrier = true;
		divContent.className = "calendrier";
		document.body.appendChild(divContent);
		return divContent;
	}
	
	calendar.prototype.createHeader = function(){

		
		for(var i = 0 , l = this.dayListName.length ; i < l ; i++){
			var liDayTemp = document.createElement("li");
			liDayTemp.calendrier = true;
			TextContent = document.createTextNode(this.dayListName[i]);
			liDayTemp.appendChild(TextContent);
			
			this.contentNameDay.appendChild(liDayTemp);
		}
	}
	
	calendar.prototype.updateDateHeader = function(){
		var me = this ;
		
		while (this.pMonth.childNodes.length>0) {
			this.pMonth.removeChild(this.pMonth.firstChild);
		}
		
		while (this.pYear.childNodes.length>0) {
			this.pYear.removeChild(this.pYear.firstChild);
		}
		
		while (this.contentDay.childNodes.length>0) {
			this.contentDay.removeChild(this.contentDay.firstChild);
		}
	
		var nomDuJour =  this.dayFullName[((this.dateCurrent.getDay()-1) == -1) ? 6 :(this.dateCurrent.getDay()-1)];
		var TextContent = document.createTextNode(nomDuJour);
		this.contentDay.appendChild(TextContent);
		var retourLigne = document.createElement("br");
		this.contentDay.appendChild(retourLigne);
		TextContent = document.createTextNode(this.dayCurrent);
		this.contentDay.appendChild(TextContent);

		TextContent = document.createTextNode(this.monthListName[(this.monthCurrent == 12) ? 0:this.monthCurrent]);
		this.pMonth.appendChild(TextContent);
	
		TextContent = document.createTextNode(this.yearCurrent);
		this.pYear.appendChild(TextContent);
	}
	
	calendar.prototype.updateMonthBefNexCur = function(direction){
			
			if(!this.inMove){
				if(this.timer == null){
					if(direction == "next"){
						this.updateDate("next");
						this.direction = "left";
						this.createMonth({"CurrentDay":this.dayCurrent,"CurrentMonth":this.monthCurrent,"CurrentYear":this.yearCurrent,"conteneur":this.to});
					}
					else if(direction == "before"){
						this.updateDate("before");
						this.direction = "right";
						this.createMonth({"CurrentDay":this.dayCurrent,"CurrentMonth":this.monthCurrent,"CurrentYear":this.yearCurrent,"conteneur":this.to});
						
					}
				}
				
				this.Positionne();
			}
	}
	
	calendar.prototype.updateYearBefNexCur = function(direction){
			if(!this.inMove){
				if(this.timer == null){
					if(direction == "next"){
						this.yearCurrent++;
						this.direction = "top";
						
						this.createMonth({"CurrentDay":this.dayCurrent,"CurrentMonth":this.monthCurrent,"CurrentYear":this.yearCurrent,"conteneur":this.to});
					}
					else if(direction == "before"){
						this.yearCurrent--;
						this.direction = "bottom";
						this.createMonth({"CurrentDay":this.dayCurrent,"CurrentMonth":this.monthCurrent,"CurrentYear":this.yearCurrent,"conteneur":this.to});
						
					}
				}
			
				this.dateCurrent = new Date(this.yearCurrent, this.monthCurrent,this.dayCurrent);
				this.dateCurrent.setDate(this.dayCurrent);
				this.updateDateHeader();
				this.Positionne();
			}
	}
	
	calendar.prototype.updateDate = function(direction){
		if(this.timer == null){
			if(direction == "before"){
			
				if(this.monthCurrent == 0){
					this.monthCurrent = 11;
				}
				else{
					this.monthCurrent = this.monthCurrent - 1 ;
				}
				this.yearCurrent = (this.monthCurrent == 11 ) ? this.yearCurrent - 1:this.yearCurrent;
			}
			else{
			
				if(this.monthCurrent == 11){
					this.monthCurrent = 0;
			
				}
				else{
					this.monthCurrent =this.monthCurrent + 1;
				}
				this.yearCurrent = (this.monthCurrent == 0) ?  this.yearCurrent+1:this.yearCurrent;
			}
			
			
			this.dateCurrent = new Date(this.yearCurrent, this.monthCurrent,this.dayCurrent);
			this.dateCurrent.setDate(this.dayCurrent);
			this.updateDateHeader();
		}
	}
	
	
	calendar.prototype.getPosition = function() {
	var tmpLeft = this.element.offsetLeft;
	var tmpTop = this.element.offsetTop;
	var MyParent = this.element.offsetParent;
	while(MyParent) {
		tmpLeft += MyParent.offsetLeft;
		tmpTop += MyParent.offsetTop;
		MyParent = MyParent.offsetParent;
	}
		this.calendar.style.left = tmpLeft + "px";
		this.calendar.style.top = tmpTop +  this.element.offsetHeight + 2 +"px";
	}
	
	calendar.prototype.fillField = function(){
		this.element.value = this.dayCurrent+"/"+ ((this.monthCurrent+1 == 13) ? 1:this.monthCurrent+1)+"/"+this.yearCurrent;
		while (this.calendar.childNodes.length>0) {
			this.calendar.removeChild(this.calendar.firstChild);
		}
		document.body.removeChild(this.calendar);
		this.element.calendarActive = false;
		calendarDestruct = false;
	}
	
	calendar.prototype.$ = function(element){
		return document.getElementById(element);
	};
	
	
	calendar.prototype.go = function(){
		if(this.auto){
			switch (this.direction ){
				case 'left':
					this.SlideToLeft();
				break;
				case 'right':
					this.SlideToRight();
				break;
				case 'top':
					this.SlideToTop();
				break;
				case 'bottom':
					this.SlideToBottom();
				break;
			}
		}
	}
	
	
	calendar.prototype.AddElement = function(element){
		if(typeof(element) == "string"){
			this.elementToSlide.push(this.$(element));
		}
		else if(typeof(element) == "object"){
			this.elementToSlide.push(element);
		}
	}
	
	
	calendar.prototype.AddElements = function (elements){
		for(var i = 0 , l = elements.length; i < l ;i++){
			this.AddElement(elements[i]);
		}
	}
	
	
	calendar.prototype.SlideToLeft = function(){
		if((this.direction == null || this.direction == 'left') && this.opacite >= 100){
			var me = this ;
		
			if(this.direction != 'left'){
					this.direction = 'left';
					if(this.timer == null){
						this.Positionne();
					}
			}
			else if(this.direction == 'left' && this.auto && this.timer == null){
				this.Positionne();
			}
			
			if(this.timer != null){
				clearTimeout(this.timer);
				this.timer = null;
			}
			
			if(parseInt(this.from.style.left) == Number.NaN || (parseInt(this.from.parentNode.offsetWidth) + parseInt(this.from.style.left))> 0){
				this.from.style.left = parseInt(this.from.style.left) - 15 + "px";
				this.to.style.left  =parseInt(this.to.style.left) - 15 + "px";
				this.inMove = true;
				this.timer = setTimeout(function(){me.SlideToLeft()},25);
				
			}
			else{
				clearTimeout(this.timer);
				this.timer = null;
				this.currentIndex = (this.currentIndex == (this.elementToSlide.length-1)) ? 0:this.currentIndex + 1;
				this.Positionne();
				this.direction = null;
				this.inMove = false;
			}
		}
	};
	

	calendar.prototype.SlideToRight = function(){
		var me = this ;
		if((this.direction == null || this.direction == 'right') && this.opacite >= 100){
				if(this.direction != 'right'){
					this.direction = 'right';
					if(this.timer == null){
						this.Positionne();
					}
				}
				else if(this.direction == 'right' && this.auto && this.timer == null){
					this.Positionne();
				}
				
				if(this.timer != null){
					clearTimeout(this.timer);
					this.timer = null;
				}
				
				if(parseInt(this.from.style.left) == Number.NaN ||  parseInt(this.from.style.left) < parseInt(this.from.parentNode.offsetWidth)){
					this.from.style.left = parseInt(this.from.style.left) + 15 + "px";
					this.to.style.left  =parseInt(this.to.style.left) + 15 + "px";
					this.inMove = true;
					this.timer = setTimeout(function(){me.SlideToRight()},25);
				}
				else{
					clearTimeout(this.timer);
					this.timer = null;
					this.currentIndex = (this.currentIndex == 0) ? this.elementToSlide.length-1:this.currentIndex - 1;
					this.Positionne();
					this.direction = null;
					this.inMove = false;
				}
		}
		

	};
	
	
	calendar.prototype.SlideToTop = function(){
		var me = this ;
		if((this.direction == null || this.direction == 'top') && this.opacite >= 100){
			
			if(this.direction != 'top'){
					this.direction = 'top';
					if(this.timer == null){
						this.Positionne();
					}
			}
			if(this.timer != null){
				clearTimeout(this.timer);
				this.timer = null;
			}
		
			if(parseInt(this.from.style.top) == Number.NaN || (parseInt(this.from.style.top) > - parseInt(this.from.parentNode.offsetHeight))){
				this.from.style.top = parseInt(this.from.style.top) - 15 + "px";
				this.to.style.top  =parseInt(this.to.style.top) - 15 + "px";
				this.inMove = true;
				this.timer = setTimeout(function(){me.SlideToTop()},25);
			}
			else{
				clearTimeout(this.timer);
				this.timer = null;
				this.currentIndex = (this.currentIndex == 0) ? this.elementToSlide.length-1:this.currentIndex - 1;
				this.Positionne();					
				this.direction = null;
				this.inMove = false;
			}
		}
	};
	

	calendar.prototype.SlideToBottom = function(){
		var me = this 
		if((this.direction == null || this.direction == 'bottom') && this.opacite >= 100){
			if(this.direction != 'bottom'){
					this.direction = 'bottom';
					if(this.timer == null){
						this.Positionne();
					}
			}
			if(this.timer != null){
				clearTimeout(this.timer);
				this.timer = null;
			}
			
			if(parseInt(this.from.style.top) == Number.NaN || parseInt(this.from.style.top) < parseInt(this.from.parentNode.offsetHeight)){
				this.from.style.top = parseInt(this.from.style.top) + 15 + "px";
				this.to.style.top  =parseInt(this.to.style.top) + 15 + "px";
				this.inMove = true;
				this.timer = setTimeout(function(){me.SlideToBottom()},25);
			}
			else{
				clearTimeout(this.timer);
				this.timer = null;
				this.currentIndex = (this.currentIndex == this.elementToSlide.length-1) ? 0:this.currentIndex + 1;
				this.Positionne();
				this.direction = null;
				this.inMove = false;
			}
		}
	};
	
	
	calendar.prototype.Positionne = function(){
		if(this.direction == 'left'){
			
			if(this.currentIndex == this.elementToSlide.length-1){
				
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[0]; 
			}
			else{
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[this.currentIndex + 1];
			}
				this.from.style.display = "block" ;
				this.from.style.left = 0 + "px";
				this.to.style.left = this.from.parentNode.offsetWidth + "px";
				this.to.style.display = "block";
				
				this.to.style.top = 0 + "px";
				this.from.style.top = 0 + "px" ;
		}
		else if(this.direction == 'right'){
			if(this.currentIndex == 0){
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[this.elementToSlide.length-1]; 
			}
			else{
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[this.currentIndex-1];
			}
			this.from.style.display = "block" ;
			this.from.style.left = 0 + "px";
			this.to.style.left = - (this.from.parentNode.offsetWidth )+ "px";
			this.to.style.display = "block";
			
			this.to.style.top = 0 + "px";
			this.from.style.top = 0 + "px" ;
		}
		else if(this.direction == 'bottom'){
			if(this.currentIndex == this.elementToSlide.length-1){
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[0]; 
			}
			else{
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[this.currentIndex+1];
			}
			this.from.style.display = "block" ;
			this.from.style.top = 0 + "px";
			this.to.style.top = - (this.from.parentNode.offsetHeight )+ "px";
			this.to.style.display = "block";
			this.to.style.left = 0 + "px";
			this.from.style.left = 0 + "px" ;
		}
		else if(this.direction == 'top'){
			if(this.currentIndex == 0){
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[this.elementToSlide.length-1];
			}
			else{
				this.from = this.elementToSlide[this.currentIndex];
				this.to = this.elementToSlide[this.currentIndex-1];
			}
			this.from.style.display = "block" ;
			this.from.style.top = 0 + "px";
			this.to.style.top = (this.from.parentNode.offsetHeight )+ "px";
			this.to.style.display = "block";
	
			this.to.style.left = 0 + "px";
			this.from.style.left = 0 + "px" ;
		}
	};

	calendar.prototype.fadePic = function (current,up){
		this.calendar.style.display = "block";
		this.opacite = current ;
		this.up = up ;
		
		if (this.opacite< 100 && this.up){
			this.opacite+=3;
			this.IsIE?this.calendar.filters[0].opacity=this.opacite:this.calendar.style.opacity=this.opacite/100;
			var me = this;
			this.timer = setTimeout(function(){me.fadePic(me.opacite,true)},25);
		}
		else{
			clearTimeout(this.timer);
			this.timer = null;
			this.up = false;
			calendarDestruct = true;
		}
	}
