if (! ("ace" in window)) {
    window.ace = {}
}
jQuery(function(a) {
    window.ace.click_event = a.fn.tap ? "tap" : "click"
});
jQuery(function(a) {
    ace.handle_side_menu(jQuery);
    // ace.enable_search_ahead(jQuery);
    // ace.general_things(jQuery);
    ace.widget_boxes(jQuery)
});
ace.handle_side_menu = function(a) {
    a("#menu-toggler").on(ace.click_event, function() {
        a("#sidebar").toggleClass("display");
        a(this).toggleClass("display");
        return false
    });
    var c = a("#sidebar").hasClass("menu-min");
    a("#sidebar-collapse").on(ace.click_event, function() {
        c = a("#sidebar").hasClass("menu-min");
        ace.settings.sidebar_collapsed(!c)
    });
    var b = "ontouchend" in document;
    a(".nav-list").on(ace.click_event, function(h) {
        var g = a(h.target).closest("a");
        if (!g || g.length == 0) {
            return
        }
        c = a("#sidebar").hasClass("menu-min");
        if (!g.hasClass("dropdown-toggle")) {
            if (c && ace.click_event == "tap" && g.get(0).parentNode.parentNode == this) {
                var i = g.find(".menu-text").get(0);
                if (h.target != i && !a.contains(i, h.target)) {
                    return false
                }
            }
            return
        }
        var f = g.next().get(0);
        if (!a(f).is(":visible")) {
            var d = a(f.parentNode).closest("ul");
            if (c && d.hasClass("nav-list")) {
                return
            }
            d.find("> .open > .submenu").each(function() {
                if (this != f && !a(this.parentNode).hasClass("active")) {
                    a(this).slideUp(200).parent().removeClass("open")
                }
            })
        } else {} if (c && a(f.parentNode.parentNode).hasClass("nav-list")) {
            return false
        }
        a(f).slideToggle(200).parent().toggleClass("open");
        return false
    })
};
// ace.general_things = function(a) {
    // a('.ace-nav [class*="icon-animated-"]').closest("a").on("click", function() {
    //     var d = a(this).find('[class*="icon-animated-"]').eq(0);
    //     var c = d.attr("class").match(/icon\-animated\-([\d\w]+)/);
    //     d.removeClass(c[0]);
    //     a(this).off("click")
    // });
    // a(".nav-list .badge[title],.nav-list .label[title]").tooltip({
    //     placement: "right"
    // });
    // a("#ace-settings-btn").on(ace.click_event, function() {
    //     a(this).toggleClass("open");
    //     a("#ace-settings-box").toggleClass("open")
    // });
    // a("#ace-settings-navbar").on("click", function() {
    //     ace.settings.navbar_fixed(this.checked)
    // }).get(0).checked = ace.settings.is("navbar", "fixed");
    // a("#ace-settings-sidebar").on("click", function() {
    //     ace.settings.sidebar_fixed(this.checked)
    // }).get(0).checked = ace.settings.is("sidebar", "fixed");
    // a("#ace-settings-breadcrumbs").on("click", function() {
    //     ace.settings.breadcrumbs_fixed(this.checked)
    // }).get(0).checked = ace.settings.is("breadcrumbs", "fixed");
    // a("#ace-settings-rtl").removeAttr("checked").on("click", function() {
    //     ace.switch_direction(jQuery)
    // });
    // a("#btn-scroll-up").on(ace.click_event, function() {
    //     var c = Math.max(100, parseInt(a("html").scrollTop() / 3));
    //     a("html,body").animate({
    //         scrollTop: 0
    //     },
    //     c);
    //     return false
    // });
    // try {
    //     a("#skin-colorpicker").ace_colorpicker()
    // } catch(b) {}
    // a("#skin-colorpicker").on("change", function() {
    //     var d = a(this).find("option:selected").data("skin");
    //     var c = a(document.body);
    //     c.removeClass("skin-1 skin-2 skin-3");
    //     if (d != "default") {
    //         c.addClass(d)
    //     }
    //     if (d == "skin-1") {
    //         a(".ace-nav > li.grey").addClass("dark")
    //     } else {
    //         a(".ace-nav > li.grey").removeClass("dark")
    //     }
    //     if (d == "skin-2") {
    //         a(".ace-nav > li").addClass("no-border margin-1");
    //         a(".ace-nav > li:not(:last-child)").addClass("light-pink").find('> a > [class*="icon-"]').addClass("pink").end().eq(0).find(".badge").addClass("badge-warning")
    //     } else {
    //         a(".ace-nav > li").removeClass("no-border margin-1");
    //         a(".ace-nav > li:not(:last-child)").removeClass("light-pink").find('> a > [class*="icon-"]').removeClass("pink").end().eq(0).find(".badge").removeClass("badge-warning")
    //     }
    //     if (d == "skin-3") {
    //         a(".ace-nav > li.grey").addClass("red").find(".badge").addClass("badge-yellow")
    //     } else {
    //         a(".ace-nav > li.grey").removeClass("red").find(".badge").removeClass("badge-yellow")
    //     }
    // })
