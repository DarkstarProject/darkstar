-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Burning Circle
-- @pos -221 -24 19 206
-------------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/QuBia_Arena/TextIDs");

-------------------------------------

    -- 0: The Ruins of Fei'Yin, Darkness Rising, The Final Seal (Rank 5 Mission)
    -- 1: Come Into My Parlor
    -- 2: E-vase-ive Action
    -- 3: Infernal Swarm
    -- 4: The Heir to the Light
    -- 5: Shattering Stars (Paladin)
    -- 6: Shattering Stars (Dark Knight)
    -- 7: Shattering Stars (Bard)
    -- 8: Demolition Squad
    -- 9: Die By the Sword
    -- 10: Let Sleeping Dogs Die
    -- 11: Brothers D'Aurphe
    -- 12: Undying Promise
    -- 13: Factory Rejects
    -- 14: Idol Thoughts
    -- 15: An Awful Autopsy
    -- 16: Celery
    -- 17: Mirror Images
    -- 18: A Furious Finale (Dancer)
    -- 19: Clash of the Comrades
    -- 20: Those Who Lurk in the Shadows (III)
    -- 21: Beyond Infinity

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    -- if (player:hasKeyItem(MARK_OF_SEED) and player:getCurrentMission(ACP) == THOSE_WHO_LURK_IN_SHADOWS_II) then
        --player:startEvent(0x005);
    --elseif (EventTriggerBCNM(player,npc)) then
    -- Temp disabled pending fixes for the BCNM mobs.

    if (EventTriggerBCNM(player,npc)) then
        return;
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (csid == 0x005) then
        player:completeMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_II);
        player:addMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_III);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;