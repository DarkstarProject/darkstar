-----------------------------------
-- Area: Lower Jeuno
--  NPC: Muckvix
-- Involved in Mission: Magicite
-- !pos -26.824 3.601 -137.082 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.SILVER_BELL) and player:hasKeyItem(dsp.ki.YAGUDO_TORCH) == false) then
        if (player:getVar("YagudoTorchCS") == 1) then
            player:startEvent(184);
        else
            player:startEvent(80);
        end
    else
        player:startEvent(15);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 184) then
        player:addKeyItem(dsp.ki.YAGUDO_TORCH);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.YAGUDO_TORCH);
        player:setVar("YagudoTorchCS",0);
    end

end;