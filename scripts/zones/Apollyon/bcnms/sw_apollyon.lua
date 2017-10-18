-----------------------------------
-- Area: Appolyon
-- Name: SW Apollyon
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    SetServerVariable("[SW_Apollyon]UniqueID",os.time());
    HideArmouryCrates(SW_Apollyon,APOLLYON_NW_SW);
    SetServerVariable("[SW_Apollyon]MimicTrigger",0);    
    SetServerVariable("[SW_Apollyon]ElementalTrigger",0);
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("characterLimbusKey",GetServerVariable("[SW_Apollyon]UniqueID"));
    player:delKeyItem(COSMOCLEANSE);
    player:delKeyItem(RED_CARD);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish

function onBcnmLeave(player,instance,leavecode)
    if (leavecode == 4) then
        SetServerVariable("[SW_Apollyon]UniqueID",0);
        player:setPos(-668,0.1,-666);
    end
end;