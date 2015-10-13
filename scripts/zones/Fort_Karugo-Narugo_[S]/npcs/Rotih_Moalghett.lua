----------------------------------
--  Area: Fort Karugo Narugo [S]
--  NPC: Rotih_Moalghett
--  Type: Quest
--  @zone: 96
--  @pos 280 -20 85
--
-----------------------------------

package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        if (player:getVar("TigressStrikesProg") == 1) then
        player:startEvent(0x0065);
        else
        player:startEvent(0x0068);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0066) then
        player:setVar("TigressStrikesProg",1);
    end
end;

