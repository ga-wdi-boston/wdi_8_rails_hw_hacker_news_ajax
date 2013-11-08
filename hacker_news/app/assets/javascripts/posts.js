var HackerNews = {};

HackerNews.render_post = function(post_data) {
	$('#all-posts').append(
		"<div id=\"post-" + post_data.id + "\">" + 
			"<h3>" + post_data.title + "</h3>" +
			"<div>" + post_data.link + "</div>" +
			"<div>" + post_data.body + "</div>" + 
			"<div>Votes: <span class=\"num-votes\">0</span></div>" +
		"</div>"
	);
};

$(document).ready(function(){
	$('.delete-post').click(function(e){
		var matcher, post_id_string, post_id;
		e.preventDefault();
		matcher = /\d+/;
		post_id_string = this.parentElement.id;
		post_id = matcher.exec(post_id_string)[0]; 
		$.ajax({
			url: '/posts/' + post_id,
			dataType: 'script',
			type: 'DELETE',
			success: function(data){}
		});
		return false;
	});

	$('#post-form-submit').click(function(e){
		// Stops the form from doing a normal submit
		e.preventDefault();

		// Grabs the values from the form
		var title = $('#post-form-title').val();
		var link = $('#post-form-link').val();
		var body = $('#post-form-body').val();

		// Clears the values of the form fields for display
		$('#post-form-title').val('');
		$('#post-form-link').val('');
		$('#post-form-body').val('');

		// Make the Ajax call to create the new post. 
		// This ajax will evaluate as truthy, turning it back on for a normal submit
		$.ajax({
			url: '/posts',
			data: {post: {title: title, link: link, body: body}},
			dataType: 'json',
			type: 'POST',
			success: function(data){
				HackerNews.render_post(data);
			}
		});
		// Return false so the value of this button isn't truthy, and doesn't submit
		return false;
	});
});
