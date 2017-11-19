-----------------------------------
--  Area: Beadeaux
--  NPC:  Ge'Fhu Yagudoeye
--  Type: Quest NPC
--  !pos -91.354 -4.251 -127.831 147
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beadeaux/TextIDs");
require("scripts/globals/keyitems");
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
    local Fragment = player:hasKeyItem(GLITTERING_FRAGMENT);
    local BirdsVar = player:getVar("ForTheBirdsQuest");
    local ForTheBirds = player:getQuestStatus(OTHER_AREAS,FOR_THE_BIRDS);
    local popCheck = GetServerVariable("ForTheBirds_5min_wait");

    if (Fragment == true and BirdsVar >= 2 and ForTheBirds == QUEST_ACCEPTED) then
        if (player:getVar("BirdsQuestQuadavsKilled") == 4) then
            player:startEvent(0x007c);
        elseif (os.time() > popCheck) then
            player:setVar("BirdsQuestQuadavsKilled",0);
            SpawnMob(17379784):updateClaim(player);
            SpawnMob(17379785):updateClaim(player);
            SpawnMob(17379786):updateClaim(player);
            SpawnMob(17379787):updateClaim(player);
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
    if (csid == 0x007c) then
        player:setVar("BirdsQuestQuadavsKilled",0);
        player:setVar("ForTheBirdsQuest",3);
        player:delKeyItem(GLITTERING_FRAGMENT);
    end
end;