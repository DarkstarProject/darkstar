-----------------------------------
--  Area: Maze of Shakhrami
--  NPC:  qm2
--  Type: Quest NPC
--  @pos 143 9 -219 198
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local wyrm1 = 17588701;
    local wyrm2 = 17588702;
    local wyrm3 = 17588703;
    
    if (player:getQuestStatus(WINDURST,ECO_WARRIOR_WIN) ~= QUEST_AVAILABLE and 
        player:getVar("ECO_WARRIOR_ACTIVE") == 238 and 
        player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION) and 
        player:hasKeyItem(INDIGESTED_MEAT) == false) then
        
        if (player:getVar("ECOR_WAR_WIN-NMs_killed") == 1) then
            player:addKeyItem(INDIGESTED_MEAT);
            player:messageSpecial(KEYITEM_OBTAINED,INDIGESTED_MEAT);
        elseif (GetMobAction(wyrm1) + GetMobAction(wyrm1) + GetMobAction(wyrm1) == 0) then
            SpawnMob(wyrm1,180):updateClaim(player);
            SpawnMob(wyrm2,180):updateClaim(player);
            SpawnMob(wyrm3,180):updateClaim(player);
        end
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

