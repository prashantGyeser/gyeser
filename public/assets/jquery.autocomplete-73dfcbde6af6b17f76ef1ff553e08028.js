/**
*  Ajax Autocomplete for jQuery, version 1.1.3
*  (c) 2010 Tomas Kirda
*
*  Ajax Autocomplete for jQuery is freely distributable under the terms of an MIT-style license.
*  For details, see the web site: http://www.devbridge.com/projects/autocomplete/jquery/
*
*  Last Review: 04/19/2010
*/
/*jslint onevar: true, evil: true, nomen: true, eqeqeq: true, bitwise: true, regexp: true, newcap: true, immed: true */
/*global window: true, document: true, clearInterval: true, setInterval: true, jQuery: true */
(function($){function fnFormatResult(e,t,n){var r="("+n.replace(reEscape,"\\$1")+")";return e.replace(new RegExp(r,"gi"),"<strong>$1</strong>")}function Autocomplete(e,t){this.el=$(e),this.el.attr("autocomplete","off"),this.suggestions=[],this.data=[],this.badQueries=[],this.selectedIndex=-1,this.currentValue=this.el.val(),this.intervalId=0,this.cachedResponse=[],this.onChangeInterval=null,this.ignoreValueChange=!1,this.serviceUrl=t.serviceUrl,this.isLocal=!1,this.options={autoSubmit:!1,minChars:1,maxHeight:300,deferRequestBy:0,width:0,highlight:!0,params:{},fnFormatResult:fnFormatResult,delimiter:null,zIndex:9999},this.initialize(),this.setOptions(t)}var reEscape=new RegExp("(\\"+["/",".","*","+","?","|","(",")","[","]","{","}","\\"].join("|\\")+")","g");$.fn.autocomplete=function(e){return new Autocomplete(this.get(0)||$("<input />"),e)},Autocomplete.prototype={killerFn:null,initialize:function(){var e,t,n;e=this,t=Math.floor(Math.random()*1048576).toString(16),n="Autocomplete_"+t,this.killerFn=function(t){$(t.target).parents(".autocomplete").size()===0&&(e.killSuggestions(),e.disableKillerFn())},this.options.width||(this.options.width=this.el.width()),this.mainContainerId="AutocompleteContainter_"+t,$('<div id="'+this.mainContainerId+'" style="position:absolute;z-index:9999;"><div class="autocomplete-w1"><div class="autocomplete" id="'+n+'" style="display:none; width:300px;"></div></div></div>').appendTo("body"),this.container=$("#"+n),this.fixPosition(),window.opera?this.el.keypress(function(t){e.onKeyPress(t)}):this.el.keydown(function(t){e.onKeyPress(t)}),this.el.keyup(function(t){e.onKeyUp(t)}),this.el.blur(function(){e.enableKillerFn()}),this.el.focus(function(){e.fixPosition()})},setOptions:function(e){var t=this.options;$.extend(t,e),t.lookup&&(this.isLocal=!0,$.isArray(t.lookup)&&(t.lookup={suggestions:t.lookup,data:[]})),$("#"+this.mainContainerId).css({zIndex:t.zIndex}),this.container.css({maxHeight:t.maxHeight+"px",width:t.width})},clearCache:function(){this.cachedResponse=[],this.badQueries=[]},disable:function(){this.disabled=!0},enable:function(){this.disabled=!1},fixPosition:function(){var e=this.el.offset();$("#"+this.mainContainerId).css({top:e.top+this.el.innerHeight()+"px",left:e.left+"px"})},enableKillerFn:function(){var e=this;$(document).bind("click",e.killerFn)},disableKillerFn:function(){var e=this;$(document).unbind("click",e.killerFn)},killSuggestions:function(){var e=this;this.stopKillSuggestions(),this.intervalId=window.setInterval(function(){e.hide(),e.stopKillSuggestions()},300)},stopKillSuggestions:function(){window.clearInterval(this.intervalId)},onKeyPress:function(e){if(this.disabled||!this.enabled)return;switch(e.keyCode){case 27:this.el.val(this.currentValue),this.hide();break;case 9:case 13:if(this.selectedIndex===-1){this.hide();return}this.select(this.selectedIndex);if(e.keyCode===9)return;break;case 38:this.moveUp();break;case 40:this.moveDown();break;default:return}e.stopImmediatePropagation(),e.preventDefault()},onKeyUp:function(e){if(this.disabled)return;switch(e.keyCode){case 38:case 40:return}clearInterval(this.onChangeInterval);if(this.currentValue!==this.el.val())if(this.options.deferRequestBy>0){var t=this;this.onChangeInterval=setInterval(function(){t.onValueChange()},this.options.deferRequestBy)}else this.onValueChange()},onValueChange:function(){clearInterval(this.onChangeInterval),this.currentValue=this.el.val();var e=this.getQuery(this.currentValue);this.selectedIndex=-1;if(this.ignoreValueChange){this.ignoreValueChange=!1;return}e===""||e.length<this.options.minChars?this.hide():this.getSuggestions(e)},getQuery:function(e){var t,n;return t=this.options.delimiter,t?(n=e.split(t),$.trim(n[n.length-1])):$.trim(e)},getSuggestionsLocal:function(e){var t,n,r,i,s;n=this.options.lookup,r=n.suggestions.length,t={suggestions:[],data:[]},e=e.toLowerCase();for(s=0;s<r;s++)i=n.suggestions[s],i.toLowerCase().indexOf(e)===0&&(t.suggestions.push(i),t.data.push(n.data[s]));return t},getSuggestions:function(e){var t,n;t=this.isLocal?this.getSuggestionsLocal(e):this.cachedResponse[e],t&&$.isArray(t.suggestions)?(this.suggestions=t.suggestions,this.data=t.data,this.suggest()):this.isBadQuery(e)||(n=this,n.options.params.query=e,$.get(this.serviceUrl,n.options.params,function(e){n.processResponse(e)},"text"))},isBadQuery:function(e){var t=this.badQueries.length;while(t--)if(e.indexOf(this.badQueries[t])===0)return!0;return!1},hide:function(){this.enabled=!1,this.selectedIndex=-1,this.container.hide()},suggest:function(){if(this.suggestions.length===0){this.hide();return}var e,t,n,r,i,s,o,u,a;e=this,t=this.suggestions.length,r=this.options.fnFormatResult,i=this.getQuery(this.currentValue),u=function(t){return function(){e.activate(t)}},a=function(t){return function(){e.select(t)}},this.container.hide().empty();for(s=0;s<t;s++)o=this.suggestions[s],n=$((e.selectedIndex===s?'<div class="selected"':"<div")+' title="'+o+'">'+r(o,this.data[s],i)+"</div>"),n.mouseover(u(s)),n.click(a(s)),this.container.append(n);this.enabled=!0,this.container.show()},processResponse:function(text){var response;try{response=eval("("+text+")")}catch(err){return}$.isArray(response.data)||(response.data=[]),this.options.noCache||(this.cachedResponse[response.query]=response,response.suggestions.length===0&&this.badQueries.push(response.query)),response.query===this.getQuery(this.currentValue)&&(this.suggestions=response.suggestions,this.data=response.data,this.suggest())},activate:function(e){var t,n;return t=this.container.children(),this.selectedIndex!==-1&&t.length>this.selectedIndex&&$(t.get(this.selectedIndex)).removeClass(),this.selectedIndex=e,this.selectedIndex!==-1&&t.length>this.selectedIndex&&(n=t.get(this.selectedIndex),$(n).addClass("selected")),n},deactivate:function(e,t){e.className="",this.selectedIndex===t&&(this.selectedIndex=-1)},select:function(e){var t,n;t=this.suggestions[e],t&&(this.el.val(t),this.options.autoSubmit&&(n=this.el.parents("form"),n.length>0&&n.get(0).submit()),this.ignoreValueChange=!0,this.hide(),this.onSelect(e))},moveUp:function(){if(this.selectedIndex===-1)return;if(this.selectedIndex===0){this.container.children().get(0).className="",this.selectedIndex=-1,this.el.val(this.currentValue);return}this.adjustScroll(this.selectedIndex-1)},moveDown:function(){if(this.selectedIndex===this.suggestions.length-1)return;this.adjustScroll(this.selectedIndex+1)},adjustScroll:function(e){var t,n,r,i;t=this.activate(e),n=t.offsetTop,r=this.container.scrollTop(),i=r+this.options.maxHeight-25,n<r?this.container.scrollTop(n):n>i&&this.container.scrollTop(n-this.options.maxHeight+25),this.el.val(this.getValue(this.suggestions[e]))},onSelect:function(e){var t,n,r,i;t=this,n=t.options.onSelect,r=t.suggestions[e],i=t.data[e],t.el.val(t.getValue(r)),$.isFunction(n)&&n(r,i,t.el)},getValue:function(e){var t,n,r,i;return i=this,t=i.options.delimiter,t?(n=i.currentValue,r=n.split(t),r.length===1?e:n.substr(0,n.length-r[r.length-1].length)+e):e}}})(jQuery);