(function(){var t,e,n,r,i,o,s;try{localStorage.setItem("_check","_check"),localStorage.removeItem("_check"),e=!0}catch(u){e=!1}window.jQuery||(window.$=window.jquip=function(){function t(t,e){for(var n,r=0,i=Me.length;i>r;r++)if(Me[r].apply(this,arguments))return this;return t?k(t)?(V?t():ee.push(t),this):O(t)?this.make(t):t.nodeType||_(t)?this.make([t]):"body"==t&&!e&&K.body?(this.context=t.context,this[0]=K.body,this.length=1,this.selector=t,this):void 0!==t.selector?(this.context=t.context,this.selector=t.selector,this.make(t)):(t=q(t)&&"<"===t.charAt(0)?(n=ye.exec(t))?[K.createElement(n[1])]:I(t).childNodes:c(this.selector=t,e),this.make(t),j(e)&&this.attr(e),this):this}function e(e,n){return new t(e,n)}function n(t){return!t||!t.parentNode||11==t.parentNode.nodeType}function r(t,n,r){if(n=n||0,k(n))return w(t,function(t,e){return!!n.call(t,e,t)===r});if(n.nodeType)return w(t,function(t){return t===n===r});if(q(n)){var i=":"==n.charAt(0)&&e.Expr[n.substring(1)];return w(t,function(t){var e,r=t.parentNode,o=!r;return o&&(r=Ie,r.appendChild(t)),e=i?i(t):t.parentNode&&m(c(n,t.parentNode),t)>=0,o&&r.removeChild(t),e})}return w(t,function(t){return m(n,t)>=0===r})}function i(t,e,n){var r=t[Pe];return A(n)?(r||(r=t[Pe]=He++),(Ue[r]||(Ue[r]={}))[e]=n):r&&Ue[r]&&(e?Ue[r][e]:Ue[r])}function o(t){if(!Re[t]){var n=e("<"+t+">").appendTo(K.body),r=e.css&&e.css(n[0],"display")||n[0].style.display;n.remove(),Re[t]=r}return Re[t]}function s(t,e){if(t.length=e&&e.length||0,0===t.length)return t;for(var n=0,r=e.length;r>n;n++)t[n]=e[n];return t}function u(t,e){e=" "+e+" ";for(var n=0,r=t.length;r>n;n++)if(l(t[n],e))return!0;return!1}function l(t,e){return 1===t.nodeType&&(" "+t.className+" ").replace(ue," ").indexOf(e)>-1}function a(t,e,n){e=e||K,n=n||[],1==e.nodeType&&t(e)&&n.push(e);for(var r=e.childNodes,i=0,o=r.length;o>i;i++){var s=r[i];1==s.nodeType&&a(t,s,n)}return n}function c(t,n,r){if(t&&q(t)){n instanceof e&&(n=n[0]),n=n||K,r=r||e.query;var i,o=t.substring(1);return ae.test(t)&&n===K?(i=K.getElementById(o))?[i]:[]:P(ce.test(t)&&n.getElementsByClassName?n.getElementsByClassName(o):le.test(t)?n.getElementsByTagName(t):r(t,n))}return 1==t.nodeType||9==t.nodeType?[t]:[]}function f(t,e,n){var r,i=K.head||K.getElementsByTagName("head")[0]||te,o=K.createElement("script");n&&(o.async="async"),o.onreadystatechange=function(){(r=o.readyState)&&"loaded"!=r&&"complete"!=r||(o.onload=o.onreadystatechange=null,i&&o.parentNode&&i.removeChild(o),o=void 0,e&&e())},o.onload=e,o.src=t,i.insertBefore(o,i.firstChild)}function h(){G.console&&G.console.warn(arguments)}function d(t,e,n){if(null!=t)if(je&&t.forEach===je)t.forEach(e,n);else if(t.length===+t.length){for(var r=0,i=t.length;i>r;r++)if(r in t&&e.call(n,t[r],r,t)===qe)return}else for(var o in t)if(Oe.call(t,o)&&e.call(n,t[o],o,t)===qe)return}function p(t,e){if(t&&t.getAttribute&&e){var n=t.hasAttribute&&t.hasAttribute(e)?t.getAttribute(e):t[e];return null===n?void 0:n}}function y(t,n){return A(t)?e(n).filter(t):e(n)}function m(t,e){if(null==t)return-1;var n,r;if($e&&t.indexOf===$e)return t.indexOf(e);for(n=0,r=t.length;r>n;n++)if(t[n]===e)return n;return-1}function g(t,e,n){var r=[];return null==t?r:We&&t.filter===We?t.filter(e,n):(d(t,function(t,i,o){e.call(n,t,i,o)&&(r[r.length]=t)}),r)}function v(t,n,r){for(var i=[],o=t[n];o&&9!==o.nodeType&&(void 0===r||1!==o.nodeType||!e(o).is(r));)1===o.nodeType&&i.push(o),o=o[n];return i}function b(t,e,n){e=e||1;for(var r=0;t&&(1!==t.nodeType||++r!==e);t=t[n]);return t}function x(t,e){for(var n=[];t;t=t.nextSibling)1===t.nodeType&&t!==e&&n.push(t);return n}function w(t,e,n){var r,i=[];n=!!n;for(var o=0,s=t.length;s>o;o++)r=!!e(t[o],o),n!==r&&i.push(t[o]);return i}function N(t,n,r){var i,o,s=[],u=0,l=t.length,a=t instanceof e||"number"==typeof l&&(l>0&&t[0]&&t[l-1]||0===l||O(t));if(a)for(;l>u;u++)i=n(t[u],u,r),null!=i&&(s[s.length]=i);else for(o in t)i=n(t[o],o,r),null!=i&&(s[s.length]=i);return s.concat.apply([],s)}function T(t,e,n){if(!t)return{};var r=i(t,e,n);return r||S(t)["data-"+e]}function S(t){var e={};if(1==t.nodeType)for(var n=0,r=t.attributes,i=r.length;i>n;n++)e[r.item(n).nodeName]=r.item(n).nodeValue;return e}function C(t,e){return t&&e?t.toLowerCase()===e.toLowerCase():t==e}function E(t){return null==t?String(t):Se[Te.call(t)]||"object"}function A(t){return void 0!==t}function q(t){return"string"==typeof t}function L(t){return"object"==typeof t}function k(t){return"function"==typeof t||"function"===E(t)}function O(t){return"array"===E(t)}function F(t){return!q(t)&&"number"==typeof t.length}function _(t){return t&&"object"==typeof t&&"setInterval"in t}function D(t){return null==t||!he.test(t)||isNaN(t)}function j(t){if(!t||"object"!==E(t)||t.nodeType||_(t))return!1;try{if(t.constructor&&!Oe.call(t,"constructor")&&!Oe.call(t.constructor.prototype,"isPrototypeOf"))return!1}catch(e){return!1}var n;for(n in t);return void 0===n||Oe.call(t,n)}function W(t,e){var n=t.length,r=0;if("number"==typeof e.length)for(var i=e.length;i>r;r++)t[n++]=e[r];else for(;void 0!==e[r];)t[n++]=e[r++];return t.length=n,t}function $(){var t,e,n,r,i,o,s=arguments,u=s[0]||{},l=1,a=s.length,c=!1;for("boolean"==typeof u&&(c=u,u=s[1]||{},l=2),"object"==typeof u||k(u)||(u={}),a===l&&(u=this,--l);a>l;l++)if(null!=(t=s[l]))for(e in t)n=u[e],r=t[e],u!==r&&(c&&r&&(j(r)||(i=O(r)))?(i?(i=!1,o=n&&O(n)?n:[]):o=n&&j(n)?n:{},u[e]=$(c,o,r)):void 0!==r&&(u[e]=r));return u}function P(t,e){var n=e||[];if(null!=t){var r=E(t);null==t.length||"string"==r||"function"==r||"regexp"===r||_(t)?_e.call(n,t):W(n,t)}return n}function I(t,e,n){if(e=e||K||e.ownerDocument||e[0]&&e[0].ownerDocument||K,n=n||e.createDocumentFragment(),F(t))return M(t,e,n)&&n;for(var r=B(t);r.firstChild;)n.appendChild(r.firstChild);return n}function B(t,e){var n=(e||K).createElement("div"),r=(se.exec(t)||["",""])[1].toLowerCase(),i=Ae[r]||Ae._default,o=i[0];for(n.innerHTML=i[1]+t+i[2];o--;)n=n.lastChild;return n}function M(t,e,n){var r,i,o=[];for(r=0;null!=(i=t[r]);r++)q(i)&&(i=B(i,e)),i.nodeType?o.push(i):o=W(o,i);if(n)for(r=0;r<o.length;r++)o[r].nodeType&&n.appendChild(o[r]);return o}function z(t){if(X&&(Ce=Ee,t.sort(X),Ce))for(var e=1;e<t.length;e++)t[e]===t[e-1]&&t.splice(e--,1);return t}function H(){if(!K.body)return null;var t=K.createElement("div");K.body.appendChild(t),t.style.width="20px",t.style.padding="10px";var e=t.offsetWidth;return K.body.removeChild(t),40==e}function U(t,e){ne.push({url:t,cb:e})}function R(){d(ee,function(t){t()}),V=!0}var V,Y,J,X,G=window,Q="http://cdnjs.cloudflare.com/ajax/libs/sizzle/1.4.4/sizzle.min.js",Z=function(){return G.Sizzle||G.qwery},K=document,te=K.documentElement,ee=[],ne=[],re=/Until$/,ie=/,/,oe=/^(?:parents|prevUntil|prevAll)/,se=/<([\w:]+)/,ue=/[\n\t\r]/g,le=/^[\w-]+$/,ae=/^#[\w-]+$/,ce=/^\.[\w-]+$/,fe=/\s+/,he=/\d/,de=/\S/,pe=/\r\n/g,ye=/^<(\w+)\s*\/?>(?:<\/\1>)?$/,me=/\r?\n/g,ge=/^(?:select|textarea)/i,ve=/^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,be=String.prototype.trim,xe=/^\s+/,we=/\s+$/,Ne={children:!0,contents:!0,next:!0,prev:!0},Te=Object.prototype.toString,Se={},Ce=!1,Ee=!0,Ae={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]},qe={},Le=Array.prototype,ke=Object.prototype,Oe=ke.hasOwnProperty,Fe=Le.slice,_e=Le.push,De=Le.indexOf,je=Le.forEach,We=Le.filter,$e=Le.indexOf,Pe="jq-"+ +new Date,Ie=K.createElement("p");de.test(" ")&&(xe=/^[\s\xA0]+/,we=/[\s\xA0]+$/);var Be,Me=[],ze={},He=1,Ue={_id:0},Re={};Be=t.prototype=e.prototype=e.fn={constructor:e,selector:"",length:0,dm:function(t,e,n){var r,i,o,s,u,l=t[0];if(l&&this[0]){if(!(i=3===l.nodeType&&l)&&(r=l&&l.parentNode,i=r&&11===r.nodeType&&r.childNodes.length===this.length?r:I(l),o=i.firstChild,1===i.childNodes.length&&(i=o),!o))return this;for(u=0,s=this.length;s>u;u++)n.call(this[u],0==u?i:i.cloneNode(!0))}return this},ps:function(t,e,n){var r=this.constructor();return O(t)?_e.apply(r,t):W(r,t),r.prevObject=this,r.context=this.context,"find"===e?r.selector=this.selector+(this.selector?" ":"")+n:e&&(r.selector=this.selector+"."+e+"("+n+")"),r}},Be.make=function(t){return s(this,t),this},Be.toArray=function(){return Fe.call(this,0)},Be.get=function(t){return A(t)?0>t?this[this.length+t]:this[t]:this.toArray()},Be.add=function(t,r){var i="string"==typeof t?e(t,r):P(t&&t.nodeType?[t]:t),o=W(this.get(),i);return this.ps(n(i[0])||n(o[0])?o:z(o))},Be.each=function(t){if(!k(t))return this;for(var e=0,n=this.length;n>e;e++)t.call(this[e],e,this[e]);return this},Be.attr=function(t,e){var n=this[0];return q(t)&&void 0===e?p(n,t):this.each(function(n){var r=this.nodeType;if(3!==r&&8!==r&&2!==r)if(L(t))for(var i in t)null===e?this.removeAttribute(t):this.setAttribute(i,t[i]);else this.setAttribute(t,k(e)?e.call(this,n,this.getAttribute(t)):e)})},Be.removeAttr=function(t){return this.each(function(){1==this.nodeType&&this.removeAttribute(t)})},Be.data=function(t,e){return void 0===e?T(this[0],t):this.each(function(){T(this,t,e)})},Be.append=function(){return this.dm(arguments,!0,function(t){1===this.nodeType&&this.appendChild(t)})},Be.prepend=function(){return this.dm(arguments,!0,function(t){1===this.nodeType&&this.insertBefore(t,this.firstChild)})},Be.before=function(){return this[0]&&this[0].parentNode?this.dm(arguments,!1,function(t){this.parentNode.insertBefore(t,this)}):this},Be.after=function(){return this[0]&&this[0].parentNode?this.dm(arguments,!1,function(t){this.parentNode.insertBefore(t,this.nextSibling)}):this},Be.replaceWith=function(t){var n=this,r=k(t);return this.each(function(i){var o=this.nextSibling,s=this.parentNode,u=r?t.call(this,i,this):t;s&&11!=s.nodeType?(s.removeChild(this),o?e(o).before(u):e(s).append(u)):n[i]=e(u).clone()[0]})},Be.hide=function(){return this.each(function(){"none"!=this.style.display&&(i(this,"display",this.style.display),this.style.display="none")})},Be.show=function(){return this.each(function(){this.style.display=i(this,"display")||o(this.tagName)})},Be.toggle=function(){return this.each(function(){var t=e(this);e.Expr.hidden(this)?t.show():t.hide()})},Be.eq=function(t){return-1===t?this.slice(t):this.slice(t,+t+1)},Be.first=function(){return this.eq(0)},Be.last=function(){return this.eq(-1)},Be.slice=function(){return this.ps(Fe.apply(this,arguments),"slice",Fe.call(arguments).join(","))},Be.map=function(t){return this.ps(N(this,function(e,n){return t.call(e,n,e)}))},Be.find=function(t){var n,r,i=this;if(!q(t))return e(t).filter(function(){for(n=0,r=i.length;r>n;n++)if(J(i[n],this))return!0});var o,s,u,l=this.ps("","find",t);for(n=0,r=this.length;r>n;n++)if(o=l.length,W(l,e(t,this[n])),0===n)for(s=o;s<l.length;s++)for(u=0;o>u;u++)if(l[u]===l[s]){l.splice(s--,1);break}return l},Be.not=function(t){return this.ps(r(this,t,!1),"not",t)},Be.filter=function(t){return this.ps(r(this,t,!0),"filter",t)},Be.indexOf=function(t){return m(this,t)},Be.is=function(t){return this.length>0&&e(this[0]).filter(t).length>0},Be.remove=function(){for(var t,e=0;A(t=this[e]);e++)t.parentNode&&t.parentNode.removeChild(t);return this},Be.closest=function(t,e){var n,r,i,o=[];for(n=0,r=this.length;r>n;n++)for(i=this[n];i;){if(y(t,[i]).length>0){o.push(i);break}if(i=i.parentNode,!i||!i.ownerDocument||i===e||11===i.nodeType)break}return o=o.length>1?z(o):o,this.ps(o,"closest",t)},Be.val=function(t){return A(t)?this.each(function(){this.value=t}):this[0]&&this[0].value||""},Be.html=function(t){return A(t)?this.each(function(){this.innerHTML=t}):this[0]&&this[0].innerHTML||""},Be.text=function(t){var e,n=this[0];return A(t)?this.empty().append((n&&n.ownerDocument||K).createTextNode(t)):n&&(e=n.nodeType)?1===e||9===e?q(n.textContent)?n.textContent:n.innerText.replace(pe,""):3===e||4===e?n.nodeValue:null:null},Be.empty=function(){var t,e;for(t=0;A(e=this[t]);t++)for(;e.firstChild;)e.removeChild(e.firstChild);return this},Be.addClass=function(t){var n,r,i,o,s,u,l;if(k(t))return this.each(function(n){e(this).addClass(t.call(this,n,this.className))});if(t&&q(t))for(n=t.split(fe),r=0,i=this.length;i>r;r++)if(o=this[r],o&&1===o.nodeType)if(o.className||1!==n.length){for(s=" "+o.className+" ",u=0,l=n.length;l>u;u++)~s.indexOf(" "+n[u]+" ")||(s+=n[u]+" ");o.className=Y(s)}else o.className=t;return this},Be.removeClass=function(t){var n,r,i,o,s,u,l;if(k(t))return this.each(function(n){e(this).removeClass(t.call(this,n,this.className))});if(t&&q(t)||void 0===t)for(n=(t||"").split(fe),r=0,i=this.length;i>r;r++)if(o=this[r],1===o.nodeType&&o.className)if(t){for(s=(" "+o.className+" ").replace(ue," "),u=0,l=n.length;l>u;u++)s=s.replace(" "+n[u]+" "," ");o.className=Y(s)}else o.className="";return this},Be.hasClass=function(t){return u(this,t)},Be.fadeIn=function(){this.each(function(){e(this).show()})},Be.fadeOut=function(){this.each(function(){e(this).hide()})},Be.serializeArray=function(){return this.map(function(){return this.elements?P(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||ge.test(this.nodeName)||ve.test(this.type))}).map(function(t,n){var r=e(this).val();return null==r||O(r)?N(r,function(t){return{name:n.name,value:t.replace(me,"\r\n")}}):{name:n.name,value:r.replace(me,"\r\n")}}).get()},Be.wrap=function(t){return this.each(function(){var n=e(e(t)[0].cloneNode(!1));e(this).before(n),n.append(e(this))})},Be.prop=function(t,e){return A(e)?this.each(function(){this[t]=e}):this[0]&&this[0][t]},Be.clone=function(){return e(this.map(function(){return this.cloneNode(!0)}))},Be.toggleClass=function(t,n){return this.each(function(){var r=e(this);(A(n)?n:!r.hasClass(t))?r.addClass(t):r.removeClass(t)})},e.Expr={hidden:function(t){return"none"===(e.css&&e.css(t,"display")||t.style.display)},visible:function(t){return!e.Expr.hidden(t)}},e.hasClass=u,e.walk=a,e.$$=c,e.setQuery=function(t){e.query=function(e,n){return c(e,n,t||function(t,e){return e.querySelectorAll(t)})}};var Ve=Z();e.setQuery(Ve||function(t,e){return(e=e||K).querySelectorAll?P(e.querySelectorAll(t)):[]}),e.loadScript=f,e.each=function(t,e,n){var r,i=0,o=t.length,s=void 0===o||k(t);if(n)if(s){for(r in t)if(e.apply(t[r],n)===!1)break}else for(;o>i&&e.apply(t[i++],n)!==!1;);else if(s){for(r in t)if(e.call(t[r],r,t[r])===!1)break}else for(;o>i&&e.call(t[i],i,t[i++])!==!1;);return t},e._each=d,e.filter=y,e._indexOf=m,e._defaults=function(t){return d(Fe.call(arguments,1),function(e){for(var n in e)null==t[n]&&(t[n]=e[n])}),t},e._filter=g,e.proxy=function(t,e){if("string"==typeof e){var n=t[e];e=t,t=n}if(k(t)){var r=Fe.call(arguments,2),i=function(){return t.apply(e,r.concat(Fe.call(arguments)))};return i.guid=t.guid=t.guid||i.guid||He++,i}},e.dir=v,e.nth=b,e.sibling=x,e.grep=w,e.map=N,e.data=T,e.attrs=S,e.eqSI=C,Y=be?function(t){return null==t?"":be.call(t)}:function(t){return null==t?"":t.toString().replace(xe,"").replace(we,"")},e.trim=Y,e.indexOf=e.inArray=function(t,e){if(!e)return-1;if(De)return De.call(e,t);for(var n=0,r=e.length;r>n;n++)if(e[n]===t)return n;return-1},d("Boolean Number String Function Array Date RegExp Object".split(" "),function(t){return Se["[object "+t+"]"]=t.toLowerCase(),this}),e.type=E,e.isFunction=k,e.isArray=Array.isArray||O,e.isWindow=_,e.isNaN=D,e.merge=W,e.extend=e.fn.extend=$,e.makeArray=P,e.htmlFrag=I;var Ye=function(t,e,n){if(t===e)return n;for(var r=t.nextSibling;r;){if(r===e)return-1;r=r.nextSibling}return 1};return J=e.contains=te.contains?function(t,e){return t!==e&&(t.contains?t.contains(e):!0)}:function(){return!1},X=te.compareDocumentPosition?(J=function(t,e){return!!(16&t.compareDocumentPosition(e))})&&function(t,e){return t===e?(Ce=!0,0):t.compareDocumentPosition&&e.compareDocumentPosition?4&t.compareDocumentPosition(e)?-1:1:t.compareDocumentPosition?-1:1}:function(t,e){if(t===e)return Ce=!0,0;if(t.sourceIndex&&e.sourceIndex)return t.sourceIndex-e.sourceIndex;var n,r,i=[],o=[],s=t.parentNode,u=e.parentNode,l=s;if(s===u)return Ye(t,e);if(!s)return-1;if(!u)return 1;for(;l;)i.unshift(l),l=l.parentNode;for(l=u;l;)o.unshift(l),l=l.parentNode;n=i.length,r=o.length;for(var a=0;n>a&&r>a;a++)if(i[a]!==o[a])return Ye(i[a],o[a]);return a===n?Ye(t,o[a],-1):Ye(i[a],e,1)},e.unique=z,d({parent:function(t){var e=t.parentNode;return e&&11!==e.nodeType?e:null},parents:function(t){return v(t,"parentNode")},parentsUntil:function(t,e,n){return v(t,"parentNode",n)},next:function(t){return b(t,2,"nextSibling")},prev:function(t){return b(t,2,"previousSibling")},nextAll:function(t){return v(t,"nextSibling")},prevAll:function(t){return v(t,"previousSibling")},nextUntil:function(t,e,n){return v(t,"nextSibling",n)},prevUntil:function(t,e,n){return v(t,"previousSibling",n)},siblings:function(t){return x(t.parentNode.firstChild,t)},children:function(t){return x(t.firstChild)},contents:function(t){return"iframe"===t.nodeName?t.contentDocument||t.contentWindow["document "]:P(t.childNodes)}},function(t,n){e.fn[n]=function(e,r){var i=N(this,t,e),o=Fe.call(arguments);return re.test(n)||(r=e),q(r)&&(i=P(y(r,i))),i=this.length>1&&!Ne[n]?z(i):i,(this.length>1||ie.test(r))&&oe.test(n)&&(i=i.reverse()),this.ps(i,n,o.join(","))}}),d({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after"},function(t,n){e.fn[n]=function(r){var i,o,s,u=[],l=e(r),a=1===this.length&&this[0].parentNode;if(a&&11===a.nodeType&&1===a.childNodes.length&&1===l.length)return l[t](this[0]),this;for(i=0,s=l.length;s>i;i++)o=(i>0?this.clone(!0):this).get(),e(l[i])[t](o),u=u.concat(o);return this.ps(u,n,l.selector)}}),function(){var t=document.createElement("div");t.style.display="none",t.innerHTML="   <link/><table></table><a href='/a' style='color:red;float:left;opacity:.55;'>a</a><input type='checkbox'/>";var n=t.getElementsByTagName("a")[0];e.support={boxModel:null,opacity:/^0.55$/.test(n.style.opacity),cssFloat:!!n.style.cssFloat};var r,i=/(webkit)[ \/]([\w.]+)/,o=/(opera)(?:.*version)?[ \/]([\w.]+)/,s=/(msie) ([\w.]+)/,u=/(mozilla)(?:.*? rv:([\w.]+))?/,l=navigator.userAgent.toLowerCase(),a=i.exec(l)||o.exec(l)||s.exec(l)||l.indexOf("compatible")<0&&u.exec(l)||[];r=e.browser={version:a[2]||"0"},r[a[1]||""]=!0}(),e.scriptsLoaded=function(t){k(t)&&ee.push(t)},e.loadAsync=U,Ve||K.querySelectorAll||U(Q,function(){e.setQuery(Z())}),e.init=!1,e.onload=function(){if(!e.init)try{e.support.boxModel=H();var t=0;d(ne,function(e){t++,f(e.url,function(){try{e.cb&&e.cb()}catch(n){}--t||R()})}),e.init=!0,t||R()}catch(n){h(n)}},K.body&&!e.init&&setTimeout(e.onload,1),e.hook=function(t){Me.push(t)},e.plug=function(t,n){var r=q(t)?t:t.name;if(n=k(t)?t:n,!k(n))throw"Plugin fn required";r&&n&&(ze[r]=n),n(e)},e}(),$.plug("docready",function(t){function e(){if(!l){try{s.documentElement.doScroll("left")}catch(t){return void setTimeout(e,1)}n()}}function n(e){if(e===!0&&a--,!a||e!==!0&&!l){if(!s.body)return setTimeout(i,1);if(l=!0,e!==!0&&--a>0)return;if(u){var n,r=0,i=u;for(u=null;n=i[r++];)n.call(s,t);t.fn.trigger&&t(s).trigger("ready").unbind("ready")}}}var r,i,o=window,s=document,u=[],l=!1,a=1;t.hook(function(t){return"function"==typeof t?(this.ready(t),!0):void 0}),t.ready=n,r=s.addEventListener?function(){s.removeEventListener("DOMContentLoaded",r,!1),n()}:function(){"complete"===s.readyState&&(s.detachEvent("onreadystatechange",r),n())},t.bindReady=function(){if(!i){if(i=!0,"complete"===s.readyState)return setTimeout(n,1);if(s.addEventListener)s.addEventListener("DOMContentLoaded",r,!1),o.addEventListener("load",n,!1);else if(s.attachEvent){s.attachEvent("onreadystatechange",r),o.attachEvent("onload",n);var t=!1;try{t=null==window.frameElement}catch(u){}s.documentElement.doScroll&&t&&e()}}},t.fn.ready=function(e){return t.bindReady(),l?e.call(s,t):u&&u.push(e),this},t.init||t(document).ready(t.onload)}),$.plug("css",function(t){function e(e,n,i){var o="width"===n?e.offsetWidth:e.offsetHeight,s="width"===n?w:N;return o>0?("border"!==i&&t.each(s,function(){i||(o-=parseFloat(r(e,"padding"+this))||0),"margin"===i?o+=parseFloat(r(e,i+this))||0:o-=parseFloat(r(e,"border"+this+"Width"))||0}),o+"px"):""}function n(e,n,r,i){if(e&&3!==e.nodeType&&8!==e.nodeType&&e.style){var s,u=o(n),l=e.style,a=t.cssHooks[u];if(n=t.cssProps[u]||u,void 0===r)return a&&"get"in a&&void 0!==(s=a.get(e,!1,i))?s:l[n];if(!("number"==typeof r&&isNaN(r)||null==r||("number"!=typeof r||t.cssNumber[u]||(r+="px"),a&&"set"in a&&void 0===(r=a.set(e,r)))))try{l[n]=r}catch(c){}}}function r(e,n,r){var i,s=o(n),u=t.cssHooks[s];return n=t.cssProps[s]||s,u&&"get"in u&&void 0!==(i=u.get(e,!0,r))?i:l?l(e,n,s):void 0}function i(t,e,n){var r,i={};for(var r in e)i[r]=t.style[r],t.style[r]=e[r];n.call(t);for(r in e)t.style[r]=i[r]}function o(t){return t.replace(y,T)}function s(e,n,r,i,o,u){var l=e.length;if("object"==typeof n){for(var a in n)s(e,a,n[a],i,o,r);return e}if(void 0!==r){i=!u&&i&&t.isFunction(r);for(var c=0;l>c;c++)o(e[c],n,i?r.call(e[c],c,o(e[c],n)):r,u);return e}return l?o(e[0],n):void 0}function u(e){return t.isWindow(e)?e:9===e.nodeType?e.defaultView||e.parentWindow:!1}var l,a,c,f=document,h=f.documentElement,d=/alpha\([^)]*\)/i,p=/opacity=([^)]*)/,y=/-([a-z])/gi,m=/([A-Z])/g,g=/^-?\d+(?:px)?$/i,v=/^-?\d/,b=/^(?:body|html)$/i,x={position:"absolute",visibility:"hidden",display:"block"},w=["Left","Right"],N=["Top","Bottom"],T=function(t,e){return e.toUpperCase()};t.cssHooks={opacity:{get:function(t,e){if(!e)return t.style.opacity;var n=l(t,"opacity","opacity");return""===n?"1":n}}},t._each(["height","width"],function(n){t.cssHooks[n]={get:function(t,r,o){var s;return r?0!==t.offsetWidth?e(t,n,o):(i(t,x,function(){s=e(t,n,o)}),s):void 0},set:function(t,e){return g.test(e)?(e=parseFloat(e),e>=0?e+"px":void 0):e}}}),t.support.opacity||(t.support.opacity={get:function(t,e){return p.test((e&&t.currentStyle?t.currentStyle.filter:t.style.filter)||"")?parseFloat(RegExp.$1)/100+"":e?"1":""},set:function(e,n){var r=e.style;r.zoom=1;var i=t.isNaN(n)?"":"alpha(opacity="+100*n+")",o=r.filter||"";r.filter=d.test(o)?o.replace(d,i):r.filter+" "+i}}),f.defaultView&&f.defaultView.getComputedStyle&&(a=function(e,n,r){var i,o,s;return r=r.replace(m,"-$1").toLowerCase(),(o=e.ownerDocument.defaultView)?((s=o.getComputedStyle(e,null))&&(i=s.getPropertyValue(r),""!==i||t.contains(e.ownerDocument.documentElement,e)||(i=t.style(e,r))),i):void 0}),f.documentElement.currentStyle&&(c=function(t,e){var n,r=t.currentStyle&&t.currentStyle[e],i=t.runtimeStyle&&t.runtimeStyle[e],o=t.style;return!g.test(r)&&v.test(r)&&(n=o.left,i&&(t.runtimeStyle.left=t.currentStyle.left),o.left="fontSize"===e?"1em":r||0,r=o.pixelLeft+"px",o.left=n,i&&(t.runtimeStyle.left=i)),""===r?"auto":r}),l=a||c,t.fn.css=function(t,e){return 2===arguments.length&&void 0===e?this:s(this,t,e,!0,function(t,e,i){return void 0!==i?n(t,e,i):r(t,e)})},t.cssNumber={zIndex:!0,fontWeight:!0,opacity:!0,zoom:!0,lineHeight:!0},t.cssProps={"float":t.support.cssFloat?"cssFloat":"styleFloat"},t.style=n,t.css=r,t.swap=i,t.camelCase=o;var S,C,E,A,q,L,k=function(){if(!S){var e,n,i,o=f.body,s=f.createElement("div"),u=parseFloat(r(o,"marginTop"))||0,l="<div style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;'><div></div></div><table style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;' cellpadding='0' cellspacing='0'><tr><td></td></tr></table>";t.extend(s.style,{position:"absolute",top:0,left:0,margin:0,border:0,width:"1px",height:"1px",visibility:"hidden"}),s.innerHTML=l,o.insertBefore(s,o.firstChild),e=s.firstChild,n=e.firstChild,i=e.nextSibling.firstChild.firstChild,q=5!==n.offsetTop,L=5===i.offsetTop,n.style.position="fixed",n.style.top="20px",A=20===n.offsetTop||15===n.offsetTop,n.style.position=n.style.top="",e.style.overflow="hidden",e.style.position="relative",E=-5===n.offsetTop,C=o.offsetTop!==u,o.removeChild(s),S=!0}},O=function(t){var e=t.offsetTop,n=t.offsetLeft;return k(),C&&(e+=parseFloat(r(t,"marginTop"))||0,n+=parseFloat(r(t,"marginLeft"))||0),{top:e,left:n}};t.fn.offset=function(){var e,n=this[0];if(!n||!n.ownerDocument)return null;if(n===n.ownerDocument.body)return O(n);try{e=n.getBoundingClientRect()}catch(r){}if(!e||!t.contains(h,n))return e?{top:e.top,left:e.left}:{top:0,left:0};var i=f.body,o=u(f),s=h.clientTop||i.clientTop||0,l=h.clientLeft||i.clientLeft||0,a=o.pageYOffset||t.support.boxModel&&h.scrollTop||i.scrollTop,c=o.pageXOffset||t.support.boxModel&&h.scrollLeft||i.scrollLeft,d=e.top+a-s,p=e.left+c-l;return{top:d,left:p}},t.fn.position=function(){if(!this[0])return null;var t=this[0],e=this.offsetParent(),n=this.offset(),i=b.test(e[0].nodeName)?{top:0,left:0}:e.offset();return n.top-=parseFloat(r(t,"marginTop"))||0,n.left-=parseFloat(r(t,"marginLeft"))||0,i.top+=parseFloat(r(e[0],"borderTopWidth"))||0,i.left+=parseFloat(r(e[0],"borderLeftWidth"))||0,{top:n.top-i.top,left:n.left-i.left}},t.fn.offsetParent=function(){return this.map(function(){for(var t=this.offsetParent||f.body;t&&!b.test(t.nodeName)&&"static"===r(t,"position");)t=t.offsetParent;return t})},t._each(["Height","Width"],function(e){var n=e.toLowerCase();t.fn["inner"+e]=function(){var t=this[0];return t&&t.style?parseFloat(r(t,n,"padding")):null},t.fn["outer"+e]=function(t){var e=this[0];return e&&e.style?parseFloat(r(e,n,t?"margin":"border")):null},t.fn[n]=function(i){var o=this[0];if(!o)return null==i?null:this;if(t.isFunction(i))return this.each(function(e){var r=t(this);r[n](i.call(this,e,r[n]()))});if(t.isWindow(o)){var s=o.document.documentElement["client"+e],u=o.document.body;return"CSS1Compat"===o.document.compatMode&&s||u&&u["client"+e]||s}if(9===o.nodeType)return Math.max(o.documentElement["client"+e],o.body["scroll"+e],o.documentElement["scroll"+e],o.body["offset"+e],o.documentElement["offset"+e]);if(void 0===i){var l=r(o,n),a=parseFloat(l);return t.isNaN(a)?l:a}return this.css(n,"string"==typeof i?i:i+"px")}}),t._each(["Left","Top"],function(e,n){var r="scroll"+e;t.fn[r]=function(e){var i,o;return void 0===e?(i=this[0])?(o=u(i),o?"pageXOffset"in o?o[n?"pageYOffset":"pageXOffset"]:t.support.boxModel&&o.document.documentElement[r]||o.document.body[r]:i[r]):null:this.each(function(){o=u(this),o?o.scrollTo(n?t(o).scrollLeft():e,n?e:t(o).scrollTop()):this[r]=e})}})})),n={},r=0,n.queryString=function(t){var e,n,r;r=[];for(e in t)n=t[e],r.push(encodeURIComponent(e)+"="+encodeURIComponent(n));return r.join("&")},n.load=function(o){var u,l,a;return s?(l=Date.now().toString()+r.toString(),r++,e&&(a=JSON.parse(localStorage._request_queue||"{}"),a[l]=o,localStorage._request_queue=JSON.stringify(a)),u=new Image,u.src=t+"?"+n.queryString(o),u.alt=l,e?u.onload=function(){return a=JSON.parse(localStorage._request_queue),delete a[this.alt],localStorage._request_queue=JSON.stringify(a)}:void 0):i.queue(o)},n.page=function(t){return t.type="pageview",t.user="Iy8XYtAqWV",t.experiment="3UY83vG9qY",t.bucket="idGD65rWFb",n.load(t)},n.event=function(t){return t.type="event",t.user="Iy8XYtAqWV",t.experiment="3UY83vG9qY",t.bucket="idGD65rWFb",n.load(t)},i={},o=[],s=!1,i.queue=function(t){return o.push(t)},i.ready=function(){var t,r,i,u,l,a,c;for(s=!0,l=0,a=o.length;a>l;l++)r=o[l],n.load(r);if(e){i=JSON.parse(localStorage._request_queue||"{}"),localStorage._request_queue="{}",c=[];for(t in i)u=i[t],c.push(n.load(u));return c}},t="http://localhost:3000/e",n.page({url:document.URL+"load",referrer:document.referrer,title:document.title}),window.onload=function(){return i.ready()}}).call(this);