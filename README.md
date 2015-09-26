Kill Messages By GR8
=============

Beautiful Kill Messages Notfications with lots of options. Eye Apealing and made for bragging for good kills.

Installation
--------------------------

1. Download [`KillMessages`](https://github.com/Gr8z/ExileMod-KillMessages/archive/master.zip),
2. Move the `custom` folder into your Mission PBO.
3. Open your `initPlayerLocal.sqf`.
4. add `[] execVM "custom\KillMessages.sqf";` to the very top.
5. Open your `ExileServer_object_player_event_onMpKilled` in your server PBO.
6. Look for `_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];`
7. Replace it with this:
```
_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];

// Kill Messages By GR8				
if (ShowPlayerKills) then {
	Gr8s_kill_msg = [(name _killer), _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
	publicVariable "Gr8s_kill_msg";
};
```
8. Look for `_log = format["%1 was killed by an AI! (%2m Distance)", (name _victim), floor(_victim distance _killer)];`
9. Replace it with:
```
_log = format["%1 was killed by an AI! (%2m Distance)", (name _victim), floor(_victim distance _killer)];

// Kill Messages By GR8	
if (ShowAIKills) then {
	Gr8s_kill_msg = ["AI", _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
	publicVariable "Gr8s_kill_msg";
};
```
10. OPTIONAL : You can Check `KillMessages.sqf` in your custom folder to configure the settings.