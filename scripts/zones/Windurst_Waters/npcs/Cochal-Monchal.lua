-----------------------------------
-- Area: Windurst Waters
--  NPC: Cochal-Monchal
-- Involved in Quest: Dark Legacy
-- !pos -52 -6 110 238
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getVar("darkLegacyCS") == 2) then
        player:startEvent(697,0,dsp.ki.DARKSTEEL_FORMULA);
    elseif (player:getVar("darkLegacyCS") == 3) then
        player:startEvent(698,0,dsp.ki.DARKSTEEL_FORMULA);
    elseif (player:hasKeyItem(dsp.ki.DARKSTEEL_FORMULA)) then
        player:startEvent(699,0,dsp.ki.DARKSTEEL_FORMULA);
    else
        player:startEvent(696);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 697) then
        player:setVar("darkLegacyCS",3);
        player:delKeyItem(dsp.ki.LETTER_FROM_THE_DARKSTEEL_FORGE);
    end

end;