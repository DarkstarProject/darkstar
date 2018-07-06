-----------------------------------
-- Area: Apollyon
-- Name: SE_Apollyon (Slimes,Crabs,Skeletons,Weapons)
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    SetServerVariable("[SE_Apollyon]UniqueID",GenerateLimbusKey());
    HideArmouryCrates(GetInstanceRegion(1293),APOLLYON_SE_NE);
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("limbusbitmap",0);
    player:setVar("characterLimbusKey",GetServerVariable("[SE_Apollyon]UniqueID"));
    player:setVar("LimbusID",1293);
    player:delKeyItem(dsp.ki.COSMOCLEANSE);
    player:delKeyItem(dsp.ki.BLACK_CARD);
end;
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish

function onBcnmLeave(player,instance,leavecode)
  -- print("leave code "..leavecode);
   
    if (leavecode == 4) then
         player:setPos(643,0.1,-600);
        ResetPlayerLimbusVariable(player)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;