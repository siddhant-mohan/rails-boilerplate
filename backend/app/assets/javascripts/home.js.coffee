# this
window.home = {}

home.forgotPassword = ()->
	alert 'forgot password'

home.toggleLeftPanel = ()->
	$('main').toggleClass('nav-expanded')

home.toggleHelp = ()->
	$('main').toggleClass('help-shown')
