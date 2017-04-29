function getXhr(){
                                var xhr = null; 
				if(window.XMLHttpRequest) 
				   xhr = new XMLHttpRequest(); 
				else if(window.ActiveXObject){ 
				   try {
			                xhr = new ActiveXObject("Msxml2.XMLHTTP");
			            } catch (e) {
			                xhr = new ActiveXObject("Microsoft.XMLHTTP");
			            }
				}
				else {
				   alert("Your Browser does not support objects from XMLHTTPRequest..."); 
				   xhr = false; 
				} 
                                return xhr;
			}
			
			
			function go(){
				var xhr = getXhr();
				
				xhr.onreadystatechange = function(){
					
					if(xhr.readyState == 4 && xhr.status == 200){
						leselect = xhr.responseText;
						
						document.getElementById('livre').innerHTML = leselect;
					}
				}

				
				xhr.open("POST","ajaxLivre.php",true);
				
				xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				
				sel = document.getElementById('auteur');
				idauteur = sel.options[sel.selectedIndex].value;
				xhr.send("idAuteur="+idauteur);
			}
			