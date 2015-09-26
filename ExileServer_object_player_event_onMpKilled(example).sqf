_killer setVariable ["ExileScore", _newKillerScore];
_weapon = currentWeapon _killer;
_txt = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'displayName'));
_pic = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'picture'));
if (_pic == "") then {
	_weapon = typeOf (vehicle _killer);
	_pic = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'picture'));
	_txt = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'displayName'));
};
format["setAccountScore:%1:%2", _newKillerScore,getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];

// Kill Messages By GR8
Gr8s_kill_msg = [(name _killer), _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
publicVariable "Gr8s_kill_msg";