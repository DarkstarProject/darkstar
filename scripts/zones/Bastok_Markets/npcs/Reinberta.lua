-----------------------------------
-- Area: Bastok Markets
--  NPC: Reinberta
-- Type: Goldsmithing Guild Master
-- !pos -190.605 -7.814 -59.432 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_GOLDSMITHING);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_GOLDSMITHING,newRank);
        player:startEvent(301,0,0,0,0,newRank);
    end
end;

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_GOLDSMITHING);
    local testItem = getTestItem(player,npc,SKILL_GOLDSMITHING);
    local guildMember = isGuildMember(player,6);
    if (guildMember == 1) then guildMember = 150995375; end
    if (canGetNewRank(player,craftSkill,SKILL_GOLDSMITHING) == 1) then getNewRank = 100; end

    player:startEvent(300,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 300  301  0x0192

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 300 and option == 1) then
        local crystal = 4096; -- fire crystal

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
        else
            player:addItem(crystal);
            player:messageSpecial(ITEM_OBTAINED,crystal);
            signupGuild(player, guild.goldsmithing);
        end
    end
end;