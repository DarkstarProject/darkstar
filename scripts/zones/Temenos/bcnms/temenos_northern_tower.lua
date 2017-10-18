-----------------------------------
-- Area: Temenos
-- Name: Temenos Northern Tower
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    SetServerVariable("[Temenos_N_Tower]UniqueID",os.time());
    HideArmouryCrates(Temenos_Northern_Tower,TEMENOS);        
    HideTemenosDoor(Temenos_Northern_Tower);    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:setVar("characterLimbusKey",GetServerVariable("[Temenos_N_Tower]UniqueID"));
    player:delKeyItem(COSMOCLEANSE);
    player:delKeyItem(WHITE_CARD);
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
    -- player:PrintToPlayer(leavecode);
    print("leave code "..leavecode);
    if (leavecode == 4) then
        SetServerVariable("[Temenos_N_Tower]UniqueID",0);
        player:setPos(580,-1.5,4.452,192);
    end
end;