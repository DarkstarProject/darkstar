-----------------------------------
-- Area: San d'Oria-Jeuno Airship
--  NPC: ???
-- Involved In Quest: The Stars Of Ifrit
-- !pos -9 -5 -13 223
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/weather");
local ID = require("scripts/zones/San_dOria-Jeuno_Airship/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TOTD = VanadielTOTD();
    local TheStarsOfIfrit = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.THE_STARS_OF_IFRIT);

    if (TOTD == dsp.time.NIGHT and IsMoonFull()) then
        if (TheStarsOfIfrit == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CARRIER_PIGEON_LETTER) == false) then
            player:addKeyItem(dsp.ki.CARRIER_PIGEON_LETTER);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CARRIER_PIGEON_LETTER);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;