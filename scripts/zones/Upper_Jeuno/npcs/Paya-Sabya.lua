-----------------------------------
-- Area: Upper Jeuno
--  NPC: Paya-Sabya
-- Involved in Mission: Magicite
-- !pos 9 1 70 244
-----------------------------------
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.SILVER_BELL) and player:hasKeyItem(dsp.ki.YAGUDO_TORCH) == false and player:getVar("YagudoTorchCS") == 0) then
        player:startEvent(80);
    else
        player:startEvent(79);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 80) then
        player:setVar("YagudoTorchCS",1);
    end

end;