// };
ace.widget_boxes = function(a) {
    a(".page-content,#page-content").delegate(".widget-toolbar > [data-action]", "click", function(l) {
        l.preventDefault();
        var k = a(this);
        var m = k.data("action");
        var b = k.closest(".widget-box");
        if (b.hasClass("ui-sortable-helper")) {
            return
        }
        if (m == "collapse") {
            var e = b.find(".widget-body");
            var j = k.find("[class*=icon-]").eq(0);
            var f = j.attr("class").match(/icon\-(.*)\-(up|down)/);
            var c = "icon-" + f[1] + "-down";
            var g = "icon-" + f[1] + "-up";
            var i = e.find(".widget-body-inner");
            if (i.length == 0) {
                e = e.wrapInner('<div class="widget-body-inner"></div>').find(":first-child").eq(0)
            } else {
                e = i.eq(0)
            }
            var d = 300;
            var h = 200;
            if (b.hasClass("collapsed")) {
                if (j) {
                    j.addClass(g).removeClass(c)
                }
                b.removeClass("collapsed");
                e.slideUp(0, function() {
                    e.slideDown(d)
                })
            } else {
                if (j) {
                    j.addClass(c).removeClass(g)
                }
                e.slideUp(h, function() {
                    b.addClass("collapsed")
                })
            }
        } else {
            if (m == "close") {
                var o = parseInt(k.data("close-speed")) || 300;
                b.hide(o, function() {
                    b.remove()
                })
            } else {
                if (m == "reload") {
                    k.blur();
                    var n = false;
                    if (b.css("position") == "static") {
                        n = true;
                        b.addClass("position-relative")
                    }
                    b.append('<div class="widget-box-layer"><i class="icon-spinner icon-spin icon-2x white"></i></div>');
                    setTimeout(function() {
                        b.find(".widget-box-layer").remove();
                        if (n) {
                            b.removeClass("position-relative")
                        }
                    },
                    parseInt(Math.random() * 1000 + 1000))
                } else {
                    if (m == "settings") {}
                }
            }
        }
    })
};
// ace.enable_search_ahead = function(a) {
//     ace.variable_US_STATES = ["mapa/url", "mapa/crear", "mapa/", "reporte/consultar", "reporte", "carrito/", "carrito/aviso", "carrito/banner"],
//     a("#nav-search-input").typeahead({
//         source: ace.variable_US_STATES,
//         updater: function(b) {
//             a("#nav-search-input").focus();
//             return b
//         }
//     })
// };
ace.switch_direction = function(d) {
    var c = d(document.body);
    c.toggleClass("rtl").find(".dropdown-menu:not(.datepicker-dropdown,.colorpicker)").toggleClass("pull-right").end().find('.pull-right:not(.dropdown-menu,blockquote,.dropdown-submenu,.profile-skills .pull-right,.control-group .controls > [class*="span"]:first-child)').removeClass("pull-right").addClass("tmp-rtl-pull-right").end().find(".pull-left:not(.dropdown-submenu,.profile-skills .pull-left)").removeClass("pull-left").addClass("pull-right").end().find(".tmp-rtl-pull-right").removeClass("tmp-rtl-pull-right").addClass("pull-left").end().find(".chosen-container").toggleClass("chosen-rtl").end().find('.control-group .controls > [class*="span"]:first-child').toggleClass("pull-right").end();
    function a(h, g) {
        c.find("." + h).removeClass(h).addClass("tmp-rtl-" + h).end().find("." + g).removeClass(g).addClass(h).end().find(".tmp-rtl-" + h).removeClass("tmp-rtl-" + h).addClass(g)
    }
    function b(h, g, i) {
        i.each(function() {
            var k = d(this);
            var j = k.css(g);
            k.css(g, k.css(h));
            k.css(h, j)
        })
    }
    a("align-left", "align-right");
    a("arrowed", "arrowed-right");
    a("arrowed-in", "arrowed-in-right");
    a("messagebar-item-left", "messagebar-item-right");
    var e = d("#piechart-placeholder");
    if (e.size() > 0) {
        var f = d(document.body).hasClass("rtl") ? "nw" : "ne";
        e.data("draw").call(e.get(0), e, e.data("chart"), f)
    }
};