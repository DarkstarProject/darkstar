-----------------------------------
-- ???
-- WOGT Quest
-- @pos 150 -39 331 95
-----------------------------------

require("scripts/globals/keyitems");
local text = require("scripts/zones/West_Sarutabaruta_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)==QUEST_ACCEPTED and player:hasKeyItem(SMALL_STARFRUIT)==false) then
        player:addKeyItem(SMALL_STARFRUIT);
        player:messageSpecial(text.KEYITEM_OBTAINED, SMALL_STARFRUIT);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;