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
	}, 
	[], 
	15
] call CBA_fnc_waitAndExecute;

[{!(isNil "GRAD_USER_introOver")},{
	EAST setFriend [West, 0];
	WEST setFriend [EAST, 0];
},[]] call CBA_fnc_waitUntilAndExecute;