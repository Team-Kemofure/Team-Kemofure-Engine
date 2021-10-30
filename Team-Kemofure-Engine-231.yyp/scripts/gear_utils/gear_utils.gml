#region Weapon
	
	/// @param weaponID
	/// Sets the weapon to the inventory
	function weapon_set() {
		global.playerwep = argument[0];
	}

	/// @param weaponID
	/// Removes a weapon from the inventory
	function weapon_remove() {
		global.playerwep = undefined;
	}
	
	/// @param weaponID
	/// Gets the name of a weapon
	function weapon_get_name() {
		switch (argument[0]) {
			default: return "Nothing"; break;
			case WEAPON.STICK: return "Stick"; break;
			case WEAPON.TOY_KNIFE: return "Toy Knife"; break;
		}
	}

	/// @param weaponID
	/// Gets the info of a weapon
	function weapon_get_info() {
		switch (argument[0]) {
			default: return {strength : 0, price : 0, keyName : undefined}; break;
			case WEAPON.STICK: return {strength : 0, price : 3, keyName : "stick"}; break;
			case WEAPON.TOY_KNIFE: return {strength : 2, price : 5, keyName : "toyknife"}; break;
		}
	}
	
#endregion

#region Armor
	
	/// @param armorID
	/// Sets the weapon to the inventory
	function armor_set() {
		global.playerarm = argument[0];
	}

	/// @param armorID
	/// Removes a weapon from the inventory
	function armor_remove() {
		global.playerarm = undefined;
	}
	
	/// @param weaponID
	/// Gets the name of a weapon
	function armor_get_name() {
		switch (argument[0]) {
			default: return "Nothing"; break;
			case ARMOR.BANDAGE: return "Bandage"; break;
			case ARMOR.FADED_RIBBON: return "Faded Ribbon"; break;
		}
	}

	/// @param weaponID
	/// Gets the info of a weapon
	function armor_get_info() {
		switch (argument[0]) {
			default: return {strength : 0, price : 0, keyName : undefined}; break;
			case ARMOR.BANDAGE: return {strength : 0, price : 3, keyName : "stick"}; break;
			case ARMOR.FADED_RIBBON: return {strength : 2, price : 5, keyName : "toyknife"}; break;
		}
	}
	
#endregion