# This should all be in a JS file or something, proof of concept for now...

# jQuip
jquip = '''
window.$=window.jquip=function(){function t(t,e){for(var n,r=0,i=Me.length;i>r;r++)if(Me[r].apply(this,arguments))return this;return t?O(t)?(V?t():ee.push(t),this):q(t)?this.make(t):t.nodeType||B(t)?this.make([t]):\"body\"==t&&!e&&Z.body?(this.context=t.context,this[0]=Z.body,this.length=1,this.selector=t,this):void 0!==t.selector?(this.context=t.context,this.selector=t.selector,this.make(t)):(t=k(t)&&\"<\"===t.charAt(0)?(n=ge.exec(t))?[Z.createElement(n[1])]:_(t).childNodes:c(this.selector=t,e),this.make(t),L(e)&&this.attr(e),this):this}function e(e,n){return new t(e,n)}function n(t){return!t||!t.parentNode||11==t.parentNode.nodeType}function r(t,n,r){if(n=n||0,O(n))return N(t,function(t,e){return!!n.call(t,e,t)===r});if(n.nodeType)return N(t,function(t){return t===n===r});if(k(n)){var i=\":\"==n.charAt(0)&&e.Expr[n.substring(1)];return N(t,function(t){var e,r=t.parentNode,o=!r;return o&&(r=_e,r.appendChild(t)),e=i?i(t):t.parentNode&&y(c(n,t.parentNode),t)>=0,o&&r.removeChild(t),e})}return N(t,function(t){return y(n,t)>=0===r})}function i(t,e,n){var r=t[Ie];return E(n)?(r||(r=t[Ie]=He++),(We[r]||(We[r]={}))[e]=n):r&&We[r]&&(e?We[r][e]:We[r])}function o(t){if(!Qe[t]){var n=e(\"<\"+t+\">\").appendTo(Z.body),r=e.css&&e.css(n[0],\"display\")||n[0].style.display;n.remove(),Qe[t]=r}return Qe[t]}function s(t,e){if(t.length=e&&e.length||0,0===t.length)return t;for(var n=0,r=e.length;r>n;n++)t[n]=e[n];return t}function u(t,e){e=\" \"+e+\" \";for(var n=0,r=t.length;r>n;n++)if(a(t[n],e))return!0;return!1}function a(t,e){return 1===t.nodeType&&(\" \"+t.className+\" \").replace(ue,\" \").indexOf(e)>-1}function l(t,e,n){e=e||Z,n=n||[],1==e.nodeType&&t(e)&&n.push(e);for(var r=e.childNodes,i=0,o=r.length;o>i;i++){var s=r[i];1==s.nodeType&&l(t,s,n)}return n}function c(t,n,r){if(t&&k(t)){n instanceof e&&(n=n[0]),n=n||Z,r=r||e.query;var i,o=t.substring(1);return le.test(t)&&n===Z?(i=Z.getElementById(o))?[i]:[]:I(ce.test(t)&&n.getElementsByClassName?n.getElementsByClassName(o):ae.test(t)?n.getElementsByTagName(t):r(t,n))}return 1==t.nodeType||9==t.nodeType?[t]:[]}function f(t,e,n){var r,i=Z.head||Z.getElementsByTagName(\"head\")[0]||te,o=Z.createElement(\"script\");n&&(o.async=\"async\"),o.onreadystatechange=function(){(r=o.readyState)&&\"loaded\"!=r&&\"complete\"!=r||(o.onload=o.onreadystatechange=null,i&&o.parentNode&&i.removeChild(o),o=void 0,e&&e())},o.onload=e,o.src=t,i.insertBefore(o,i.firstChild)}function h(){K.console&&K.console.warn(arguments)}function d(t,e,n){if(null!=t)if(Le&&t.forEach===Le)t.forEach(e,n);else if(t.length===+t.length){for(var r=0,i=t.length;i>r;r++)if(r in t&&e.call(n,t[r],r,t)===ke)return}else for(var o in t)if(qe.call(t,o)&&e.call(n,t[o],o,t)===ke)return}function p(t,e){if(t&&t.getAttribute&&e){var n=t.hasAttribute&&t.hasAttribute(e)?t.getAttribute(e):t[e];return null===n?void 0:n}}function g(t,n){return E(t)?e(n).filter(t):e(n)}function y(t,e){if(null==t)return-1;var n,r;if(ze&&t.indexOf===ze)return t.indexOf(e);for(n=0,r=t.length;r>n;n++)if(t[n]===e)return n;return-1}function m(t,e,n){var r=[];return null==t?r:Pe&&t.filter===Pe?t.filter(e,n):(d(t,function(t,i,o){e.call(n,t,i,o)&&(r[r.length]=t)}),r)}function v(t,n,r){for(var i=[],o=t[n];o&&9!==o.nodeType&&(void 0===r||1!==o.nodeType||!e(o).is(r));)1===o.nodeType&&i.push(o),o=o[n];return i}function b(t,e,n){e=e||1;for(var r=0;t&&(1!==t.nodeType||++r!==e);t=t[n]);return t}function x(t,e){for(var n=[];t;t=t.nextSibling)1===t.nodeType&&t!==e&&n.push(t);return n}function N(t,e,n){var r,i=[];n=!!n;for(var o=0,s=t.length;s>o;o++)r=!!e(t[o],o),n!==r&&i.push(t[o]);return i}function T(t,n,r){var i,o,s=[],u=0,a=t.length,l=t instanceof e||\"number\"==typeof a&&(a>0&&t[0]&&t[a-1]||0===a||q(t));if(l)for(;a>u;u++)i=n(t[u],u,r),null!=i&&(s[s.length]=i);else for(o in t)i=n(t[o],o,r),null!=i&&(s[s.length]=i);return s.concat.apply([],s)}function w(t,e,n){if(!t)return{};var r=i(t,e,n);return r||C(t)[\"data-\"+e]}function C(t){var e={};if(1==t.nodeType)for(var n=0,r=t.attributes,i=r.length;i>n;n++)e[r.item(n).nodeName]=r.item(n).nodeValue;return e}function A(t,e){return t&&e?t.toLowerCase()===e.toLowerCase():t==e}function S(t){return null==t?String(t):Ce[we.call(t)]||\"object\"}function E(t){return void 0!==t}function k(t){return\"string\"==typeof t}function j(t){return\"object\"==typeof t}function O(t){return\"function\"==typeof t||\"function\"===S(t)}function q(t){return\"array\"===S(t)}function D(t){return!k(t)&&\"number\"==typeof t.length}function B(t){return t&&\"object\"==typeof t&&\"setInterval\"in t}function $(t){return null==t||!he.test(t)||isNaN(t)}function L(t){if(!t||\"object\"!==S(t)||t.nodeType||B(t))return!1;try{if(t.constructor&&!qe.call(t,\"constructor\")&&!qe.call(t.constructor.prototype,\"isPrototypeOf\"))return!1}catch(e){return!1}var n;for(n in t);return void 0===n||qe.call(t,n)}function P(t,e){var n=t.length,r=0;if(\"number\"==typeof e.length)for(var i=e.length;i>r;r++)t[n++]=e[r];else for(;void 0!==e[r];)t[n++]=e[r++];return t.length=n,t}function z(){var t,e,n,r,i,o,s=arguments,u=s[0]||{},a=1,l=s.length,c=!1;for(\"boolean\"==typeof u&&(c=u,u=s[1]||{},a=2),\"object\"==typeof u||O(u)||(u={}),l===a&&(u=this,--a);l>a;a++)if(null!=(t=s[a]))for(e in t)n=u[e],r=t[e],u!==r&&(c&&r&&(L(r)||(i=q(r)))?(i?(i=!1,o=n&&q(n)?n:[]):o=n&&L(n)?n:{},u[e]=z(c,o,r)):void 0!==r&&(u[e]=r));return u}function I(t,e){var n=e||[];if(null!=t){var r=S(t);null==t.length||\"string\"==r||\"function\"==r||\"regexp\"===r||B(t)?Be.call(n,t):P(n,t)}return n}function _(t,e,n){if(e=e||Z||e.ownerDocument||e[0]&&e[0].ownerDocument||Z,n=n||e.createDocumentFragment(),D(t))return M(t,e,n)&&n;for(var r=F(t);r.firstChild;)n.appendChild(r.firstChild);return n}function F(t,e){var n=(e||Z).createElement(\"div\"),r=(se.exec(t)||[\"\",\"\"])[1].toLowerCase(),i=Ee[r]||Ee._default,o=i[0];for(n.innerHTML=i[1]+t+i[2];o--;)n=n.lastChild;return n}function M(t,e,n){var r,i,o=[];for(r=0;null!=(i=t[r]);r++)k(i)&&(i=F(i,e)),i.nodeType?o.push(i):o=P(o,i);if(n)for(r=0;r<o.length;r++)o[r].nodeType&&n.appendChild(o[r]);return o}function U(t){if(J&&(Ae=Se,t.sort(J),Ae))for(var e=1;e<t.length;e++)t[e]===t[e-1]&&t.splice(e--,1);return t}function H(){if(!Z.body)return null;var t=Z.createElement(\"div\");Z.body.appendChild(t),t.style.width=\"20px\",t.style.padding=\"10px\";var e=t.offsetWidth;return Z.body.removeChild(t),40==e}function W(t,e){ne.push({url:t,cb:e})}function Q(){d(ee,function(t){t()}),V=!0}var V,R,G,J,K=window,X=\"http:\/\/cdnjs.cloudflare.com\/ajax\/libs\/sizzle\/1.4.4\/sizzle.min.js\",Y=function(){return K.Sizzle||K.qwery},Z=document,te=Z.documentElement,ee=[],ne=[],re=\/Until$\/,ie=\/,\/,oe=\/^(?:parents|prevUntil|prevAll)\/,se=\/<([\\w:]+)\/,ue=\/[\\n\\t\\r]\/g,ae=\/^[\\w-]+$\/,le=\/^#[\\w-]+$\/,ce=\/^\\.[\\w-]+$\/,fe=\/\\s+\/,he=\/\\d\/,de=\/\\S\/,pe=\/\\r\\n\/g,ge=\/^<(\\w+)\\s*\\\/?>(?:<\\\/\\1>)?$\/,ye=\/\\r?\\n\/g,me=\/^(?:select|textarea)\/i,ve=\/^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$\/i,be=String.prototype.trim,xe=\/^\\s+\/,Ne=\/\\s+$\/,Te={children:!0,contents:!0,next:!0,prev:!0},we=Object.prototype.toString,Ce={},Ae=!1,Se=!0,Ee={option:[1,\"<select multiple=\'multiple\'>\",\"<\/select>\"],legend:[1,\"<fieldset>\",\"<\/fieldset>\"],thead:[1,\"<table>\",\"<\/table>\"],tr:[2,\"<table><tbody>\",\"<\/tbody><\/table>\"],td:[3,\"<table><tbody><tr>\",\"<\/tr><\/tbody><\/table>\"],col:[2,\"<table><tbody><\/tbody><colgroup>\",\"<\/colgroup><\/table>\"],area:[1,\"<map>\",\"<\/map>\"],_default:[0,\"\",\"\"]},ke={},je=Array.prototype,Oe=Object.prototype,qe=Oe.hasOwnProperty,De=je.slice,Be=je.push,$e=je.indexOf,Le=je.forEach,Pe=je.filter,ze=je.indexOf,Ie=\"jq-\"+ +new Date,_e=Z.createElement(\"p\");de.test(\"\u00A0\")&&(xe=\/^[\\s\\xA0]+\/,Ne=\/[\\s\\xA0]+$\/);var Fe,Me=[],Ue={},He=1,We={_id:0},Qe={};Fe=t.prototype=e.prototype=e.fn={constructor:e,selector:\"\",length:0,dm:function(t,e,n){var r,i,o,s,u,a=t[0];if(a&&this[0]){if(!(i=3===a.nodeType&&a)&&(r=a&&a.parentNode,i=r&&11===r.nodeType&&r.childNodes.length===this.length?r:_(a),o=i.firstChild,1===i.childNodes.length&&(i=o),!o))return this;for(u=0,s=this.length;s>u;u++)n.call(this[u],0==u?i:i.cloneNode(!0))}return this},ps:function(t,e,n){var r=this.constructor();return q(t)?Be.apply(r,t):P(r,t),r.prevObject=this,r.context=this.context,\"find\"===e?r.selector=this.selector+(this.selector?\" \":\"\")+n:e&&(r.selector=this.selector+\".\"+e+\"(\"+n+\")\"),r}},Fe.make=function(t){return s(this,t),this},Fe.toArray=function(){return De.call(this,0)},Fe.get=function(t){return E(t)?0>t?this[this.length+t]:this[t]:this.toArray()},Fe.add=function(t,r){var i=\"string\"==typeof t?e(t,r):I(t&&t.nodeType?[t]:t),o=P(this.get(),i);return this.ps(n(i[0])||n(o[0])?o:U(o))},Fe.each=function(t){if(!O(t))return this;for(var e=0,n=this.length;n>e;e++)t.call(this[e],e,this[e]);return this},Fe.attr=function(t,e){var n=this[0];return k(t)&&void 0===e?p(n,t):this.each(function(n){var r=this.nodeType;if(3!==r&&8!==r&&2!==r)if(j(t))for(var i in t)null===e?this.removeAttribute(t):this.setAttribute(i,t[i]);else this.setAttribute(t,O(e)?e.call(this,n,this.getAttribute(t)):e)})},Fe.removeAttr=function(t){return this.each(function(){1==this.nodeType&&this.removeAttribute(t)})},Fe.data=function(t,e){return void 0===e?w(this[0],t):this.each(function(){w(this,t,e)})},Fe.append=function(){return this.dm(arguments,!0,function(t){1===this.nodeType&&this.appendChild(t)})},Fe.prepend=function(){return this.dm(arguments,!0,function(t){1===this.nodeType&&this.insertBefore(t,this.firstChild)})},Fe.before=function(){return this[0]&&this[0].parentNode?this.dm(arguments,!1,function(t){this.parentNode.insertBefore(t,this)}):this},Fe.after=function(){return this[0]&&this[0].parentNode?this.dm(arguments,!1,function(t){this.parentNode.insertBefore(t,this.nextSibling)}):this},Fe.replaceWith=function(t){var n=this,r=O(t);return this.each(function(i){var o=this.nextSibling,s=this.parentNode,u=r?t.call(this,i,this):t;s&&11!=s.nodeType?(s.removeChild(this),o?e(o).before(u):e(s).append(u)):n[i]=e(u).clone()[0]})},Fe.hide=function(){return this.each(function(){\"none\"!=this.style.display&&(i(this,\"display\",this.style.display),this.style.display=\"none\")})},Fe.show=function(){return this.each(function(){this.style.display=i(this,\"display\")||o(this.tagName)})},Fe.toggle=function(){return this.each(function(){var t=e(this);e.Expr.hidden(this)?t.show():t.hide()})},Fe.eq=function(t){return-1===t?this.slice(t):this.slice(t,+t+1)},Fe.first=function(){return this.eq(0)},Fe.last=function(){return this.eq(-1)},Fe.slice=function(){return this.ps(De.apply(this,arguments),\"slice\",De.call(arguments).join(\",\"))},Fe.map=function(t){return this.ps(T(this,function(e,n){return t.call(e,n,e)}))},Fe.find=function(t){var n,r,i=this;if(!k(t))return e(t).filter(function(){for(n=0,r=i.length;r>n;n++)if(G(i[n],this))return!0});var o,s,u,a=this.ps(\"\",\"find\",t);for(n=0,r=this.length;r>n;n++)if(o=a.length,P(a,e(t,this[n])),0===n)for(s=o;s<a.length;s++)for(u=0;o>u;u++)if(a[u]===a[s]){a.splice(s--,1);break}return a},Fe.not=function(t){return this.ps(r(this,t,!1),\"not\",t)},Fe.filter=function(t){return this.ps(r(this,t,!0),\"filter\",t)},Fe.indexOf=function(t){return y(this,t)},Fe.is=function(t){return this.length>0&&e(this[0]).filter(t).length>0},Fe.remove=function(){for(var t,e=0;E(t=this[e]);e++)t.parentNode&&t.parentNode.removeChild(t);return this},Fe.closest=function(t,e){var n,r,i,o=[];for(n=0,r=this.length;r>n;n++)for(i=this[n];i;){if(g(t,[i]).length>0){o.push(i);break}if(i=i.parentNode,!i||!i.ownerDocument||i===e||11===i.nodeType)break}return o=o.length>1?U(o):o,this.ps(o,\"closest\",t)},Fe.val=function(t){return E(t)?this.each(function(){this.value=t}):this[0]&&this[0].value||\"\"},Fe.html=function(t){return E(t)?this.each(function(){this.innerHTML=t}):this[0]&&this[0].innerHTML||\"\"},Fe.text=function(t){var e,n=this[0];return E(t)?this.empty().append((n&&n.ownerDocument||Z).createTextNode(t)):n&&(e=n.nodeType)?1===e||9===e?k(n.textContent)?n.textContent:n.innerText.replace(pe,\"\"):3===e||4===e?n.nodeValue:null:null},Fe.empty=function(){var t,e;for(t=0;E(e=this[t]);t++)for(;e.firstChild;)e.removeChild(e.firstChild);return this},Fe.addClass=function(t){var n,r,i,o,s,u,a;if(O(t))return this.each(function(n){e(this).addClass(t.call(this,n,this.className))});if(t&&k(t))for(n=t.split(fe),r=0,i=this.length;i>r;r++)if(o=this[r],o&&1===o.nodeType)if(o.className||1!==n.length){for(s=\" \"+o.className+\" \",u=0,a=n.length;a>u;u++)~s.indexOf(\" \"+n[u]+\" \")||(s+=n[u]+\" \");o.className=R(s)}else o.className=t;return this},Fe.removeClass=function(t){var n,r,i,o,s,u,a;if(O(t))return this.each(function(n){e(this).removeClass(t.call(this,n,this.className))});if(t&&k(t)||void 0===t)for(n=(t||\"\").split(fe),r=0,i=this.length;i>r;r++)if(o=this[r],1===o.nodeType&&o.className)if(t){for(s=(\" \"+o.className+\" \").replace(ue,\" \"),u=0,a=n.length;a>u;u++)s=s.replace(\" \"+n[u]+\" \",\" \");o.className=R(s)}else o.className=\"\";return this},Fe.hasClass=function(t){return u(this,t)},Fe.fadeIn=function(){this.each(function(){e(this).show()})},Fe.fadeOut=function(){this.each(function(){e(this).hide()})},Fe.serializeArray=function(){return this.map(function(){return this.elements?I(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||me.test(this.nodeName)||ve.test(this.type))}).map(function(t,n){var r=e(this).val();return null==r||q(r)?T(r,function(t){return{name:n.name,value:t.replace(ye,\"\\r\\n\")}}):{name:n.name,value:r.replace(ye,\"\\r\\n\")}}).get()},Fe.wrap=function(t){return this.each(function(){var n=e(e(t)[0].cloneNode(!1));e(this).before(n),n.append(e(this))})},Fe.prop=function(t,e){return E(e)?this.each(function(){this[t]=e}):this[0]&&this[0][t]},Fe.clone=function(){return e(this.map(function(){return this.cloneNode(!0)}))},Fe.toggleClass=function(t,n){return this.each(function(){var r=e(this);(E(n)?n:!r.hasClass(t))?r.addClass(t):r.removeClass(t)})},e.Expr={hidden:function(t){return\"none\"===(e.css&&e.css(t,\"display\")||t.style.display)},visible:function(t){return!e.Expr.hidden(t)}},e.hasClass=u,e.walk=l,e.$$=c,e.setQuery=function(t){e.query=function(e,n){return c(e,n,t||function(t,e){return e.querySelectorAll(t)})}};var Ve=Y();e.setQuery(Ve||function(t,e){return(e=e||Z).querySelectorAll?I(e.querySelectorAll(t)):[]}),e.loadScript=f,e.each=function(t,e,n){var r,i=0,o=t.length,s=void 0===o||O(t);if(n)if(s){for(r in t)if(e.apply(t[r],n)===!1)break}else for(;o>i&&e.apply(t[i++],n)!==!1;);else if(s){for(r in t)if(e.call(t[r],r,t[r])===!1)break}else for(;o>i&&e.call(t[i],i,t[i++])!==!1;);return t},e._each=d,e.filter=g,e._indexOf=y,e._defaults=function(t){return d(De.call(arguments,1),function(e){for(var n in e)null==t[n]&&(t[n]=e[n])}),t},e._filter=m,e.proxy=function(t,e){if(\"string\"==typeof e){var n=t[e];e=t,t=n}if(O(t)){var r=De.call(arguments,2),i=function(){return t.apply(e,r.concat(De.call(arguments)))};return i.guid=t.guid=t.guid||i.guid||He++,i}},e.dir=v,e.nth=b,e.sibling=x,e.grep=N,e.map=T,e.data=w,e.attrs=C,e.eqSI=A,R=be?function(t){return null==t?\"\":be.call(t)}:function(t){return null==t?\"\":t.toString().replace(xe,\"\").replace(Ne,\"\")},e.trim=R,e.indexOf=e.inArray=function(t,e){if(!e)return-1;if($e)return $e.call(e,t);for(var n=0,r=e.length;r>n;n++)if(e[n]===t)return n;return-1},d(\"Boolean Number String Function Array Date RegExp Object\".split(\" \"),function(t){return Ce[\"[object \"+t+\"]\"]=t.toLowerCase(),this}),e.type=S,e.isFunction=O,e.isArray=Array.isArray||q,e.isWindow=B,e.isNaN=$,e.merge=P,e.extend=e.fn.extend=z,e.makeArray=I,e.htmlFrag=_;var Re=function(t,e,n){if(t===e)return n;for(var r=t.nextSibling;r;){if(r===e)return-1;r=r.nextSibling}return 1};return G=e.contains=te.contains?function(t,e){return t!==e&&(t.contains?t.contains(e):!0)}:function(){return!1},J=te.compareDocumentPosition?(G=function(t,e){return!!(16&t.compareDocumentPosition(e))})&&function(t,e){return t===e?(Ae=!0,0):t.compareDocumentPosition&&e.compareDocumentPosition?4&t.compareDocumentPosition(e)?-1:1:t.compareDocumentPosition?-1:1}:function(t,e){if(t===e)return Ae=!0,0;if(t.sourceIndex&&e.sourceIndex)return t.sourceIndex-e.sourceIndex;var n,r,i=[],o=[],s=t.parentNode,u=e.parentNode,a=s;if(s===u)return Re(t,e);if(!s)return-1;if(!u)return 1;for(;a;)i.unshift(a),a=a.parentNode;for(a=u;a;)o.unshift(a),a=a.parentNode;n=i.length,r=o.length;for(var l=0;n>l&&r>l;l++)if(i[l]!==o[l])return Re(i[l],o[l]);return l===n?Re(t,o[l],-1):Re(i[l],e,1)},e.unique=U,d({parent:function(t){var e=t.parentNode;return e&&11!==e.nodeType?e:null},parents:function(t){return v(t,\"parentNode\")},parentsUntil:function(t,e,n){return v(t,\"parentNode\",n)},next:function(t){return b(t,2,\"nextSibling\")},prev:function(t){return b(t,2,\"previousSibling\")},nextAll:function(t){return v(t,\"nextSibling\")},prevAll:function(t){return v(t,\"previousSibling\")},nextUntil:function(t,e,n){return v(t,\"nextSibling\",n)},prevUntil:function(t,e,n){return v(t,\"previousSibling\",n)},siblings:function(t){return x(t.parentNode.firstChild,t)},children:function(t){return x(t.firstChild)},contents:function(t){return\"iframe\"===t.nodeName?t.contentDocument||t.contentWindow[\"document \"]:I(t.childNodes)}},function(t,n){e.fn[n]=function(e,r){var i=T(this,t,e),o=De.call(arguments);return re.test(n)||(r=e),k(r)&&(i=I(g(r,i))),i=this.length>1&&!Te[n]?U(i):i,(this.length>1||ie.test(r))&&oe.test(n)&&(i=i.reverse()),this.ps(i,n,o.join(\",\"))}}),d({appendTo:\"append\",prependTo:\"prepend\",insertBefore:\"before\",insertAfter:\"after\"},function(t,n){e.fn[n]=function(r){var i,o,s,u=[],a=e(r),l=1===this.length&&this[0].parentNode;if(l&&11===l.nodeType&&1===l.childNodes.length&&1===a.length)return a[t](this[0]),this;for(i=0,s=a.length;s>i;i++)o=(i>0?this.clone(!0):this).get(),e(a[i])[t](o),u=u.concat(o);return this.ps(u,n,a.selector)}}),function(){var t=document.createElement(\"div\");t.style.display=\"none\",t.innerHTML=\"   <link\/><table><\/table><a href=\'\/a\' style=\'color:red;float:left;opacity:.55;\'>a<\/a><input type=\'checkbox\'\/>\";var n=t.getElementsByTagName(\"a\")[0];e.support={boxModel:null,opacity:\/^0.55$\/.test(n.style.opacity),cssFloat:!!n.style.cssFloat};var r,i=\/(webkit)[ \\\/]([\\w.]+)\/,o=\/(opera)(?:.*version)?[ \\\/]([\\w.]+)\/,s=\/(msie) ([\\w.]+)\/,u=\/(mozilla)(?:.*? rv:([\\w.]+))?\/,a=navigator.userAgent.toLowerCase(),l=i.exec(a)||o.exec(a)||s.exec(a)||a.indexOf(\"compatible\")<0&&u.exec(a)||[];r=e.browser={version:l[2]||\"0\"},r[l[1]||\"\"]=!0}(),e.scriptsLoaded=function(t){O(t)&&ee.push(t)},e.loadAsync=W,Ve||Z.querySelectorAll||W(X,function(){e.setQuery(Y())}),e.init=!1,e.onload=function(){if(!e.init)try{e.support.boxModel=H();var t=0;d(ne,function(e){t++,f(e.url,function(){try{e.cb&&e.cb()}catch(n){}--t||Q()})}),e.init=!0,t||Q()}catch(n){h(n)}},Z.body&&!e.init&&setTimeout(e.onload,1),e.hook=function(t){Me.push(t)},e.plug=function(t,n){var r=k(t)?t:t.name;if(n=O(t)?t:n,!O(n))throw\"Plugin fn required\";r&&n&&(Ue[r]=n),n(e)},e}();;$.plug(\"docready\",function(e){function t(){if(!c){try{r.documentElement.doScroll(\"left\")}catch(e){return void setTimeout(t,1)}n()}}function n(t){if(t===!0&&u--,!u||t!==!0&&!c){if(!r.body)return setTimeout(o,1);if(c=!0,t!==!0&&--u>0)return;if(i){var n,d=0,o=i;for(i=null;n=o[d++];)n.call(r,e);e.fn.trigger&&e(r).trigger(\"ready\").unbind(\"ready\")}}}var d,o,a=window,r=document,i=[],c=!1,u=1;e.hook(function(e){return\"function\"==typeof e?(this.ready(e),!0):void 0}),e.ready=n,d=r.addEventListener?function(){r.removeEventListener(\"DOMContentLoaded\",d,!1),n()}:function(){\"complete\"===r.readyState&&(r.detachEvent(\"onreadystatechange\",d),n())},e.bindReady=function(){if(!o){if(o=!0,\"complete\"===r.readyState)return setTimeout(n,1);if(r.addEventListener)r.addEventListener(\"DOMContentLoaded\",d,!1),a.addEventListener(\"load\",n,!1);else if(r.attachEvent){r.attachEvent(\"onreadystatechange\",d),a.attachEvent(\"onload\",n);var e=!1;try{e=null==window.frameElement}catch(i){}r.documentElement.doScroll&&e&&t()}}},e.fn.ready=function(t){return e.bindReady(),c?t.call(r,e):i&&i.push(t),this},e.init||e(document).ready(e.onload)});;$.plug(\"css\",function(t){function e(e,o,i){var r=\"width\"===o?e.offsetWidth:e.offsetHeight,s=\"width\"===o?T:w;return r>0?(\"border\"!==i&&t.each(s,function(){i||(r-=parseFloat(n(e,\"padding\"+this))||0),\"margin\"===i?r+=parseFloat(n(e,i+this))||0:r-=parseFloat(n(e,\"border\"+this+\"Width\"))||0}),r+\"px\"):\"\"}function o(e,o,n,i){if(e&&3!==e.nodeType&&8!==e.nodeType&&e.style){var s,l=r(o),f=e.style,a=t.cssHooks[l];if(o=t.cssProps[l]||l,void 0===n)return a&&\"get\"in a&&void 0!==(s=a.get(e,!1,i))?s:f[o];if(!(\"number\"==typeof n&&isNaN(n)||null==n||(\"number\"!=typeof n||t.cssNumber[l]||(n+=\"px\"),a&&\"set\"in a&&void 0===(n=a.set(e,n)))))try{f[o]=n}catch(p){}}}function n(e,o,n){var i,s=r(o),l=t.cssHooks[s];return o=t.cssProps[s]||s,l&&\"get\"in l&&void 0!==(i=l.get(e,!0,n))?i:f?f(e,o,s):void 0}function i(t,e,o){var n,i={};for(var n in e)i[n]=t.style[n],t.style[n]=e[n];o.call(t);for(n in e)t.style[n]=i[n]}function r(t){return t.replace(y,F)}function s(e,o,n,i,r,l){var f=e.length;if(\"object\"==typeof o){for(var a in o)s(e,a,o[a],i,r,n);return e}if(void 0!==n){i=!l&&i&&t.isFunction(n);for(var p=0;f>p;p++)r(e[p],o,i?n.call(e[p],p,r(e[p],o)):n,l);return e}return f?r(e[0],o):void 0}function l(e){return t.isWindow(e)?e:9===e.nodeType?e.defaultView||e.parentWindow:!1}var f,a,p,u=document,c=u.documentElement,d=\/alpha\\([^)]*\\)\/i,h=\/opacity=([^)]*)\/,y=\/-([a-z])\/gi,m=\/([A-Z])\/g,v=\/^-?\\d+(?:px)?$\/i,g=\/^-?\\d\/,b=\/^(?:body|html)$\/i,x={position:\"absolute\",visibility:\"hidden\",display:\"block\"},T=[\"Left\",\"Right\"],w=[\"Top\",\"Bottom\"],F=function(t,e){return e.toUpperCase()};t.cssHooks={opacity:{get:function(t,e){if(!e)return t.style.opacity;var o=f(t,\"opacity\",\"opacity\");return\"\"===o?\"1\":o}}},t._each([\"height\",\"width\"],function(o){t.cssHooks[o]={get:function(t,n,r){var s;return n?0!==t.offsetWidth?e(t,o,r):(i(t,x,function(){s=e(t,o,r)}),s):void 0},set:function(t,e){return v.test(e)?(e=parseFloat(e),e>=0?e+\"px\":void 0):e}}}),t.support.opacity||(t.support.opacity={get:function(t,e){return h.test((e&&t.currentStyle?t.currentStyle.filter:t.style.filter)||\"\")?parseFloat(RegExp.$1)\/100+\"\":e?\"1\":\"\"},set:function(e,o){var n=e.style;n.zoom=1;var i=t.isNaN(o)?\"\":\"alpha(opacity=\"+100*o+\")\",r=n.filter||\"\";n.filter=d.test(r)?r.replace(d,i):n.filter+\" \"+i}}),u.defaultView&&u.defaultView.getComputedStyle&&(a=function(e,o,n){var i,r,s;return n=n.replace(m,\"-$1\").toLowerCase(),(r=e.ownerDocument.defaultView)?((s=r.getComputedStyle(e,null))&&(i=s.getPropertyValue(n),\"\"!==i||t.contains(e.ownerDocument.documentElement,e)||(i=t.style(e,n))),i):void 0}),u.documentElement.currentStyle&&(p=function(t,e){var o,n=t.currentStyle&&t.currentStyle[e],i=t.runtimeStyle&&t.runtimeStyle[e],r=t.style;return!v.test(n)&&g.test(n)&&(o=r.left,i&&(t.runtimeStyle.left=t.currentStyle.left),r.left=\"fontSize\"===e?\"1em\":n||0,n=r.pixelLeft+\"px\",r.left=o,i&&(t.runtimeStyle.left=i)),\"\"===n?\"auto\":n}),f=a||p,t.fn.css=function(t,e){return 2===arguments.length&&void 0===e?this:s(this,t,e,!0,function(t,e,i){return void 0!==i?o(t,e,i):n(t,e)})},t.cssNumber={zIndex:!0,fontWeight:!0,opacity:!0,zoom:!0,lineHeight:!0},t.cssProps={\"float\":t.support.cssFloat?\"cssFloat\":\"styleFloat\"},t.style=o,t.css=n,t.swap=i,t.camelCase=r;var S,C,L,E,N,W,H=function(){if(!S){var e,o,i,r=u.body,s=u.createElement(\"div\"),l=parseFloat(n(r,\"marginTop\"))||0,f=\"<div style=\'position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;\'><div><\/div><\/div><table style=\'position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;\' cellpadding=\'0\' cellspacing=\'0\'><tr><td><\/td><\/tr><\/table>\";t.extend(s.style,{position:\"absolute\",top:0,left:0,margin:0,border:0,width:\"1px\",height:\"1px\",visibility:\"hidden\"}),s.innerHTML=f,r.insertBefore(s,r.firstChild),e=s.firstChild,o=e.firstChild,i=e.nextSibling.firstChild.firstChild,N=5!==o.offsetTop,W=5===i.offsetTop,o.style.position=\"fixed\",o.style.top=\"20px\",E=20===o.offsetTop||15===o.offsetTop,o.style.position=o.style.top=\"\",e.style.overflow=\"hidden\",e.style.position=\"relative\",L=-5===o.offsetTop,C=r.offsetTop!==l,r.removeChild(s),S=!0}},P=function(t){var e=t.offsetTop,o=t.offsetLeft;return H(),C&&(e+=parseFloat(n(t,\"marginTop\"))||0,o+=parseFloat(n(t,\"marginLeft\"))||0),{top:e,left:o}};t.fn.offset=function(){var e,o=this[0];if(!o||!o.ownerDocument)return null;if(o===o.ownerDocument.body)return P(o);try{e=o.getBoundingClientRect()}catch(n){}if(!e||!t.contains(c,o))return e?{top:e.top,left:e.left}:{top:0,left:0};var i=u.body,r=l(u),s=c.clientTop||i.clientTop||0,f=c.clientLeft||i.clientLeft||0,a=r.pageYOffset||t.support.boxModel&&c.scrollTop||i.scrollTop,p=r.pageXOffset||t.support.boxModel&&c.scrollLeft||i.scrollLeft,d=e.top+a-s,h=e.left+p-f;return{top:d,left:h}},t.fn.position=function(){if(!this[0])return null;var t=this[0],e=this.offsetParent(),o=this.offset(),i=b.test(e[0].nodeName)?{top:0,left:0}:e.offset();return o.top-=parseFloat(n(t,\"marginTop\"))||0,o.left-=parseFloat(n(t,\"marginLeft\"))||0,i.top+=parseFloat(n(e[0],\"borderTopWidth\"))||0,i.left+=parseFloat(n(e[0],\"borderLeftWidth\"))||0,{top:o.top-i.top,left:o.left-i.left}},t.fn.offsetParent=function(){return this.map(function(){for(var t=this.offsetParent||u.body;t&&!b.test(t.nodeName)&&\"static\"===n(t,\"position\");)t=t.offsetParent;return t})},t._each([\"Height\",\"Width\"],function(e){var o=e.toLowerCase();t.fn[\"inner\"+e]=function(){var t=this[0];return t&&t.style?parseFloat(n(t,o,\"padding\")):null},t.fn[\"outer\"+e]=function(t){var e=this[0];return e&&e.style?parseFloat(n(e,o,t?\"margin\":\"border\")):null},t.fn[o]=function(i){var r=this[0];if(!r)return null==i?null:this;if(t.isFunction(i))return this.each(function(e){var n=t(this);n[o](i.call(this,e,n[o]()))});if(t.isWindow(r)){var s=r.document.documentElement[\"client\"+e],l=r.document.body;return\"CSS1Compat\"===r.document.compatMode&&s||l&&l[\"client\"+e]||s}if(9===r.nodeType)return Math.max(r.documentElement[\"client\"+e],r.body[\"scroll\"+e],r.documentElement[\"scroll\"+e],r.body[\"offset\"+e],r.documentElement[\"offset\"+e]);if(void 0===i){var f=n(r,o),a=parseFloat(f);return t.isNaN(a)?f:a}return this.css(o,\"string\"==typeof i?i:i+\"px\")}}),t._each([\"Left\",\"Top\"],function(e,o){var n=\"scroll\"+e;t.fn[n]=function(e){var i,r;return void 0===e?(i=this[0])?(r=l(i),r?\"pageXOffset\"in r?r[o?\"pageYOffset\":\"pageXOffset\"]:t.support.boxModel&&r.document.documentElement[n]||r.document.body[n]:i[n]):null:this.each(function(){r=l(this),r?r.scrollTo(o?t(r).scrollLeft():e,o?e:t(r).scrollTop()):this[n]=e})}})});
'''

# Random weight function
randomWeight = 'weight=function(a){var b,c,d,e,f,g,h,i;for(e=0,c=0,f=0,h=a.length;h>f;f++)b=a[f],e+=b.weight;for(d=Math.floor(Math.random()*e),g=0,i=a.length;i>g;g++)if(b=a[g],c+=b.weight,c>d)return b};'

###
randomWeight = (array) ->
  totalWeight = 0
  minWeight = 0
  
  for item in array
    totalWeight += item.weight
  
  random = Math.floor(Math.random() * totalWeight)
  
  for item in array
    minWeight += item.weight
    
    if random < minWeight
      return item
###

applyWeight = 'window.userlift.experiment.bucket=weight(window.userlift.experiment.data.buckets);$(function() {eval(window.userlift.experiment.bucket.code);});'

# TODO: Clean up, cookies

exports.combined = jquip + randomWeight + applyWeight