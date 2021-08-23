/// @param contactName
/// @param contactID
/// Adds a contact list
function call_list_add() {

	ds_list_add(obj_overworldmenu.contactNameList, argument[0]);
	ds_list_add(obj_overworldmenu.contactList, argument[1]);


}
