-----------------------------------
-- Area: Windurst Waters
--  NPC: Piketo-Puketo
-- Type: Cooking Guild Master
-- @pos -124.012 -2.999 59.998 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_COOKING);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_COOKING,newRank);
        player:startEvent(0x271e,0,0,0,0,newRank);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_COOKING);
    local testItem = getTestItem(player,npc,SKILL_COOKING);
    local guildMember = isGuildMember(player,4);
    if (guildMember == 1) then guildMember = 150995375; end
    if (canGetNewRank(player,craftSkill,SKILL_COOKING) == 1) then getNewRank = 100; end

    player:startEvent(0x271d,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 0x03d2  0x03d7  0x03d4  0x03d5  0x271d  0x271e

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
    if (csid == 0x271d and option == 1) then
        local crystal = 4096; -- fire crystal

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
        else
            player:addItem(crystal);
            player:messageSpecial(ITEM_OBTAINED,crystal);
            signupGuild(player, guild.cooking);
        end
    end
end;