-----------------------------------
-- Area: Davoi
--  NPC: Hide Flap
-- Involved in Quest: The Doorman, The First Meeting
-- !pos 293 3 -213 149 (WAR)(K-9)
-- !pos -124 3 -43 149 (MNK)(F-7)
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Davoi/TextIDs")
require("scripts/zones/Davoi/MobIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local offset = npc:getID() - HIDE_FLAP_OFFSET

    -- THE DOORMAN
    if offset == 0 and player:getQuestStatus(BASTOK, THE_DOORMAN) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.SWORD_GRIP_MATERIAL) then
        if player:getVar("theDoormanKilledNM") >= 2 then
            npcUtil.giveKeyItem(player, dsp.ki.SWORD_GRIP_MATERIAL)
            player:setVar("theDoormanMyMob", 0)
            player:setVar("theDoormanKilledNM", 0)
        elseif not GetMobByID(GAVOTVUT):isSpawned() and not GetMobByID(BARAKBOK):isSpawned() then
            SpawnMob(GAVOTVUT):updateClaim(player)
            SpawnMob(BARAKBOK):updateClaim(player)
            player:setVar("theDoormanMyMob", 1)
        end
        
    -- THE FIRST MEETING
    elseif offset == 1 and player:getQuestStatus(BASTOK, THE_FIRST_MEETING) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.SANDORIAN_MARTIAL_ARTS_SCROLL) then
        if player:getVar("theFirstMeetingKilledNM") >= 2 then
            npcUtil.giveKeyItem(player, dsp.ki.SANDORIAN_MARTIAL_ARTS_SCROLL)
            player:setVar("theFirstMeetingKilledNM",0)
        elseif not GetMobByID(BILOPDOP):isSpawned() and not GetMobByID(DELOKNOK):isSpawned() then
            SpawnMob(BILOPDOP):updateClaim(player)
            SpawnMob(DELOKNOK):updateClaim(player)
        end
        
    -- DEFAULT DIALOG
    else
        player:messageSpecial(YOU_SEE_NOTHING)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end