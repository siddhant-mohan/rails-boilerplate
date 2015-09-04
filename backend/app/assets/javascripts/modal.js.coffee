window.rails = window.rails or {}

class Modal
	constructor: (wrapperId = 'global_modal')->
		@activateModal(wrapperId)
	activateModal: (wrapperId)->
		@wrapper = $('#'+wrapperId)
		@dialog = @wrapper.find('.modal-dialog')
		@header = @dialog.find('.modal-header')
		@body = @dialog.find('.modal-body')
		@wrapper.modal
			backdrop: 'static'
			show: false

	# unused method
	setHeaderText: (headerText)->
		@header.find('.modal-title').html(headerText)
	# unused method
	setBodyHtml: (innerHTML)->
		@body.html(innerHTML)
	show: ->
		@wrapper.modal('show')
	hide: ->
		@wrapper.modal('hide')
	toggleHelp: ()->
		@dialog.toggleClass('help-shown')
	toggleDetailedHelp: ->
		helpWrap = $('#modal-help-wrapper')
		helpWrap.toggleClass('detailed-help')
		helpWrap.find(".briefHelp,.detailedHelp").toggleClass('hidden')
		toggleBtn = helpWrap.find('#briefDetailedToggle')
		link_text=toggleBtn.text()
		if(link_text is "Detailed help")
			toggleBtn.html("Brief help")
		else
			toggleBtn.html("Detailed help")


Modal::loadRemoteHtml = (url)->
	that = @
	$.get(url, {}, 'json').then (responseHtml)->
		that.dialog.html(responseHtml)

Modal::showWithRemoteHtml = (url)->
	that = @
	@loadRemoteHtml(url).then ()->
		that.show()

rails.modal = new Modal()
