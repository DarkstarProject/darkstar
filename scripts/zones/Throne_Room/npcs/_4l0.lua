-----------------------------------
-- Area: Throne Room
-- NPC:  Ore Door
-------------------------------------

require("scripts/globals/bcnm");

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

function onTrigger(player,npc)

    if player:hasKeyItem(dsp.ki.MEGA_BONANZA_KUPON) then
        --player:startEvent(4);
    end


    if (EventTriggerBCNM(player,npc)) then
        return 1;
    end
    
end;

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

function onEventFinish(player,csid,option)
    if (csid == 4) then
    end


    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
    
end;