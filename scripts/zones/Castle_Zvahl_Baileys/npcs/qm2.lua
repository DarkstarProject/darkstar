-----------------------------------
--  Area: Castle Zvahl Baileys
--  NPC:  qm2 ???
--  Involved in quest: Better the Demon you Know
--  !pos 19.400 -24.141 19.185 161
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local DemonVar = player:getVar("BetterTheDemonYouKnowQuest");
    local BetterTheDemonYouKnow = player:getQuestStatus(OTHER_AREAS,BETTER_THE_DEMON_YOU_KNOW);

    if (BetterTheDemonYouKnow == QUEST_ACCEPTED and DemonVar == 2 and player:hasKeyItem(ZEELOZOKS_EARPLUG) == false) then
        if (player:getVar("MarquisAndrealphusKilled") == 1) then
            player:addKeyItem(ZEELOZOKS_EARPLUG);
            player:messageSpecial(KEYITEM_OBTAINED, ZEELOZOKS_EARPLUG);
            player:setVar("MarquisAndrealphusKilled",0);
            player:setVar("BetterTheDemonYouKnowQuest",3);
        else
            SpawnMob(17436966):updateClaim(player);
            SpawnMob(17436967):updateClaim(player);
            SpawnMob(17436968):updateClaim(player);
            SpawnMob(17436969):updateClaim(player);
            SpawnMob(17436970):updateClaim(player);
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