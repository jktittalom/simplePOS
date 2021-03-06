function cActions() {
    1 == Settings.rtl ? $(".modal-content .select2").select2({ minimumResultsForSearch: 6, dir: "rtl" }) : $(".modal-content .select2").select2({ minimumResultsForSearch: 6 }),
        $("input").iCheck({ checkboxClass: "icheckbox_square-blue", radioClass: "iradio_square-blue", increaseArea: "20%" }),
        $(".redactor").redactor({ formatting: ["p", "blockquote", "h3", "h4", "pre"], minHeight: 150, maxHeight: 500, linebreaks: !0, tabAsSpaces: 4, dragImageUpload: !1, dragFileUpload: !1 }),
        $(":file").filestyle(),
        $(".validation").formValidation({ framework: "bootstrap", excluded: ":disabled" });
}
function generateCardNo(t) {
    t = t || 16;
    for (var e = "1234567890", a = "", n = 0; n < t; n++) {
        var r = Math.floor(Math.random() * e.length);
        a += e.substring(r, r + 1);
    }
    return a;
}
function roundNumber(t, e) {
    switch (e) {
        case 1:
            var a = formatDecimal(Math.round(20 * t) / 20);
            break;
        case 2:
            a = formatDecimal(Math.round(2 * t) / 2);
            break;
        case 3:
            a = formatDecimal(Math.round(t));
            break;
        case 4:
            a = formatDecimal(Math.ceil(t));
            break;
        default:
            a = t;
    }
    return a;
}
function getNumber(t) {
    return accounting.unformat(t);
}
function formatQuantity(t) {
    return null != t ? '<div class="text-center">' + formatNumber(t, Settings.qty_decimals) + "</div>" : "";
}
function formatQuantity2(t) {
    return null != t ? formatNumber(t, Settings.qty_decimals) : "";
}
function formatNumber(t, e) {
    return e || 0 == e || (e = Settings.decimals), 1 == Settings.sac ? formatSA(parseFloat(t).toFixed(e)) : accounting.formatNumber(t, e, 0 == Settings.thousands_sep ? " " : Settings.thousands_sep, Settings.decimals_sep);
}
function formatMoney(t, e) {
    if (((e = e || ""), 1 == Settings.sac)) return (1 == Settings.display_symbol ? Settings.symbol : "") + "" + formatSA(parseFloat(t).toFixed(Settings.decimals)) + (2 == Settings.display_symbol ? Settings.symbol : "");
    var a = accounting.formatMoney(t, e, Settings.decimals, 0 == Settings.thousands_sep ? " " : Settings.thousands_sep, Settings.decimals_sep, "%s%v");
    return (1 == Settings.display_symbol ? Settings.symbol : "") + a + (2 == Settings.display_symbol ? Settings.symbol : "");
}
function formatDecimal(t, e) {
    return (e = e || Settings.decimals), parseFloat(accounting.formatNumber(t, e, "", "."));
}
function inclusiveTax(t, e) {
    return formatDecimal((parseFloat(t) * parseFloat(e)) / (100 + parseFloat(e)), 4);
}
function exlusiveTax(t, e) {
    return formatDecimal((parseFloat(t) * parseFloat(e)) / 100, 4);
}
function is_valid_discount(t) {
    return !(!is_numeric(t) && !/([0-9]%)/i.test(t));
}
function is_numeric(t) {
    return ("number" == typeof t || ("string" == typeof t && -1 === " \n\r\t\f\v??????????????????????????????????????\u2028\u2029???".indexOf(t.slice(-1)))) && "" !== t && !isNaN(t);
}
function is_float(t) {
    return !(+t !== t || (isFinite(t) && !(t % 1)));
}
function currencyFormat(t) {
    return null != t ? '<div class="text-right">' + formatMoney(t) + "</div>" : '<div class="text-right">0</div>';
}
function quantityFormat(t) {
    return null != t ? '<div class="text-center">' + formatQuantity(t) + "</div>" : '<div class="text-center">0</div>';
}
function formatSA(t) {
    var e = "";
    0 < (t = t.toString()).indexOf(".") && (e = t.substring(t.indexOf("."), t.length));
    var a = (t = (t = Math.floor(t)).toString()).substring(t.length - 3),
        n = t.substring(0, t.length - 3);
    return "" != n && (a = "," + a), n.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + a + e;
}
function cf(t) {
    return currencyFormat(t);
}
function pf(t) {
    return parseFloat(t);
}
function read_card() {
    $(".swipe")
        .keypress(function (t) {
            var e = $(this).attr("id"),
                a = e.substr(e.length - 1),
                n = $(this).val();
            if (13 == t.keyCode) {
                t.preventDefault();
                var r = new SwipeParserObj(n);
                if (r.hasTrack1) {
                    var o = null,
                        i = r.account.charAt(0);
                    (o = 4 == i ? "Visa" : 5 == i ? "MasterCard" : 3 == i ? "Amex" : 6 == i ? "Discover" : "Visa"),
                        $("#pcc_no_" + a).val(r.account),
                        $("#pcc_holder_" + a).val(r.account_name),
                        $("#pcc_month_" + a).val(r.exp_month),
                        $("#pcc_year_" + a).val(r.exp_year),
                        $("#pcc_cvv2_" + a).val(""),
                        $("#pcc_type_" + a).val(o);
                } else $("#pcc_no_" + a).val(""), $("#pcc_holder_" + a).val(""), $("#pcc_month_" + a).val(""), $("#pcc_year_" + a).val(""), $("#pcc_cvv2_" + a).val(""), $("#pcc_type_" + a).val("");
                $("#pcc_cvv2_" + a).focus();
            }
        })
        .blur(function (t) {
            $(this).val("");
        })
        .focus(function (t) {
            $(this).val("");
        });
}
function get(t) {
    if ("undefined" != typeof Storage) return localStorage.getItem(t);
    alert("Please use a modern browser as this site needs localstroage!");
}
function store(t, e) {
    "undefined" != typeof Storage ? localStorage.setItem(t, e) : alert("Please use a modern browser as this site needs localstroage!");
}
function remove(t) {
    "undefined" != typeof Storage ? localStorage.removeItem(t) : alert("Please use a modern browser as this site needs localstroage!");
}
function hrsd(t) {
    return null !== t ? date(dateformat, strtotime(t)) : t;
}
function hrld(t) {
    return null !== t ? date(dateformat + " " + timeformat, strtotime(t)) : t;
}
$(function () {
    function a() {
        return new Date().getTime();
    }
    cActions(),
        1 == Settings.rtl ? $(".select2").select2({ minimumResultsForSearch: 6, dir: "rtl" }) : $(".select2").select2({ minimumResultsForSearch: 6 }),
        $(document).on("click", '[data-toggle="ajax"]', function (t) {
            t.preventDefault();
            var e = $(this).attr("href");
            $.get(e, function (t) {
                return $("#posModal").html(t), $("#posModal").modal({ backdrop: "static" }), cActions(), !1;
            });
        }),
        $(document).on("click", '[data-toggle="ajax2"]', function (t) {
            t.preventDefault();
            var e = $(this).attr("href");
            $.get(e, function (t) {
                return t;
            });
        }),
        $(".clock").click(function (t) {
            return t.preventDefault(), !1;
        });
    var t = Math.floor(a() / 1e3),
        e = date(dateformat + " " + timeformat, t);
    $(".clock").text(e),
        window.setInterval(function () {
            var t = Math.floor(a() / 1e3),
                e = date(dateformat + " " + timeformat, t);
            $(".clock").text(e);
        }, 1e4),
        $(".modal").each(function (t) {
            $(this).on("show.bs.modal", function (t) {
                var e = $(this).attr("data-easein");
                $(".modal-dialog").velocity("transition." + e);
            });
        }),
        $(document).on("click", ".ajax-pagination a", function (t) {
            t.preventDefault();
            var e = $(this).attr("href");
            $.get(e, function (t) {
                return $("#posModal").html(t), $("#posModal").modal({ backdrop: "static" }), !1;
            });
        }),
        $(document).on("change", "#group", function (t) {
            1 == $(this).val() ? ($("#store_id").val(""), $("#store_id").select2("val", ""), $(".store-con").hide()) : $(".store-con").show();
        });
}),
    $(document)
        .ajaxStart(function () {
            $("#ajaxCall").show();
        })
        .ajaxStop(function () {
            $("#ajaxCall").hide();
        }),
    $(document).ready(function () {
        $(document).on("click", '[data-toggle="ajax-modal"]', function (t) {
            t.preventDefault();
            var e = $(this).attr("href");
            return (
                $.get(e).done(function (t) {
                    $("#myModal").html(t).modal({ backdrop: "static" });
                }),
                !1
            );
        }),
            $(".load_suspended").click(function (t) {
                t.preventDefault();
                var e = $(this).attr("href");
                if (get("spositems"))
                    return (
                        bootbox.confirm(lang.r_u_sure, function (t) {
                            1 == t && (window.location.href = e);
                        }),
                        !1
                    );
                window.location.href = e;
            }),
            $(".sign_out").click(function (t) {
                t.preventDefault();
                var e = $(this).attr("href");
                return (
                    bootbox.confirm("<strong>" + lang.register_open_alert + "</strong>", function (t) {
                        1 == t && (window.location.href = e);
                    }),
                    !1
                );
            });
    });
//# sourceMappingURL=maps/scripts.min.js.map
