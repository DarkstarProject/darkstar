-----------------------------------
-- Area: Bastok Mines
--  NPC: Abd-al-Raziq
-- Type: Alchemy Guild Master
-- !pos 126.768 1.017 -0.234 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_ALCHEMY);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_ALCHEMY,newRank);
        player:startEvent(121,0,0,0,0,newRank);
    end
end;

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_ALCHEMY);
    local testItem = getTestItem(player,npc,SKILL_ALCHEMY);
    local guildMember = isGuildMember(player,1);

    if (guildMember == 1) then guildMember = 150995375; end

    if (canGetNewRank(player,craftSkill,SKILL_ALCHEMY) == 1) then getNewRank = 100; end

    if (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD and guildMember == 150995375 and getNewRank ~= 100) then
        local item = 0;
        local asaStatus = player:getVar("ASA_Status");

        -- TODO: Other Enfeebling Kits
        if (asaStatus == 0) then
            item = 2779;
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
        end

        -- The Parameters are Item IDs for the Recipe
        player:startEvent(590, item, 2774, 929, 4103, 2777, 4103);
    else
        player:startEvent(120,testItem,getNewRank,30,guildMember,44,0,0,0);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 120 and option == 1) then
        local crystal = 4101; -- water crystal

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
        else
            player:addItem(crystal);
            player:messageSpecial(ITEM_OBTAINED,crystal);
            signupGuild(player, guild.alchemy);
        end
    end
end;