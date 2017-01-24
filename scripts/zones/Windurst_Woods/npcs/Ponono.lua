-----------------------------------
-- Area: Windurst Woods
--  NPC: Ponono
-- Type: Clothcraft Guild Master
-- @pos -38.243 -2.25 -120.954 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_CLOTHCRAFT);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_CLOTHCRAFT,newRank);
        player:startEvent(0x271c,0,0,0,0,newRank);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_CLOTHCRAFT);
    local testItem = getTestItem(player,npc,SKILL_CLOTHCRAFT);
    local guildMember = isGuildMember(player,3);
    if (guildMember == 1) then guildMember = 10000; end
    if (canGetNewRank(player,craftSkill,SKILL_CLOTHCRAFT) == 1) then getNewRank = 100; end

    player:startEvent(0x271b,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 0x271b  0x271c  0x02bc  0x02bd  0x02be  0x02bf  0x02c0  0x02c1  0x0340  0x02fd

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
    if (csid == 0x271b and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4099);
        else
            player:addItem(4099); -- earth crystal
            player:messageSpecial(ITEM_OBTAINED,4099);
            signupGuild(player, guild.clothcraft);
        end
    end
end;