<script src="//code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$(".draggable").draggable();
	});
</script>

<div id="profile-widget" class="text-center draggable">
	<img class="img-circle profile-img" src="assets/img/profile_img.jpg"
		height="100" width="100" alt="">
	<div class="btn-group" id="profile-wdiget-button-container"
		role="group">
		<button type="button" class="btn btn-default btn-xs"
			aria-label="Settings">
			<span class="glyphicon glyphicon-cog" data-toggle="tooltip"
				title="Settings"></span>
		</button>
		<button type="button" class="btn btn-default btn-xs"
			aria-label="Notifications">
			<span class="glyphicon glyphicon-bell" data-toggle="tooltip"
				title="Alerts"></span>
		</button>
		<button type="button" class="btn btn-default btn-xs"
			aria-label="Notifications">
			<span class="glyphicon glyphicon-heart" data-toggle="tooltip"
				title="Endorsements"></span>
		</button>
		<button type="button" class="btn btn-default btn-xs"
			aria-label="Notifications">
			<span class="glyphicon glyphicon-inbox" data-toggle="tooltip"
				title="Messages"></span>
		</button>
	</div>
</div>