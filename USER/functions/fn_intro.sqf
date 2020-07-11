params [["_color", "#FFFFFF"]];

showChat false;
STHud_UIMode = 0;
diwako_dui_main_toggled_off = true;

//Create black background
cutText ["","BLACK FADED", 999];

[{
    private _camera = "camera" camCreate (getPos camPos_01);
    _camera camSetPos (getPos camTarget_01);
    _camera camCommand "inertia on";
    _camera camSetTarget radio_01;
    _camera cameraEffect ["internal", "back"];
    _camera camSetFov 1;
    _camera camCommit 0;
    _camera camSetPos (getPos camPos_01);
    _camera camSetTarget radio_01;
    _camera camCommit 1;
  
    if (hasInterface) then {
        radio_01 say3D ["radioSFP", 300, 1, false];
    };

    [{
        cutText ["","BLACK IN", 2];

        [{
			params ["_camera"]; 

            _camera camSetPos (getPos camPos_02);
            _camera camCommit 15; 

            [{
                params ["_camera"]; 

                _camera camSetPos (getPos camPos_03);
                _camera camSetTarget frame_02;
                _camera camCommit 15;

                [{
                    params ["_camera"]; 

                    _camera camSetPos (getPos camPos_04);
                    _camera camSetTarget frame_03;
                    _camera camCommit 15;

                    [{
                        params ["_camera"]; 

                        _camera camSetPos (getPos camPos_05);
                        _camera camSetTarget camTarget_01;
                        _camera camCommit 15;

                        [{
                            params ["_camera"]; 

                            _camera camSetPos (getPos camPos_06);
                            _camera camCommit 45;
                            _camera camSetTarget camTarget_02;
                            _camera camCommit 15;

                            [{
                                params ["_camera"]; 

                                if (isServer) then {
                                    frame_02 setObjectTextureGlobal [0, ""];
                                    frame_03 setObjectTextureGlobal [0, ""];
                                };
                                _camera camSetTarget camTarget_03;
                                _camera camCommit 15;

                                [{
                                    params ["_camera"]; 

                                    if (isServer) then {
                                        frame_01 setObjectTextureGlobal [0, "data\sweedish_adler.paa"];
                                    };
                                    _camera camSetTarget camTarget_04;
                                    _camera camCommit 15;

                                    [{
                                        params ["_camera"]; 

                                        _camera camSetPos (getPos camPos_07);
                                        _camera camSetTarget frame_01;
                                        _camera camCommit 15;

                                        [{
                                            if (isServer) then {
                                                frame_04 setObjectTextureGlobal [0, "data\missionName.paa"];
                                            };
                                            [{
                                                params ["_camera"]; 

                                                _camera camSetTarget frame_04;
                                                _camera camCommit 15;
                                                [{
                                                    if (isServer) then {
                                                        private _pos = getPosASL clusterPos_01;
                                                        
                                                        'BombCluster_01_Ammo_F' createVehicle (_pos vectorAdd [0,-380,500]);
                                                        'BombCluster_02_Ammo_F' createVehicle (_pos vectorAdd [25,-250,500]);
                                                        'BombCluster_03_Ammo_F' createVehicle (_pos vectorAdd [-25,-400,500]);
                                                    };
                                                    [{
                                                        params ["_camera"]; 
                                                        
                                                        if (isServer) then {
                                                            frame_01 setObjectTextureGlobal [0, ""];
                                                        };
                                                        
                                                        _camera camSetPos (getPos camPos_08);
                                                        _camera camSetTarget radio_01;
                                                        _camera camCommit 15;
                                                    
                                                        [{
                                                            params ["_camera"];

                                                            cutText ["","BLACK FADED", 0];

                                                            if (isNil "GRAD_USER_introOver") then {
                                                                GRAD_USER_introOver = true;
                                                                publicVariable "GRAD_USER_introOver";
                                                            };                  

                                                            [{
                                                                params ["_camera"]; 

                                                                    _camera cameraEffect ["terminate", "back"];
                                                                    camDestroy _camera;

                                                                    [{
                                                                        cutText ["","BLACK IN", 10];
                                                                        STHud_UIMode = 1;
                                                                        diwako_dui_main_toggled_off = false;
                                                                        showChat true;
                                                                    }, [], 5] call CBA_fnc_waitAndExecute
                                                                }, _this, 2] call CBA_fnc_waitAndExecute;
                                                            }, _this, 40] call CBA_fnc_waitAndExecute;
                                                        }, _this, 1] call CBA_fnc_waitAndExecute;
                                                }, _this, 14] call CBA_fnc_waitAndExecute;
                                            }, _this, 7] call CBA_fnc_waitAndExecute;
                                        }, _this, 8] call CBA_fnc_waitAndExecute;
                                    }, _this, 15] call CBA_fnc_waitAndExecute;
                                }, _this, 15] call CBA_fnc_waitAndExecute;
                            }, _this, 15] call CBA_fnc_waitAndExecute;
                        }, _this, 15] call CBA_fnc_waitAndExecute;
                    }, _this, 15] call CBA_fnc_waitAndExecute;
                }, _this, 15] call CBA_fnc_waitAndExecute;
            }, _this, 15] call CBA_fnc_waitAndExecute;
        }, _this, 5] call CBA_fnc_waitAndExecute;
    },[_camera], 1] call CBA_fnc_waitAndExecute;
},[], 1] call CBA_fnc_waitAndExecute;