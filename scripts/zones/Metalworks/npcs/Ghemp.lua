-----------------------------------
-- Area: Metalworks
--  NPC: Ghemp
-- Type: Smithing Guild Master
-- @pos -109 2 27 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_SMITHING);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_SMITHING,newRank);
        player:startEvent(0x0066,0,0,0,0,newRank);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_SMITHING);
    local testItem = getTestItem(player,npc,SKILL_SMITHING);
    local guildMember = isGuildMember(player,8);
    if (guildMember == 1) then guildMember = 150995375; end
    if (canGetNewRank(player,craftSkill,SKILL_SMITHING) == 1) then getNewRank = 100; end

    player:startEvent(0x0065,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 0x038c  0x038d  0x038e  0x0398  0x039f  0x0065  0x0066

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
    if (csid == 0x0065 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4096);
        else
            player:addItem(4096);
            player:messageSpecial(ITEM_OBTAINED,4096); -- Fire Crystal
            signupGuild(player,256);
        end
    end
end;