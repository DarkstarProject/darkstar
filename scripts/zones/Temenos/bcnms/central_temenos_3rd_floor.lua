-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 3rd Floor
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    SetServerVariable("[C_Temenos_3rd]UniqueID",GenerateLimbusKey());
    HideArmouryCrates(GetInstanceRegion(1305),TEMENOS);
    HideTemenosDoor(GetInstanceRegion(1305));
    player:setVar("Limbus_Trade_Item-T",0);
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("limbusbitmap",0);
    player:setVar("characterLimbusKey",GetServerVariable("[C_Temenos_3rd]UniqueID"));
    player:setVar("LimbusID",1305);
    player:delKeyItem(dsp.ki.COSMOCLEANSE);
    player:delKeyItem(dsp.ki.WHITE_CARD);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish the dynamis

function onBcnmLeave(player,instance,leavecode)
    --print("leave code "..leavecode);
    ResetPlayerLimbusVariable(player)
    if (leavecode == 4) then
        player:setPos(580,-1.5,4.452,192);
    end
end;