--------------------------
-- Area: Beadeaux
--  NPC: ??? (qm2)
-- Type: Quest NPC
-- !pos -79 1 -99 147
--------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
--------------------------

require("scripts/zones/Beadeaux/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/weather");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
-- TODO: The ??? should only spawn during rainy weather, temporary fix in place to prevent players from getting the keyitem unless the proper weather is present.
    if (player:getQuestStatus(BASTOK,BEADEAUX_SMOG) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CORRUPTED_DIRT) == false and player:getWeather() == dsp.weather.RAIN) then
        player:addKeyItem(dsp.ki.CORRUPTED_DIRT);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CORRUPTED_DIRT);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;