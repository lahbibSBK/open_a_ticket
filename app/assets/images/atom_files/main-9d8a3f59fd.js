function onlyUnique(t,o,e){return e.indexOf(t)===o}!function(t){t.fn.setCursorToTextEnd=function(){var t=this.val();this.val(t)}}(jQuery),jQuery.extend({isValidSelector:function(t){if("string"!=typeof t)return!1;try{$(t)}catch(o){return!1}return!0}}),scrollbarWidth=function(){var t,o,e;return void 0===e&&(t=$('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body"),o=t.children(),e=o.innerWidth()-o.height(99).innerWidth(),t.remove()),e},getHashParams=function(){for(var t,o={},e=/\+/g,n=/([^&;=]+)=?([^&;]*)/g,a=function(t){return decodeURIComponent(t.replace(e," "))},i=window.location.hash.substring(1);t=n.exec(i);)o[a(t[1])]=a(t[2]);return o};var PopupCenter=function(t,o,e,n){var a=void 0!=window.screenLeft?window.screenLeft:screen.left,i=void 0!=window.screenTop?window.screenTop:screen.top,r=window.innerWidth?window.innerWidth:document.documentElement.clientWidth?document.documentElement.clientWidth:screen.width,s=window.innerHeight?window.innerHeight:document.documentElement.clientHeight?document.documentElement.clientHeight:screen.height,c=r/2-e/2+a,l=s/2-n/2+i,d=window.open(t,o,"toolbar=0, status=0, scrollbars=yes, width="+e+", height="+n+", top="+l+", left="+c);window.focus&&d.focus()},SocialPopups={googlePlus:function(t){t=encodeURIComponent(t),PopupCenter("https://plus.google.com/share?url="+t,"",900,500)},facebook:function(t){t=encodeURIComponent(t),PopupCenter("http://www.facebook.com/sharer/sharer.php?u="+t,"",900,500)},twitter:function(t){t=encodeURIComponent(t),PopupCenter("https://twitter.com/intent/tweet?text="+t,"",650,360)},digg:function(t){t=encodeURIComponent(t),PopupCenter("http://digg.com/tools/diggthis/submit?url="+t,"",650,360)},delicious:function(t){t=encodeURIComponent(t),PopupCenter("http://www.delicious.com/save?v=5&noui&jump=close&url="+t,"",550,550)},stumbleupon:function(t){t=encodeURIComponent(t),PopupCenter("http://www.stumbleupon.com/badge/?url="+t,"",550,550)},linkedin:function(t){t=encodeURIComponent(t),PopupCenter("https://www.linkedin.com/cws/share?url="+t,"",550,550)},pinterest:function(t){t=encodeURIComponent(t),PopupCenter("http://pinterest.com/pin/create/button/?url="+t,"",700,700)}},copyToClipboard=function(t){var o=document.createElement("input");o.setAttribute("value",t),document.body.appendChild(o),o.select(),document.execCommand("copy"),document.body.removeChild(o)};downloadURI=function(t,o){if(/chrom(e|ium)/.test(navigator.userAgent.toLowerCase())){var e=document.createElement("a");e.download=o,e.href=t,e.click()}else window.location.href=t},handleLayeredClick=function(t){for(var o=[".dropdown-backdrop"],e=o.length-1;e>=0;e--)if($(event.srcElement).is(o[e]))return;for(var n=!1,a=event.path.length-2,e=0;e<a;e++){if("A"==event.path[e].tagName.toUpperCase()){n=!0;break}if("BODY"==event.path[e].tagName.toUpperCase())break}n||(window.location.href=t)},$(function(){"use strict";function t(t){this.$container=t,this.$avatarView=this.$container.find(".avatar-view"),this.$avatar=this.$avatarView.find("img"),this.$avatarModal=this.$container,this.$loading=this.$container.find(".loading"),this.$avatarRatio=this.$container.find(".avatar-ratio"),this.$avatarForm=this.$avatarModal.find(".avatar-form"),this.$avatarUpload=this.$avatarForm.find(".avatar-upload"),this.$avatarSrc=this.$avatarForm.find(".avatar-src"),this.$avatarData=this.$avatarForm.find(".avatar-data"),this.$avatarInput=this.$avatarForm.find(".avatar-input"),this.$avatarSave=this.$avatarForm.find(".avatar-save"),this.$avatarBtns=this.$avatarForm.find(".avatar-btns"),this.$avatarSlider=this.$container.find(".avatar-zoom-slider"),this.$avatarWrapper=this.$avatarModal.find(".avatar-wrapper"),this.$avatarPreview=this.$avatarModal.find(".avatar-preview"),this.init()}var o=window.console||{log:function(){}};t.prototype={constructor:t,support:{fileList:!!$('<input type="file">').prop("files"),blobURLs:!!window.URL&&URL.createObjectURL,formData:!!window.FormData},init:function(){this.support.datauri=this.support.fileList&&this.support.blobURLs,this.support.formData||this.initIframe(),this.initTooltip(),this.initModal(),this.addListener()},addListener:function(){this.$avatarView.on("click",$.proxy(this.click,this)),this.$avatarInput.on("change",$.proxy(this.change,this)),this.$avatarBtns.on("click",$.proxy(this.rotate,this)),this.$avatarSlider.on("change",$.proxy(this.slider,this))},initTooltip:function(){this.$avatarView.tooltip({placement:"bottom"})},initModal:function(){this.$avatarModal.modal({show:!1})},initPreview:function(){var t=this.$avatar.attr("src");this.$avatarPreview.html('<img src="'+t+'">')},initIframe:function(){var t="upload-iframe-"+(new Date).getTime(),e=$("<iframe>").attr({name:t,src:""}),n=this;e.one("load",function(){e.on("load",function(){var t;try{t=$(this).contents().find("body").text()}catch(e){o.log(e.message)}if(t){try{t=$.parseJSON(t)}catch(e){o.log(e.message)}n.submitDone(t)}else n.submitFail("Image upload failed!");n.submitEnd()})}),this.$iframe=e,this.$avatarForm.attr("target",t).after(e.hide())},click:function(){this.$avatarModal.modal("show"),this.initPreview()},change:function(){var t,o;this.support.datauri?(t=this.$avatarInput.prop("files"),t.length>0&&(o=t[0],this.isImageFile(o)&&(this.url&&URL.revokeObjectURL(this.url),this.url=URL.createObjectURL(o),this.$avatarModal.modal("show"),this.startCropper()))):(o=this.$avatarInput.val(),this.isImageFile(o)&&this.syncUpload())},submit:function(){return!(!this.$avatarSrc.val()&&!this.$avatarInput.val())&&(this.support.formData?(this.ajaxUpload(),!1):void 0)},rotate:function(t){var o;this.active&&(o=$(t.target).data(),o.method&&this.$img.cropper(o.method,o.option))},slider:function(t){var o=parseInt(this.$avatarSlider.val())/100;this.$img.cropper("zoomTo",o)},isImageFile:function(t){return t.type?/^image\/\w+$/.test(t.type):/\.(jpg|jpeg|png|gif)$/.test(t)},startCropper:function(){var t=this;this.active?this.$img.cropper("replace",this.url):(this.$img=$('<img src="'+this.url+'">'),this.$avatarWrapper.empty().html(this.$img),this.$img.cropper({aspectRatio:this.$avatarRatio.val(),preview:this.$avatarPreview.selector,viewMode:1,strict:!1,autoCropArea:.95,dragMode:"move",cropBoxResizable:!1,cropBoxMovable:!1,guides:!1,crop:function(o){var e=['{"x":'+Math.round(o.x),'"y":'+Math.round(o.y),'"height":'+Math.round(o.height),'"width":'+Math.round(o.width),'"rotate":'+o.rotate+"}"].join();t.$avatarData.val(e)}}),this.$img.on("built.cropper",t,function(t){var o=t.data,e=o.$img.cropper("getImageData").naturalHeight,n=o.$img.cropper("getImageData").height,a=.95*n/e*100,i=n/e*100;o.$avatarSlider.attr("min",a),o.$avatarSlider.val(i)}),this.active=!0),this.$avatarModal.one("hidden.bs.modal",function(){t.$avatarPreview.empty(),t.stopCropper()})},stopCropper:function(){this.active&&(this.$img.cropper("destroy"),this.$img.remove(),this.active=!1)},syncUpload:function(){this.$avatarSave.click()},submitStart:function(){this.$loading.fadeIn()},submitDone:function(t){o.log(t),$.isPlainObject(t)&&200===t.state?t.result?(this.url=t.result,this.support.datauri||this.uploaded?(this.uploaded=!1,this.cropDone()):(this.uploaded=!0,this.$avatarSrc.val(this.url),this.startCropper()),this.$avatarInput.val("")):t.message&&this.alert(t.message):this.alert("Failed to response")},submitFail:function(t){this.alert(t)},submitEnd:function(){this.$loading.fadeOut()},cropDone:function(){this.$avatarForm.get(0).reset(),this.$avatar.attr("src",this.url),this.stopCropper(),this.$avatarModal.modal("hide")},alert:function(t){var o=['<div class="alert alert-danger avatar-alert alert-dismissable">','<button type="button" class="close" data-dismiss="alert">&times;</button>',t,"</div>"].join("");this.$avatarUpload.after(o)}},$.extend($.fn,{avatarResizer:function(e){if(!this.length)return void(e&&e.debug&&window.console&&o.warn("Can't create AvatarResizer."));var n=$.data(this[0],"avatarResizer");return n?n:(n=new t(this),$.data(this[0],"avatarResizer",n),this)}})});var PageHashParams=getHashParams(),screen_xs=480,screen_sm=768,screen_md=992,screen_lg=1200,setICheck,formReset,authCheck,bindVirtualAjax,bindAjaxForm,bindCommentsShow,bindFollow,bindLikeIcon,bindDownloadIcon,bindLikeIconset,bindLogin,bindSignup,bindForgotPassword,bindDownloadIcon,bindSubscription,bindClearFilterSearch,bindAddNewScout,bindAddNewScoutForm,bindAddToScoutAjax,bindShares,bindQuestionManager,setIconPreviewContainer,prepareIcons,prepareIconsets,prepareComments,prepareMyScoutsDD,prepareDownloads,prepareSubscriptions,windowHandleHash;$.fn.ajaxLib.debug=!1,$.ajaxForm.setDefaults({validatorType:"jQueryValidation"}),$.virtualAjaxForm.defaults.onError=function(t,o){$.alert({title:"Whoops!",content:t.message})},jQuery.validator.setDefaults({highlight:function(t,o,e){"radio"===t.type?this.findByName(t.name).addClass(o):($(t).closest(".form-group").addClass("has-error has-feedback"),$(t).closest(".form-group").find("i.icon.form-control-feedback").remove())},unhighlight:function(t,o,e){"radio"===t.type?this.findByName(t.name).removeClass(o).addClass(e):($(t).closest(".form-group").removeClass("has-error has-feedback"),$(t).closest(".form-group").find("i.icon.form-control-feedback").next(".tooltip").remove(),$(t).closest(".form-group").find("i.icon.form-control-feedback").remove())},errorElement:"span",errorClass:"help-block",errorPlacement:function(t,o){var e=$(t).text(),n=o,a=0;n.parent(".input-group").length&&(n.next().length&&(a=$(n).next().width()),n=n.parent()),$('<i class="icon icon-exclamation red form-control-feedback" data-toggle="tooltip" data-placement="bottom" title="'+e+'" style="right: '+a+'px"></i>').insertAfter(n),$('[data-toggle="tooltip"]').tooltip()}}),jQuery.validator.messages.required=function(t,o){return"required"},"undefined"!=typeof jconfirm&&(jconfirm.defaults={title:"Iconscout",defaultButtons:{ok:{text:"Okay",btnClass:"btn-primary"},close:{text:"Cancel",btnClass:"btn-default-2 pull-left"}},theme:"light",animation:"scale",closeAnimation:"zoom",opacity:.5,animationSpeed:500,animationBounce:1.1,rtl:!1,confirmKeys:[13],cancelKeys:[27],container:"body",backgroundDismiss:!0,autoClose:!1,closeIcon:null,columnClass:"col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1"});var singleIconEditOptions={columnClass:"modal-single-icon-edit",buttons:{ok:{text:"Okay",btnClass:"hidden"},close:{text:"Cancel",btnClass:"hidden"}},onContentReady:function(){var t=this;this.$content.find("form").delay(400).animate({opacity:1},220),this.$content.find("form").validate({ignore:":hidden:not(.validate-select-tag), .ignore"}),this.$content.find("form").ajaxForm({onSuccess:function(o){t.close()}}),init_icons(),$("#chkFree").on("ifChanged",setFreePremiumIcons)}},_ga=function(t){"undefined"!=typeof ga&&t()},gaEvent=function(t,o,e){"undefined"!=typeof ga&&("undefined"==typeof e&&(e=""),ga("send","event",{eventCategory:t,eventAction:o,eventLabel:e,transport:"beacon"}))};$(function(){}),$(function(){setICheck=function(){$("input:not(.icheckbox_is input, .iradio_is input, .noICheck)").iCheck({checkboxClass:"icheckbox_is",radioClass:"iradio_is",cursor:!1})},formReset=function(t){$(t)[0].reset(),$(t).find(".file-name-holder").text(""),$(t).find("input").iCheck("update")},authCheck=function(){return!!auth_check||($("#modalLogin").modal("show"),!1)},bindVirtualAjax=function(){$("[data-ajax=virtual]").virtualAjaxForm()},bindAjaxForm=function(){$("[data-ajax=form]").each(function(t,o){$(o).ajaxForm()})},bindCommentsShow=function(){$(".btn-comments").on("click",function(t){$(".comments-container").toggleClass("no-visibility"),$(this).parent().toggleClass("active");var o=$(".iconset-page").length?"iconset":"icon";return gaEvent(o,"activity","comment"),!1})},bindFollow=function(){$(".btn-follow").virtualAjaxForm({beforeSubmit:function(t){if(gaEvent("designer","follow","large"),!authCheck())return!1;var o=$(t).text();"Follow"==o?$(t).text("Following"):$(t).text("Follow")},onSuccess:function(t,o){gaEvent("designer","followed","large")}}),$(".btn-follow-small").virtualAjaxForm({beforeSubmit:function(t){return gaEvent("designer","follow","small"),!!authCheck()&&void($(t).hasClass("btn-success")?$(t).removeClass("btn-success").addClass("btn-default-2"):$(t).addClass("btn-success").removeClass("btn-default-2"))},onSuccess:function(t,o){gaEvent("designer","followed","small")}})},bindLikeIcon=function(){$(".btn-like").virtualAjaxForm({beforeSubmit:function(t){if(gaEvent("icon","activity","like"),!authCheck())return!1;var o=$(t).find(".count"),e=0;""!=o.text().trim()&&(e=parseInt(o.text().trim())),$(t).hasClass("active")?($(t).removeClass("active"),$(t).hasClass("showCount")&&(1==e?o.text(""):o.text(--e))):($(t).addClass("active"),$(t).hasClass("showCount")&&o.text(++e))},onSuccess:function(t,o){gaEvent("icon","activity","liked")}})},bindDownloadQuickIcon=function(){auth_check?($(".is-icon .icon-footer .download[data-download=true]").on("click",function(t){return gaEvent("icon","template","quick_download"),authCheck()&&($(this).parents(".is-icon").addClass("download-mode"),$(this).parents(".is-icon").find(".download-close").on("click",function(t){return $(this).parents(".is-icon").removeClass("download-mode"),!1}),$(this).parents(".is-icon").hover(function(t){"mouseleave"===t.type&&$(this).removeClass("download-mode")})),!1}),$(".is-icon .icon-footer .download[data-download=false]").each(function(t,o){$(o).attr("href",$(o).parents(".is-icon").find(">a")[0].href+"#modalPurchaseIcon"),$(o).attr("target","_blank")})):$(".is-icon .icon-footer .download").on("click",function(t){gaEvent("icon","template","quick_download"),authCheck()})},bindDownloadIcon=function(){$(".btn-download").virtualAjaxForm({beforeSubmit:function(t){var o=t.text(),e=t.data("url").split("/icon/")[1].split("/download/")[0];gaEvent("icon","downloaded "+o,e),$(t).parents(".quick-download-container").length&&$(t).parents(".is-icon").removeClass("download-mode")},onSuccess:function(t){downloadURI(t.location)},onError:function(t,o){$("#modalDownloadIcon .modal-body").prepend('<div class="alert alert-danger" role="alert">'+t.message+"</div>")}})},bindSubscription=function(){$(".btn-buy-subscription").on("click",function(t){var o=$(this).data("price"),e=$(this).data("plan");return!!authCheck()&&($("#modalPaymentDetails").modal("show"),o&&($("#modalPaymentDetails .payment-amount-container").removeClass("hidden"),$("#modalPaymentDetails .payment-amount-container .value").html(o)),e&&$("#modalPaymentDetails #frmPaymentCode").prepend('<input type="hidden" name="plan_id" value="'+e+'" />'),void 0)})},bindLogin=function(){$(".btn-login").on("click",function(){return $("#modalSignup").modal("hide"),$("#modalForgotPassword").modal("hide"),setTimeout(function(){$("#modalLogin").modal("show")},300),!1})},bindSignup=function(){$(".btn-register").on("click",function(){return $("#modalLogin").modal("hide"),$("#modalForgotPassword").modal("hide"),setTimeout(function(){$("#modalSignup").modal("show")},300),!1})},bindForgotPassword=function(){$(".btn-forgot-password").on("click",function(){return $("#modalLogin").modal("hide"),$("#modalSignup").modal("hide"),setTimeout(function(){$("#modalForgotPassword").modal("show")},300),!1})},bindClearFilterSearch=function(){$(".filtered-search .btn-close.js-handle").on("click",function(t){return $(this).parents(".filtered-search").remove(),t.preventDefault(),!1})},bindAddToScoutAjax=function(){$(".add-scouts-container .scouts-list>li>a").virtualAjaxForm({beforeSubmit:function(t){$(t).hasClass("active")?$(t).removeClass("active"):$(t).addClass("active")},onSuccess:function(t,o){$(o).hasClass("active")?$(o).attr("data-url",t.add_url):$(o).attr("data-url",t.remove_url)},afterSubmit:function(){gaEvent("scout","click","add")}})},bindAddNewScout=function(){$(".add-scouts-container .btn-new-scout").on("click",function(){return $(this).parents(".add-scouts-container").addClass("new-scout-mode"),$("#frmStoreScout input").focus(),gaEvent("scout","click","new"),!1})},bindAddNewScoutForm=function(){$("#frmStoreScout").validate(),$("#frmStoreScout").ajaxForm({onSuccess:function(t,o){$(".add-scouts-container .scouts-list").prepend(t.content),$(".add-scouts-container").removeClass("new-scout-mode"),formReset(o),bindAddToScoutAjax()},afterSubmit:function(){gaEvent("scout","click","created")}})},bindShares=function(){$(".shares-container").each(function(t,o){var e=$(o).data("url");$(o).find(".btn-fb-share").on("click",function(){return SocialPopups.facebook(e),gaEvent("social","share","Facebook"),!1}),$(o).find(".btn-twitter-share").on("click",function(){return SocialPopups.twitter(e),gaEvent("social","share","Twitter"),!1}),$(o).find(".btn-linkedin-share").on("click",function(){return SocialPopups.linkedin(e),gaEvent("social","share","LinkedIn"),!1}),$(o).find(".btn-pinterest-share").on("click",function(){return SocialPopups.pinterest(e),gaEvent("social","share","Pinterest"),!1}),$(o).find(".btn-google-share").on("click",function(){return SocialPopups.googlePlus(e),gaEvent("social","share","Google Plus"),!1}),$(o).find(".btn-link-share").on("click",function(){return copyToClipboard(e),$(this).text("copied"),$(this).addClass("copied"),gaEvent("social","share","Copy"),!1})})},bindQuestionManager=function(){$(".btn-ask-question").on("click",function(){return $crisp["do"]("chat:open"),!1})},prepareIcons=function(){bindLikeIcon(),bindDownloadQuickIcon(),bindDownloadIcon()},prepareIconsets=function(){},prepareComments=function(){$(".comment-form-container [name=comment_uuid]").val("0"),$(".comments-list>li:not(.prepared)").each(function(t,o){var e=$(o).find("p").html(),e=e.replace(/(^|[^@\w])@([\w\-\.]{1,30})\b/g,' <a href="/$2">@$2</a>');$(o).find("p").html(e),$(o).find(".btn-comment-reply").on("click",function(){if(authCheck()){var t=$(this).data("username"),o=$(this).data("comment-uuid");$(".comment-form-container [name=comment_uuid]").val(o),$(".comment-form-container [name=comment]").val("@"+t+" ").focus()}return!1}),$(o).find("[name=comment]").on("blur change",function(){""==$(this).val().trim()&&$(".comment-form-container [name=comment_uuid]").val("0")}),$(o).addClass("prepared")})},prepareMyScoutsDD=function(){bindAddNewScout(),bindAddNewScoutForm(),bindAddToScoutAjax()},prepareDownloads=function(){bindDownloadIcon()},prepareSubscriptions=function(){bindSubscription()},windowHandleHash=function(){if(window.location.hash&&$.isValidSelector(window.location.hash)){var t=window.location.hash;$(t).hasClass("modal")?$(t).modal("show"):$(t).hasClass("tab-pane")?$('a[href="'+t+'"]').tab("show"):$(t).hasClass("panel-collapse")&&$(t).collapse("show")}},$(window).width()>screen_xs&&$(window).on("scroll",function(t){var o=$("#header:not(.home-header)");o.length&&($(this).scrollTop()>56?o.addClass("static-header"):o.removeClass("static-header"),$(this).scrollTop()>57?o.addClass("fix-header"):o.removeClass("fix-header"))}),$(".btn-color-search").on("click",function(t){return $(".color-search-container").hasClass("open"),$(".color-search-container").toggleClass("open"),gaEvent("header","color_search",$(".color-search-container").hasClass("open")),!1}),$(".color-search-container").on("click","a",function(){var t=$(this).data("color");return $("#frmColorSearch [name=color_hash]").val(t).trigger("change"),!1}),$("#frmSearch [name=q]").on("blur",function(){var t=$(this).val();$("#frmColorSearch [name=q]").val(t)}),$("#frmColorSearch [name=color_hash]").on("change",function(){var t=$(this).val(),o=t.replace("#","");$("#frmSearch [name=color]").val(o),$("#frmColorSearch [name=color]").val(o),$("#frmSearch .filtered-search.search-color .filter-name").css("backgroundColor",t),""==$("#frmColorSearch [name=color_hash]").val()?$("#frmSearch .filtered-search.search-color").addClass("hidden"):$("#frmSearch .filtered-search.search-color").removeClass("hidden")}),$("#frmColorSearch [type=reset]").on("click",function(){$(".color-search-container").removeClass("open"),$("#frmColorSearch [name=color_hash]").val("").trigger("change")}),$(".hamburger").parent().on("show.bs.dropdown hide.bs.dropdown",function(){$(this).find(".hamburger").toggleClass("is-active")}),$("#modalLogin, #modalSignup").on("show.bs.modal hidden.bs.modal",function(t){$("body").toggleClass("modal-auth")}),$("#modalLogin, #modalSignup").on("shown.bs.modal",function(t){$(".owl-modal").owlCarousel({items:1,loop:!0,autoplay:!0,autoplayTimeout:5e3,autoplayHoverPause:!0})}),$("#modalForgotPassword").on("show.bs.modal",function(t){$("body").addClass("modal-forgot-password")}),$("#modalForgotPassword").on("hidden.bs.modal",function(t){$("body").removeClass("modal-forgot-password")}),$("#modalReset").on("show.bs.modal",function(t){$("body").addClass("modal-forgot-password")}),$("#modalReset").on("hidden.bs.modal",function(t){$("body").removeClass("modal-forgot-password")}),$("#modalSignupOffer").on("show.bs.modal",function(t){$("body").addClass("modal-signup-offer")}),$("#modalSignupOffer").on("hidden.bs.modal",function(t){$("body").removeClass("modal-signup-offer")}),$("#modalDownloadIcon").on("show.bs.modal",function(t){$("body").addClass("modal-download-icon")}),$("#modalDownloadIcon").on("hidden.bs.modal",function(t){$("body").removeClass("modal-download-icon")}),$("#modalPaymentDetails").on("show.bs.modal",function(t){$("body").addClass("modal-payment")}),$("#modalPaymentDetails").on("hidden.bs.modal",function(t){$("body").removeClass("modal-payment")}),$(window).width()>screen_md&&($(".owl-iconset").addClass("owl-carousel").owlCarousel({items:3,nav:!0,slideBy:3,navText:['<i class="icon icon-arrow-left middle"></i>','<i class="icon icon-arrow-right middle"></i>'],dots:!1}),$(".owl-icon").addClass("owl-carousel").owlCarousel({items:6,nav:!0,slideBy:6,navText:['<i class="icon icon-arrow-left middle"></i>','<i class="icon icon-arrow-right middle"></i>'],dots:!1}));var t=$(".icon-preview-page");if(t.length&&(setIconPreviewContainer=function(t){"undefined"==typeof t&&(t=$(window).height()-$("#header").height()-$(".iconProfileMain .title").height()-30-$(".iconSizes").height()-$(".primaryActions").height()-$(".iconTitle").height()-26);var o=t;if($(".iconSizes").on("click"," .btn-icon-size-change",function(t){var o=$(this).data("url"),e=$(this).data("size"),n=$(this).parents(".iconSizes"),a=n.next(".iconPreview").find("img");return a.attr("src",o),a.attr("width",e),n.next(".iconPreview").css("minHeight",e+"px"),n.find("li.active").removeClass("active"),$(this).parent().addClass("active"),$(this).parents("#modalFullScreen").find(".btnQuickView.active").length&&$(this).parents("#modalFullScreen").find(".btnQuickView").click(),gaEvent("icon","size",e),!1}),"undefined"!=typeof PageHashParams.size){var e=PageHashParams.size;$(".iconSizes .btn-icon-size-change[data-size="+e+"]").click(),gaEvent("icon","size",e)}else o>=512&&$(".iconSizes .btn-icon-size-change[data-size=512]").click()},setIconPreviewContainer(),$(".btn-full-screen").on("click",function(){return $("#modalFullScreen").hasClass("quick-view-mode")!==!1&&$("#modalFullScreen .btnQuickView").click(),$("#modalFullScreen").modal("show"),gaEvent("icon","size","full_screen"),!1}),$(".btnAllSizes").on("click",function(){return $("#modalFullScreen").hasClass("quick-view-mode")===!1&&$("#modalFullScreen .btnQuickView").click(),$("#modalFullScreen").modal("show"),gaEvent("icon","size","all_sizes"),!1}),$(".btnQuickView").on("click",function(){if($("#modalFullScreen").hasClass("quick-view-mode")){$(this).removeClass("active"),$("#modalFullScreen").removeClass("quick-view-mode");var t=$("#modalFullScreen .iconPreview>img").attr("width");$("#modalFullScreen").find(".iconSizes [data-size="+t+"]").parent().addClass("active")}else $(this).addClass("active"),$("#modalFullScreen").addClass("quick-view-mode"),$("#modalFullScreen").find(".iconSizes li.active").removeClass("active");return gaEvent("icon","size","quick_view"),!1}),$(".icon-profile-header .icon-tags a").on("click",function(){gaEvent("icon","tag",$(this).attr("title"))}),$(".icon-colors a").on("click",function(){gaEvent("icon","color",$(this).attr("title"))})),$(".iconset-page").length&&$(".btn-view-more").virtualAjaxForm({beforeSubmit:function(t){$(t).addClass("btn-ajax-loading")},onSuccess:function(t,o){var e=$(t.content).find(".icons-list").html();$(".iconset-preview-container .icons-list").append(e),$(o).remove(),prepareIcons()},afterSubmit:function(t,o){$(o).removeClass("btn-ajax-loading")}}),$(".icon-extra-info").length){var o=$(".iconset-page").length?"iconset":"icon";$(".icon-extra-info a").on("click",function(){var t="click",e=$(this).parent().prev().children().text();gaEvent(o,t,e)})}var e=function(t){$(".bg-color-container").css("backgroundColor",t)};$(".bg-color-selector").on("click"," .btn-bg-color-change",function(t){var o=$(this).data("color");return e(o),$(".bg-color-selector").find("li.active").removeClass("active"),$(this).parent().addClass("active"),!1}),setICheck(),bindVirtualAjax(),bindAjaxForm(),bindShares(),bindQuestionManager(),bindFollow(),bindCommentsShow(),bindLogin(),bindSignup(),bindForgotPassword(),prepareIcons(),prepareIconsets(),prepareComments(),prepareDownloads(),prepareSubscriptions(),prepareMyScoutsDD(),windowHandleHash(),$(".comments-container, .add-scouts-container").on("click",function(t){t.stopPropagation()})});