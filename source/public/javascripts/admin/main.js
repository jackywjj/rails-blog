$(function() {
	$('.essay-category').change(function(){
		var category_id = $(this).val();
		var url = "/admin/posts/?category_id=" + category_id;
		window.location = url;
	});
	$('.photo-album').change(function(){
		var album_id = $(this).val();
		var url = "/admin/photos/?album_id=" + album_id;
		window.location = url;
	});
});