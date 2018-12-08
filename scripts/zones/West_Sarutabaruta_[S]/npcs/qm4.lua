-----------------------------------
-- ???
-- WOGT Quest
-- !pos 150 -39 331 95
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)==QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.SMALL_STARFRUIT)==false) then
        player:addKeyItem(dsp.ki.SMALL_STARFRUIT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SMALL_STARFRUIT);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

end;