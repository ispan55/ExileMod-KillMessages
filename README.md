Kill Messages By GR8
=============

Beautiful Kill Messages Notfications with lots of options. Eye Apealing and made for bragging for good kills.

Installation
--------------------------

* Download [`KillMessages`](https://github.com/Gr8z/ExileMod-KillMessages/archive/master.zip),
* Move the `custom` folder into your Mission PBO.
* Open your `initPlayerLocal.sqf`.
* add `[] execVM "custom\KillMessages.sqf";` to the very top.
* Open your `ExileServer_object_player_event_onMpKilled` in your server PBO.
* Look for 
```
_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];
```
* Replace it with this:
```
_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];

// Kill Messages By GR8				
if (ShowPlayerKills) then {
	Gr8s_kill_msg = [(name _killer), _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
	publicVariable "Gr8s_kill_msg";
};
```

* OPTIONAL : You can Check `KillMessages.sqf` in your custom folder to configure the settings.