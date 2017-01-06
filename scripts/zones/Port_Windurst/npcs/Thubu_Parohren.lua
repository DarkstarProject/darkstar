-----------------------------------
-- Area: Port Windurst
--  NPC: Thubu Parohren
-- Type: Fishing Guild Master
-- @pos -182.230 -3.835 61.373 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_FISHING);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_FISHING,newRank);
        player:startEvent(0x271a,0,0,0,0,newRank);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_FISHING);
    local testItem = getTestItem(player,npc,SKILL_FISHING);
    local guildMember = isGuildMember(player,5);
    if (guildMember == 1) then guildMember = 150995375; end
    if (canGetNewRank(player,craftSkill,SKILL_FISHING) == 1) then getNewRank = 100; end

    player:startEvent(0x2719,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 0x2719  0x271a  0x0253  0x0255

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
    if (csid == 0x2719 and option == 1) then
        local crystal = 4101; -- water crystal

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
        else
            player:addItem(crystal);
            player:messageSpecial(ITEM_OBTAINED,crystal);
            signupGuild(player, guild.fishing);
        end
    end
end;