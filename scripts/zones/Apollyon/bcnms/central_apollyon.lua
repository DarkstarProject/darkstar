-----------------------------------
-- Area: Appolyon
-- Name: Central Apollyon
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)        
    SetServerVariable("[Central_Apollyon]UniqueID",os.time());
    HideArmouryCrates(Central_Apollyon,APOLLYON_SE_NE);    
    GetNPCByID(16933248):setAnimation(8);
    if (GetMobByID():isSpawned(16933125)) then DespawnMob(16933125);end        
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("characterLimbusKey",GetServerVariable("[Central_Apollyon]UniqueID"));
    player:delKeyItem(COSMOCLEANSE);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish 

function onBcnmLeave(player,instance,leavecode)
    --print("leave code "..leavecode);
    if (leavecode == 4) then
        SetServerVariable("[Central_Apollyon]UniqueID",0);
        player:setPos(-668,0.1,-666);
    end
end;