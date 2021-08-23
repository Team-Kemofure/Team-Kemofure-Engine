/// @param contactID
/// Removes a contact list

var menu = obj_overworldmenu;
ds_list_delete(menu.contactList, ds_list_find_index(menu.contactList, argument[0]));
ds_list_delete(menu.contactNameList, ds_list_find_index(menu.contactList, argument[0]));