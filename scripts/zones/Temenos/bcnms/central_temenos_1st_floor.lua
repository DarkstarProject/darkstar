-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 1st Floor
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)        
    SetServerVariable("[C_Temenos_1st]UniqueID",os.time());
    HideArmouryCrates(Central_Temenos_1st_Floor,TEMENOS);        
    HideTemenosDoor(Central_Temenos_1st_Floor);
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("characterLimbusKey",GetServerVariable("[C_Temenos_1st]UniqueID"));
    player:delKeyItem(COSMOCLEANSE);
    player:delKeyItem(WHITE_CARD);
end;

-- Leaving by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
    --print("leave code "..leavecode);
    if (leavecode == 4) then
        SetServerVariable("[C_Temenos_1st]UniqueID",0);
        player:setPos(580,-1.5,4.452,192);
    end
end;