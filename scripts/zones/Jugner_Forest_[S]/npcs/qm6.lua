-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: ???
-- Type: Quest NPC
-- !pos 68 -0.5 324 82
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Jugner_Forest_[S]/TextIDs");
require("scripts/zones/Jugner_Forest_[S]/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local cotgStat = player:getVar("ClawsOfGriffonProg");
    
    if (cotgStat == 1) then
        player:startEvent(201);
    elseif (player:getVar("FingerfilcherKilled") == 1) then
        player:startEvent(203);
    elseif (cotgStat == 2 and not GetMobByID(FINGERFILCHER_DRADZAD):isSpawned()) then
        player:startEvent(202);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 201) then
        player:setVar("ClawsOfGriffonProg", 2);
    elseif (csid == 202) then
        SpawnMob(FINGERFILCHER_DRADZAD):updateClaim(player);
    elseif (csid == 203) then
        npcUtil.completeQuest(player, CRYSTAL_WAR, CLAWS_OF_THE_GRIFFON, {item=8131, var="ClawsOfGriffonProg"});
    end
end;
