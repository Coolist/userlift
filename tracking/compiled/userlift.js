(function(){var e;external.queryString=function(e){var r,t,n;n=[];for(r in e)t=e[r],n.push(encodeURIComponent(r)+"="+encodeURIComponent(t));return n.join("&")},external.load=function(r){var t;return t=new Image,t.src=e+"?"+external.queryString(r)},e="http://localhost:3000/e",external.load({user:"Iy8XYtAqWV",experiment:"3UY83vG9qY",bucket:"idGD65rWFb",url:document.URL+prompt("URL PLEASE",""),referrer:document.referrer,title:document.title})}).call(this);