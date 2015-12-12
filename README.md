Kill Messages By GR8 ( Updated for Lime )
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
private["_victim","_killer","_victimPosition","_addDeathStat","_addKillStat","_normalkill","_killerRespectPoints","_fragAttributes","_player","_grpvictim","_grpkiller","_log","_lastVictims","_victimUID","_vehicleRole","_vehicle","_lastKillAt","_killStack","_distance","_distanceBonus","_flagNextToKiller","_homieBonus","_flagNextToVictim","_raidBonus","_overallRespectChange","_newKillerScore","_killMessage","_newKillerFrags","_newVictimDeaths"];
```
* Replace it with this :
```
private["_victim","_killer","_victimPosition","_addDeathStat","_addKillStat","_normalkill","_killerRespectPoints","_fragAttributes","_player","_grpvictim","_grpkiller","_log","_lastVictims","_victimUID",
"_vehicleRole","_vehicle","_lastKillAt","_killStack","_distance","_distanceBonus","_flagNextToKiller","_homieBonus","_flagNextToVictim","_raidBonus","_overallRespectChange","_newKillerScore","_killMessage",
"_newKillerFrags","_newVictimDeaths","_weapon","_txt","_pic"];
```
* Look for 
```
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
_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];

Gr8s_kill_msg = [(name _killer), _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
if (LogPlayerKills) then {format["logGr8Kill:%1:%2:%3:%4:%5:%6:%7", (name _killer), getPlayerUID _killer, (name _victim), getPlayerUID _victim, _txt, floor(_victim distance _killer), _overallRespectChange] call ExileServer_system_database_query_insertSingle;};
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
if (LogAIKills) then {format["logGr8Kill:%1:%2:%3:%4:%5:%6:%7", "NPC", getPlayerUID _killer, (name _victim), getPlayerUID _victim, _txt, floor(_victim distance _killer), 0] call ExileServer_system_database_query_insertSingle;};
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

Kill Feed
--------------------------
* With the latest update. Kills can now be logged in your database. Once you install/update this script. You will see Kill Logs In the `kills` table in your database. It will look something like this :
![Database](http://i.imgur.com/H2njhNM.png)

* This makes it easier to survailance your server or use this data to make a killboard on your website. Something like this :
[`Example`](http://ghostzgamerz.com/pages/exilekills/)
Note : This webpage is not included with this script.

BattlEye Filters
--------------------------
* Open up your `publicvariable.txt`
* Add this in the end of line #2:
```
 !="ShowAIKills" !="ShowPlayerKills" !="LogAIKills" !="LogPlayerKills"
```
* There are more filters needed but thats what i had to do for my servers.