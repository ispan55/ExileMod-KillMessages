Kill Messages By GR8
=============

Beautiful Kill Messages Notifications with lots of options. Eye Apealing and made for bragging for good kills.

Media
--------------------------
![Screenshot1](http://i.imgur.com/YCNRjiH.jpg)
![Screenshot2](http://i.imgur.com/V91ZeBu.jpg)

Installation
--------------------------

* Download [`KillMessages`](https://github.com/Gr8z/ExileMod-KillMessages/archive/master.zip),
* Move the `custom` folder into your Mission PBO.
* Open your `initPlayerLocal.sqf`.
* add `[] execVM "custom\KillMessages.sqf";` to the very top.
* Open your `ExileServer_object_player_event_onMpKilled.sqf` in your server PBO.
* Look for 
```
_killer setVariable ["ExileScore", _newKillerScore];
format["setAccountScore:%1:%2", _newKillerScore,getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];
```
* Replace it with this:
```
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

Gr8s_kill_msg = [(name _killer), _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
if (LogPlayerKills) then {format["logGr8Kill:%1:%2:%3:%4:%5:%6", (name _killer), getPlayerUID _killer, (name _victim), getPlayerUID _victim, _txt, floor(_victim distance _killer)] call ExileServer_system_database_query_insertSingle;};
if (ShowPlayerKills) then {publicVariable "Gr8s_kill_msg";};
```
* Look for 
```
["systemChatRequest", [format["%1 was killed by an NPC! (%2m Distance)", (name _victim), floor(_victim distance _killer)]]] call ExileServer_object_player_event_killfeed;
```
* Replace it with this:
```
_weapon = currentWeapon _killer;
_txt = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'displayName'));
_pic = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'picture'));
if (_pic == "") then {
   _weapon = typeOf (vehicle _killer);
   _pic = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'picture'));
   _txt = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'displayName'));
};
["systemChatRequest", [format["%1 was killed by an NPC! (%2m Distance)", (name _victim), floor(_victim distance _killer)]]] call ExileServer_object_player_event_killfeed;
// KILL MESSAGES BY GR8
Gr8s_kill_msg = ["NPC", _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
if (LogAIKills) then {format["logGr8Kill:%1:%2:%3:%4:%5:%6", "NPC", getPlayerUID _killer, (name _victim), getPlayerUID _victim, _txt, floor(_victim distance _killer)] call ExileServer_system_database_query_insertSingle;};
if (ShowAIKills) then {publicVariable "Gr8s_kill_msg";};	
```
* Open your `exile.ini` in your extDB folder.
* Paste this on the very bottom.
```

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Kill Messages By GR8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[logGr8Kill]
SQL1_1 = INSERT INTO kills SET killer_name = ?, killer_uid = ?, victim_name = ?, victim_uid = ?, weapon = ?, distance = ?, respect = ?, died_at = NOW()
Number Of Inputs = 7
SQL1_INPUTS = 1,2,3,4,5,6,7
Return InsertID = true

```
* Exucute `killfeed.sql` that came with the download into your database. (via PHPmyAdmin or HeidiSQL, etc)

* OPTIONAL : You can Check `KillMessages.sqf` in your custom folder to configure the settings.