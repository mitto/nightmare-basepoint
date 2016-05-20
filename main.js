var Nightmare = require('nightmare');
var vo = require('vo');
var moment = require("moment-timezone");
moment.tz.setDefault("Asia/Tokyo");
var today = moment().tz("Asia/Tokyo").format("YYYY-MM-DD.png")

vo(function* () {
    var nightmare = Nightmare({ show: false, waitTimeout: 5000 });
    var link = yield nightmare
        .goto('http://base.xpt.me/login')
        .type('#login_id', process.env.BASEPOINT_USER)
        .type('#login_pass', process.env.BASEPOINT_PASS)
        .click('#login_form > input.btn.btn-success')
        .wait('#lottery')
        .click('#lottery')
        .wait(2000)
        .screenshot(today)
        .goto('http://base.xpt.me/')
        .evaluate(function () {
            return document.getElementById('point').innerText;
        });
    yield nightmare.end();
    return link;
})(function (err, result) {
    if (err) return console.log(err);
    console.log(result);
});
