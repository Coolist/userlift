(function(){var e,t,r,o,n,u,i;try{localStorage.setItem("_check","_check"),localStorage.removeItem("_check"),t=!0}catch(c){t=!1}r={},o=0,r.queryString=function(e){var t,r,o;o=[];for(t in e)r=e[t],o.push(encodeURIComponent(t)+"="+encodeURIComponent(r));return o.join("&")},r.load=function(n){var u,i,c;return i=Date.now().toString()+o.toString(),o++,n.r=i,t&&(c=JSON.parse(localStorage._request_queue||"{}"),c[i]=n,localStorage._request_queue=JSON.stringify(c)),u=new Image,u.src=e+"?"+r.queryString(n),u.alt=i,t?u.onload=function(){return c=JSON.parse(localStorage._request_queue),delete c[this.alt],localStorage._request_queue=JSON.stringify(c)}:void 0},r.page=function(e){return e=e||{},e.type="pageview",e.user=u,e.experiments=n.list.join("|"),e.buckets=n.buckets.join("|"),e.url=document.URL,e.referrer=document.referrer,e.title=document.title,r.load(e)},r.event=function(e){return e=e||{},e.type="event",e.user=u,e.experiments=n.list.join("|"),e.buckets=n.buckets.join("|"),r.load(e)},i={},i.queue=function(e){return initQueue.push(e)},i.loadMethods=function(){var e,t,r,o,n;if(window.circled.methodQueue){for(o=window.circled.methodQueue,n=[],t=0,r=o.length;r>t;t++)e=o[t],n.push(window.circled[e[0]].apply(void 0,e[1]));return n}},i.ready=function(){var e,o,n;if(t){o=JSON.parse(localStorage._request_queue||"{}"),localStorage._request_queue="{}";for(e in o)n=o[e],r.load(n)}return i.loadMethods()},window.circled=window.circled||[],window.circled.page=r.page,window.circled.event=r.event,e="http://localhost:3000/e",u=window.circled.userId,n=window.circled.experiments,"complete"===document.readyState?i.ready():window.onload=function(){return i.ready()}}).call(this);