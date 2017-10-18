-----------------------------------
-- Area: Appolyon
-- Name: NW Apollyon
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)        
    SetServerVariable("[NW_Apollyon]UniqueID",os.time());
    HideArmouryCrates(NW_Apollyon,APOLLYON_NW_SW);
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("characterLimbusKey",GetServerVariable("[NW_Apollyon]UniqueID"));
    player:delKeyItem(COSMOCLEANSE);
    player:delKeyItem(RED_CARD);
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish 

function onBcnmLeave(player,instance,leavecode)
    --print("leave code "..leavecode);
    if (leavecode == 4) then
        SetServerVariable("[NW_Apollyon]UniqueID",0);
        player:setPos(-668,0.1,-666);
    end
end;