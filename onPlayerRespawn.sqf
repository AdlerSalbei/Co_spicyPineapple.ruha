["Terminate"] call BIS_fnc_EGSpectator;

if (([missionConfigFile >> "missionSettings" >> "respawnSettings" >> "waveRespawnEnabled", "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1) then {
    [] call grad_waverespawn_fnc_onPlayerRespawn;
};
