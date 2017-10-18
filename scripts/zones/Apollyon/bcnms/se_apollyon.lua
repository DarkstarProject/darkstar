-----------------------------------
-- Area: Appolyon
-- Name: SE Apollyon
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    SetServerVariable("[SE_Apollyon]UniqueID",os.time());
    HideArmouryCrates(SE_Apollyon,APOLLYON_SE_NE);
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("characterLimbusKey",GetServerVariable("[SE_Apollyon]UniqueID"));
    player:delKeyItem(COSMOCLEANSE);
    player:delKeyItem(BLACK_CARD);
end;
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish 

function onBcnmLeave(player,instance,leavecode)
    -- print("leave code "..leavecode);
    if (leavecode == 4) then
        SetServerVariable("[SE_Apollyon]UniqueID",0);
        player:setPos(643,0.1,-600);
    end
end;
