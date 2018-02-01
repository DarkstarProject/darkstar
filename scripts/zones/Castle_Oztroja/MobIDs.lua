-----------------------------------
-- Area: Castle Oztroja (151)
-- Comments: -- posX, posY, posZ
-- (Taken from 'mob_spawn_points' table)
-----------------------------------
require("scripts/globals/status");

MEE_DEGGI_THE_PUNISHER_PH =
{
    [17395798] = 17395800, -- -207.840 -0.498 109.939
    [17395766] = 17395800, -- -178.119 -0.644 153.039
    [17395769] = 17395800, -- -188.253 -0.087 158.955
    [17395783] = 17395800, -- -233.116 -0.741 172.067
    [17395784] = 17395800, -- -254.302 -0.057 163.759
    [17395799] = 17395800, -- -227.415 -4.340 145.213
    [17395761] = 17395800, -- -207.370 -0.056 106.537
    [17395775] = 17395800, -- -235.639 -0.063 103.280
}

MOO_OUZI_THE_SWIFTBLADE_PH =
{
    [17395809] = 17395816, -- -18.415 -0.075 -92.889
    [17395813] = 17395816, -- -38.689 0.191 -101.068
}

QUU_DOMI_THE_GALLANT_PH =
{
    [17395844] = 17395870, -- 103.948 -1.250 -189.869
    [17395845] = 17395870, -- 67.103 -0.079 -176.981
    [17395853] = 17395870, -- 99.000 -0.181 -149.000
    [17395831] = 17395870, -- 46.861 0.343 -176.989
    [17395868] = 17395870, -- 35.847 -0.500 -101.685
    [17395867] = 17395870, -- 59.000 -4.000 -131.000
    [17395829] = 17395870, -- 33.832 -0.068 -176.627
}

YAA_HAQA_THE_PROFANE_PH =
{
    [17395950] = 17395954, -- -24.719 -16.250 -139.678
    [17395951] = 17395954, -- -22.395 -16.250 -139.341
    [17395952] = 17395954, -- -25.044 -16.250 -141.534
    [17395953] = 17395954, -- -32.302 -16.250 -139.169
}

local hdl = 17396196 -- Base handle for OZ_HANDLE_TABLE
OZ_HANDLE_TABLE =
{
    [0] = {[hdl] = ANIMATION_OPEN_DOOR, [hdl+1] = ANIMATION_OPEN_DOOR, [hdl+2] = ANIMATION_OPEN_DOOR, [hdl+3] = ANIMATION_OPEN_DOOR},
    [1] = {[hdl] = ANIMATION_OPEN_DOOR, [hdl+1] = ANIMATION_CLOSE_DOOR, [hdl+2] = ANIMATION_CLOSE_DOOR, [hdl+3] = ANIMATION_CLOSE_DOOR},
    [2] = {[hdl] = ANIMATION_CLOSE_DOOR, [hdl+1] = ANIMATION_OPEN_DOOR, [hdl+2] = ANIMATION_CLOSE_DOOR, [hdl+3] = ANIMATION_CLOSE_DOOR},
    [3] = {[hdl] = ANIMATION_CLOSE_DOOR, [hdl+1] = ANIMATION_OPEN_DOOR, [hdl+2] = ANIMATION_OPEN_DOOR, [hdl+3] = ANIMATION_CLOSE_DOOR},
    [4] = {[hdl] = ANIMATION_CLOSE_DOOR, [hdl+1] = ANIMATION_OPEN_DOOR, [hdl+2] = ANIMATION_CLOSE_DOOR, [hdl+3] = ANIMATION_OPEN_DOOR},
    [5] = {[hdl] = ANIMATION_OPEN_DOOR, [hdl+1] = ANIMATION_OPEN_DOOR, [hdl+2] = ANIMATION_CLOSE_DOOR, [hdl+3] = ANIMATION_OPEN_DOOR},
    [6] = {[hdl] = ANIMATION_CLOSE_DOOR, [hdl+1] = ANIMATION_CLOSE_DOOR, [hdl+2] = ANIMATION_OPEN_DOOR, [hdl+3] = ANIMATION_CLOSE_DOOR},
    [7] = {[hdl] = ANIMATION_CLOSE_DOOR, [hdl+1] = ANIMATION_CLOSE_DOOR, [hdl+2] = ANIMATION_CLOSE_DOOR, [hdl+3] = ANIMATION_OPEN_DOOR},
    [8] = {[hdl] = ANIMATION_OPEN_DOOR, [hdl+1] = ANIMATION_OPEN_DOOR, [hdl+2] = ANIMATION_CLOSE_DOOR, [hdl+3] = ANIMATION_CLOSE_DOOR},
};

OZ_PASSWORD_TABLE =
{
    [0] = {[1] = {15, "Deggi"}, [2] = {16, "Haqa"}, [3] = {17, "Mjuu"}},
    [1] = {[1] = {18, "Puqu"}, [2] = {19, "Ouzi"}, [3] = {20, "Duzu"}},
    [2] = {[1] = {21, "Gadu"}, [2] = {22, "Mong"}, [3] = {23, "Buxu"}},
    [3] = {[1] = {24, "Xicu"}, [2] = {17, "Mjuu"}, [3] = {21, "Gadu"}},
    [4] = {[1] = {16, "Haqa"}, [2] = {20, "Duzu"}, [3] = {21, "Gadu"}},
    [5] = {[1] = {21, "Gadu"}, [2] = {18, "Puqu"}, [3] = {22, "Mong"}},
    [6] = {[1] = {21, "Gadu"}, [2] = {23, "Buxu"}, [3] = {20, "Duzu"}},
    [7] = {[1] = {20, "Duzu"}, [2] = {15, "Deggi"}, [3] = {19, "Ouzi"}},
    [8] = {[1] = {17, "Mjuu"}, [2] = {19, "Ouzi"}, [3] = {23, "Buxu"}},
}

FIRST_PASSWORD_STATUE   = 17396168
SECOND_PASSWORD_STATUE  = 17396173
THIRD_PASSWORD_STATUE   = 17396178
FINAL_PASSWORD_STATUE   = 17396192

YAGUDO_AVATAR           = 17396134;

OZTROJA_TREASURE_CHEST  = 17396210;
OZTROJA_TREASURE_COFFER = 17396211;