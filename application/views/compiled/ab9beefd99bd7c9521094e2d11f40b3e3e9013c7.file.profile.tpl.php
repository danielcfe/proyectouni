<?php /* Smarty version Smarty-3.1.14, created on 2013-11-06 12:04:25
         compiled from "application\views\templates\usuario\profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:25006527959cfa76964-06422039%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ab9beefd99bd7c9521094e2d11f40b3e3e9013c7' => 
    array (
      0 => 'application\\views\\templates\\usuario\\profile.tpl',
      1 => 1383739463,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '25006527959cfa76964-06422039',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_527959cfd1eda2_67551775',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_527959cfd1eda2_67551775')) {function content_527959cfd1eda2_67551775($_smarty_tpl) {?><div class="">
	<div id="user-profile-3" class="user-profile row">
		<div class="offset1 span10">
			<div class="well well-sm">
				<button type="button" class="close" data-dismiss="alert">×</button>
				&nbsp;
				<div class="inline middle blue bigger-110"> Your profile is 70% complete </div>

				&nbsp; &nbsp; &nbsp;
				<div style="width:200px;" data-percent="70%" class="inline middle no-margin progress progress-striped active">
					<div class="progress-bar progress-bar-success" style="width:70%"></div>
				</div>
			</div><!-- /well -->

			<div class="space"></div>

			<form class="form-horizontal">
				<div class="tabbable">
					<ul class="nav nav-tabs padding-16">
						<li class="active">
							<a data-toggle="tab" href="#edit-basic">
								<i class="green icon-edit bigger-125"></i>
								Basic Info
							</a>
						</li>

						<li class="">
							<a data-toggle="tab" href="#edit-settings">
								<i class="purple icon-cog bigger-125"></i>
								Settings
							</a>
						</li>

						<li class="">
							<a data-toggle="tab" href="#edit-password">
								<i class="blue icon-key bigger-125"></i>
								Password
							</a>
						</li>
					</ul>

					<div class="tab-content profile-edit-tab-content">
						<div id="edit-basic" class="tab-pane active">
							<h4 class="header blue bolder smaller">General</h4>

							<div class="row">
								<div class="col-xs-12 col-sm-4">
									<div class="ace-file-input ace-file-multiple"><input type="file"><label class="file-label" data-title="Change avatar"><span class="file-name" data-title="No File ..."><i class="icon-picture"></i></span></label><a class="remove" href="#"><i class="icon-remove"></i></a></div>
								</div>

								<div class="vspace-xs"></div>

								<div class="col-xs-12 col-sm-8">
									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-username">Username</label>

										<div class="col-sm-8">
											<input class="col-xs-12 col-sm-10" type="text" id="form-field-username" placeholder="Username" value="alexdoe">
										</div>
									</div>

									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-first">Name</label>

										<div class="col-sm-8">
											<input class="input-small" type="text" id="form-field-first" placeholder="First Name" value="Alex">
											<input class="input-small" type="text" id="form-field-last" placeholder="Last Name" value="Doe">
										</div>
									</div>
								</div>
							</div>

							<hr>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-date">Birth Date</label>

								<div class="col-sm-9">
									<div class="input-medium">
										<div class="input-group">
											<input class="input-medium date-picker" id="form-field-date" type="text" data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy">
											<span class="input-group-addon">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Gender</label>

								<div class="col-sm-9">
									<label class="inline">
										<input name="form-field-radio" type="radio" class="ace">
										<span class="lbl"> Male</span>
									</label>

									&nbsp; &nbsp; &nbsp;
									<label class="inline">
										<input name="form-field-radio" type="radio" class="ace">
										<span class="lbl"> Female</span>
									</label>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-comment">Comment</label>

								<div class="col-sm-9">
									<textarea id="form-field-comment"></textarea>
								</div>
							</div>

							<div class="space"></div>
							<h4 class="header blue bolder smaller">Contact</h4>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-email">Email</label>

								<div class="col-sm-9">
									<span class="input-icon input-icon-right">
										<input type="email" id="form-field-email" value="alexdoe@gmail.com">
										<i class="icon-envelope"></i>
									</span>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-website">Website</label>

								<div class="col-sm-9">
									<span class="input-icon input-icon-right">
										<input type="url" id="form-field-website" value="http://www.alexdoe.com/">
										<i class="icon-globe"></i>
									</span>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-phone">Phone</label>

								<div class="col-sm-9">
									<span class="input-icon input-icon-right">
										<input class="input-medium input-mask-phone" type="text" id="form-field-phone">
										<i class="icon-phone icon-flip-horizontal"></i>
									</span>
								</div>
							</div>

							<div class="space"></div>
							<h4 class="header blue bolder smaller">Social</h4>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-facebook">Facebook</label>

								<div class="col-sm-9">
									<span class="input-icon">
										<input type="text" value="facebook_alexdoe" id="form-field-facebook">
										<i class="icon-facebook blue"></i>
									</span>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-twitter">Twitter</label>

								<div class="col-sm-9">
									<span class="input-icon">
										<input type="text" value="twitter_alexdoe" id="form-field-twitter">
										<i class="icon-twitter light-blue"></i>
									</span>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-gplus">Google+</label>

								<div class="col-sm-9">
									<span class="input-icon">
										<input type="text" value="google_alexdoe" id="form-field-gplus">
										<i class="icon-google-plus red"></i>
									</span>
								</div>
							</div>
						</div>

						<div id="edit-settings" class="tab-pane">
							<div class="space-10"></div>

							<div>
								<label class="inline">
									<input type="checkbox" name="form-field-checkbox" class="ace">
									<span class="lbl"> Make my profile public</span>
								</label>
							</div>

							<div class="space-8"></div>

							<div>
								<label class="inline">
									<input type="checkbox" name="form-field-checkbox" class="ace">
									<span class="lbl"> Email me new updates</span>
								</label>
							</div>

							<div class="space-8"></div>

							<div>
								<label class="inline">
									<input type="checkbox" name="form-field-checkbox" class="ace">
									<span class="lbl"> Keep a history of my conversations</span>
								</label>

								<label class="inline">
									<span class="space-2 block"></span>

									for
									<input type="text" class="input-mini" maxlength="3">
									days
								</label>
							</div>
						</div>

						<div id="edit-password" class="tab-pane">
							<div class="space-10"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-pass1">New Password</label>

								<div class="col-sm-9">
									<input type="password" id="form-field-pass1">
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-pass2">Confirm Password</label>

								<div class="col-sm-9">
									<input type="password" id="form-field-pass2">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info" type="button">
							<i class="icon-ok bigger-110"></i>
							Save
						</button>

						&nbsp; &nbsp;
						<button class="btn" type="reset">
							<i class="icon-undo bigger-110"></i>
							Reset
						</button>
					</div>
				</div>
			</form>
		</div><!-- /span -->
	</div><!-- /user-profile -->
</div>
<?php }} ?>