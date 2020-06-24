enableSentences false;
enableRadio false;
enableSaving [false, false];

2 enableChannel false;  // command
4 enableChannel false;  // vehicle
5 enableChannel false;  // direct

// SCRIPTS =====================================================================
[] execVM "USER\userInit.sqf";

[
	"GRAD_seatPlayer", 
	{
		params ["_unit", "_chair"];
		
		[_chair, _unit] call acex_sitting_fnc_sit;
	}
] call CBA_fnc_addEventHandler;