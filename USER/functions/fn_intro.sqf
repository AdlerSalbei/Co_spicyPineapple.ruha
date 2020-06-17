params [["_color", "#FFFFFF"]];

0 fadeSound 0.1;

playMusic ["LeadTrack01_F_Tank", 0];
showChat false;

//Create black background
cutText ["","BLACK FADED", 999];

[{
    private _camera = "camera" camCreate (getPos camPos_01);
    _camera camSetPos (getPos camTarget_01);
    _camera camCommand "inertia on";
    _camera camSetTarget radio_1;
    _camera cameraEffect ["internal", "back"];
    _camera camSetFov 1;
    _camera camCommit 0;
    _camera camSetPos (getPos camPos_01);
    _camera camSetTarget camTarget_01;
    _camera camCommit 1;

    [{
        cutText ["","BLACK IN", 0];

        [{
			params ["_camera"];
			_camera camSetTarget radio_01;
			_camera camCommit 7;  
            _camera camSetPos (getPos camPos_02);
            _camera camCommit 15; 

            [{
				[ 
					parseText "<t font='PuristaBold' size='7' color='#000000'>COOP SPICY PINEAPPLE </t>", 
					[ 
						safezoneX + 0.18 * safezoneW, 
						safezoneY + 0.35 * safezoneH, 
						2, 
						1 
					], 
					nil, 
					3, 
					[4,0.5], 
					0 
				] spawn BIS_fnc_textTiles;        

                [{
                    params ["_camera"/*,"_filmgrain"*/];

                    cutText ["","BLACK FADED", 0];

                    if (isNil "GRAD_USER_introOver") then {
                        GRAD_USER_introOver = true;
                        publicVariable "GRAD_USER_introOver";
                    };                  

                    [{
                        cutText ["","BLACK IN", 10];
                        10 fadeSound 1;
                        [{
                            STHud_UIMode = 1;
                            diwako_dui_main_toggled_off = false;
                            showChat true;
                        }, [], 10] call CBA_fnc_waitAndExecute;
                    }, [], 3] call CBA_fnc_waitAndExecute;
                    
                    1.2 fadeMusic 0;
                    _camera cameraEffect ["terminate", "back"];
                    camDestroy _camera;

                    [{
                        playMusic "";
                        0 fadeMusic 1;
                    }, [], 10] call CBA_fnc_waitAndExecute
                }, _this, 24] call CBA_fnc_waitAndExecute;
            }, _this, 5] call CBA_fnc_waitAndExecute;
        }, _this, 5] call CBA_fnc_waitAndExecute;
    },[_camera], 5] call CBA_fnc_waitAndExecute;
},[], 1] call CBA_fnc_waitAndExecute;