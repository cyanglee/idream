jQuery ->
	if $('#org_create').prop 'checked'
		# hide the existing org section and disabled the drop-down if the create new org is selected
		$('#existing_org').css display: "none"
		$('.existing_org').attr disabled: true
	
	$('#org_create').click ->
		$('.existing_org').attr disabled: true, 
		$('#existing_org').hide()
		$('#new_org').show()
		$('#new_org :input').attr disabled: false
		$('#new_organization :input[type=submit]').val('Create Organization')

	$('#org_pick').click ->
		$('.existing_org').attr disabled: false, 
		$('#existing_org').show()
		$('#new_org').hide()
		$('#new_org :input').attr disabled: true
		$('#new_organization :input[type=submit]').val('Associate with Organization')
