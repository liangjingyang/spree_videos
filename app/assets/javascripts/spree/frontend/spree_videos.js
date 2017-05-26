// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'
$(document).on('click', '#video-thumbnails', function (event) {
    var old_src = $(".video-player > iframe").attr("src");
    var old_video_id = old_src.match(/embed\/(.+)?\?/)[1];
    var new_video_id = event.target.getAttribute("data-video-id");
    var new_src = old_src.replace(new RegExp(old_video_id, 'g'), new_video_id);
    $(".video-player > iframe").attr("src", new_src);
});
