["Initialize"] call BIS_fnc_dynamicGroups;

EAST setFriend [West, 1];
WEST setFriend [EAST, 1];

[
	{
		private _allPlayers = [];
		{
			if (
				isPlayer _x 
				//&& {isNull (getAssignedCuratorLogic _x)}
			) then {
				_allPlayers pushBackUnique _x;
			};
		}forEach playableUnits + switchableUnits;

		[
			{
				[] call GRAD_USER_fnc_intro;
			}
		] remoteExecCall ["call", _allPlayers];

		[chair_01, rifleman_01] call acex_sitting_fnc_sit;
		[chair_02, rifleman_02] call acex_sitting_fnc_sit;
		[chair_03, rifleman_03] call acex_sitting_fnc_sit;

		[] call GRAD_USER_fnc_intro;
	}, 
	[], 
	15
] call CBA_fnc_waitAndExecute;

[{!(isNil "GRAD_USER_introOver")},{
	EAST setFriend [West, 0];
	WEST setFriend [EAST, 0];
},[]] call CBA_fnc_waitUntilAndExecute;