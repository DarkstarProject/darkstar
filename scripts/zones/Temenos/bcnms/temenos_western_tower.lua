-----------------------------------
-- Area: Temenos
-- Name: Temenos Western Tower
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/battlefield")
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end


function onBattlefieldRegister(player,battlefield)    
    SetServerVariable("[Temenos_W_Tower]UniqueID",os.time());
    HideArmouryCrates(Temenos_Western_Tower,TEMENOS);        
    HideTemenosDoor(Temenos_Western_Tower);        
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
    player:setCharVar("characterLimbusKey",GetServerVariable("[Temenos_W_Tower]UniqueID"));
    player:delKeyItem(dsp.ki.COSMOCLEANSE);
    player:delKeyItem(dsp.ki.WHITE_CARD);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBattlefieldLeave(player,battlefield,leavecode)
    --print("leave code "..leavecode);
    if leavecode == dsp.battlefield.leaveCode.LOST then
        SetServerVariable("[Temenos_W_Tower]UniqueID",0);
        player:setPos(580,-1.5,4.452,192);
    end
end;